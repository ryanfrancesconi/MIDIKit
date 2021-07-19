//
//  UniversalType.swift
//  MIDIKit • https://github.com/orchetect/MIDIKit
//

extension MIDI.Event.SysEx {
	
	/// Type describing a Universal System Exclusive message type.
    public enum UniversalType: MIDI.Byte, Hashable {
		
		/// Real Time System Exclusive ID number.
		case realTime = 0x7E
		
		/// Non-Real Time System Exclusive ID number.
		case nonRealTime = 0x7F
		
	}
	
}

extension MIDI.Event.SysEx.UniversalType: CustomStringConvertible {
    
    public var description: String {
        
        switch self {
        case .realTime: return "realTime"
        case .nonRealTime: return "nonRealTime"
        }
        
    }
    
}
