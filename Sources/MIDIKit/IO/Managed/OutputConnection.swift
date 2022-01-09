//
//  OutputConnection.swift
//  MIDIKit • https://github.com/orchetect/MIDIKit
//

import Foundation
@_implementationOnly import CoreMIDI

extension MIDI.IO {
    
    /// A managed MIDI output connection created in the system by the `Manager`.
    /// This connects to an external input in the system and outputs MIDI events to it.
    public class OutputConnection: _MIDIIOManagedProtocol {
        
        // _MIDIIOManagedProtocol
        internal weak var midiManager: MIDI.IO.Manager?
        
        // MIDIIOManagedProtocol
        public private(set) var api: MIDI.IO.APIVersion
        public var midiProtocol: MIDI.IO.ProtocolVersion { api.midiProtocol }
        
        // _MIDIIOSendsMIDIMessagesProtocol
        internal var outputPortRef: MIDI.IO.CoreMIDIPortRef? = nil
        
        // class-specific
        
        public var inputsCriteria: [MIDI.IO.EndpointIDCriteria<MIDI.IO.InputEndpoint>]
        internal var inputEndpointRefs: [MIDI.IO.CoreMIDIEndpointRef?] = []
        
        // init
        
        /// - Parameters:
        ///   - toInputs: Input(s) to connect to.
        ///   - midiManager: Reference to I/O Manager object.
        ///   - api: Core MIDI API version.
        internal init(
            toInputs: [MIDI.IO.EndpointIDCriteria<MIDI.IO.InputEndpoint>],
            midiManager: MIDI.IO.Manager,
            api: MIDI.IO.APIVersion = .bestForPlatform()
        ) {
            
            self.inputsCriteria = toInputs
            self.midiManager = midiManager
            self.api = api.isValidOnCurrentPlatform ? api : .bestForPlatform()
            
        }
        
        deinit {
            
            _ = try? closeOutput()
            
        }
        
    }
    
}

extension MIDI.IO.OutputConnection {
    
    /// Returns the input endpoint(s) this connection is connected to.
    public var endpoints: [MIDI.IO.InputEndpoint] {
        
        inputEndpointRefs.compactMap {
            if let unwrapped = $0 {
                return MIDI.IO.InputEndpoint(unwrapped)
            } else { return nil }
        }
        
    }
    
}

extension MIDI.IO.OutputConnection {
    
    /// Set up a single "invisible" output port which can send events to all inputs.
    ///
    /// - Parameter manager: MIDI manager instance by reference
    ///
    /// - Throws: `MIDI.IO.MIDIError`
    internal func setupOutput(in manager: MIDI.IO.Manager) throws {
        
        guard outputPortRef == nil else {
            // if we already set the output port up, it's not really an error condition
            // so just return; don't throw an error
            return
        }
        
        var newOutputPortRef = MIDIPortRef()
        
        // connection name must be unique, otherwise process might hang (?)
        try? MIDIOutputPortCreate(
            manager.coreMIDIClientRef,
            UUID().uuidString as CFString,
            &newOutputPortRef
        )
        .throwIfOSStatusErr()
        
        outputPortRef = newOutputPortRef
        
    }
    
    /// Disposes of the output port if it exists.
    internal func closeOutput() throws {
        
        guard let unwrappedOutputPortRef = outputPortRef else { return }
        
        defer { self.outputPortRef = nil }
        
        try MIDIPortDispose(unwrappedOutputPortRef)
            .throwIfOSStatusErr()
        
    }
    
    /// Resolve MIDI Input(s) criteria to concrete reference IDs and cache them.
    /// 
    /// - Parameter manager: MIDI manager instance by reference
    ///
    /// - Throws: `MIDI.IO.MIDIError`
    internal func resolveEndpoints(in manager: MIDI.IO.Manager) throws {
        
        // resolve criteria to endpoints in the system
        let getInputEndpointRefs = inputsCriteria
            .map {
                $0.locate(in: manager.endpoints.inputs)?
                    .coreMIDIObjectRef
            }
        
        inputEndpointRefs = getInputEndpointRefs
        
    }
    
}

extension MIDI.IO.OutputConnection {
    
    /// Refresh the connection.
    /// This is typically called after receiving a Core MIDI notification that system port configuration has changed or endpoints were added/removed.
    internal func refreshConnection(in manager: MIDI.IO.Manager) throws {
        
        // call (re-)connect only if at least one matching endpoint exists in the system
        
        let getSystemInputs = manager.endpoints.inputs
        
        var matchedEndpointCount = 0
        
        for criteria in inputsCriteria {
            if criteria.locate(in: getSystemInputs) != nil { matchedEndpointCount += 1 }
        }
        
        guard matchedEndpointCount > 0 else { return }
        
        try resolveEndpoints(in: manager)
        
    }
    
}

extension MIDI.IO.OutputConnection: CustomStringConvertible {
    
    public var description: String {
        
        let inputEndpointsString: [String] = inputEndpointRefs
            .map {
                var str = ""
                
                // ref
                if let unwrapped = $0 {
                    // ref
                    str = "\(unwrapped):"
                    
                    // name
                    if let getName = try? MIDI.IO.getName(of: unwrapped) {
                        str += "\(getName)".quoted
                    } else {
                        str += "nil"
                    }
                } else {
                    str = "nil"
                }
                
                return str
            }
        
        var outputPortRefString: String = "nil"
        if let unwrappedOutputPortRef = outputPortRef {
            outputPortRefString = "\(unwrappedOutputPortRef)"
        }
        
        return "OutputConnection(criteria: \(inputsCriteria), inputEndpointRefs: \(inputEndpointsString), outputPortRef: \(outputPortRefString))"
        
    }
    
}

extension MIDI.IO.OutputConnection: MIDIIOSendsMIDIMessagesProtocol {
    
    // empty
    
}

extension MIDI.IO.OutputConnection: _MIDIIOSendsMIDIMessagesProtocol {
    
    internal func send(packetList: UnsafeMutablePointer<MIDIPacketList>) throws {
        
        guard let unwrappedOutputPortRef = self.outputPortRef else {
            throw MIDI.IO.MIDIError.internalInconsistency(
                "Output port reference is nil."
            )
        }
        
        // dispatch the packetlist to each input independently
        // but we can use the same output port
        
        for inputEndpointRef in inputEndpointRefs {
            
            if let unwrappedInputEndpointRef = inputEndpointRef {
                
                // ignore errors with try? since we don't want to return early in the event that sending to subsequent inputs may succeed
                try? MIDISend(unwrappedOutputPortRef,
                              unwrappedInputEndpointRef,
                              packetList)
                    .throwIfOSStatusErr()
                
            }
            
        }
        
    }
    
    @available(macOS 11, iOS 14, macCatalyst 14, tvOS 14, watchOS 7, *)
    internal func send(eventList: UnsafeMutablePointer<MIDIEventList>) throws {
        
        guard let unwrappedOutputPortRef = self.outputPortRef else {
            throw MIDI.IO.MIDIError.internalInconsistency(
                "Output port reference is nil."
            )
        }
        
        // dispatch the eventlist to each input independently
        // but we can use the same output port
        
        for inputEndpointRef in inputEndpointRefs {
            
            if let unwrappedInputEndpointRef = inputEndpointRef {
                
                // ignore errors with try? since we don't want to return early in the event that sending to subsequent inputs may succeed
                try? MIDISendEventList(unwrappedOutputPortRef,
                                       unwrappedInputEndpointRef,
                                       eventList)
                    .throwIfOSStatusErr()
                
            }
            
        }
        
    }
    
}
