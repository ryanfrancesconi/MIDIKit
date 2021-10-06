//
//  Note CC Registered init.swift
//  MIDIKit • https://github.com/orchetect/MIDIKit
//

extension MIDI.Event.Note.CC.Controller.Registered {
    
    /// Initialize an enum case from the controller number.
    @inline(__always)
    public init(number: UInt8) {
        
        switch number {
        
        case   1: self = .modWheel
        case   2: self = .breath
        case   3: self = .pitch7_25
        case   4: self = .undefined(.cc4)
        case   5: self = .undefined(.cc5)
        case   6: self = .undefined(.cc6)
        case   7: self = .volume
        case   8: self = .balance
        case   9: self = .undefined(.cc9)
        case  10: self = .pan
        case  11: self = .expression
        case  12: self = .undefined(.cc12)
        case  13: self = .undefined(.cc13)
        case  14: self = .undefined(.cc14)
        case  15: self = .undefined(.cc15)
        case  16: self = .undefined(.cc16)
        case  17: self = .undefined(.cc17)
        case  18: self = .undefined(.cc18)
        case  19: self = .undefined(.cc19)
        case  20: self = .undefined(.cc20)
        case  21: self = .undefined(.cc21)
        case  22: self = .undefined(.cc22)
        case  23: self = .undefined(.cc23)
        case  24: self = .undefined(.cc24)
        case  25: self = .undefined(.cc25)
        case  26: self = .undefined(.cc26)
        case  27: self = .undefined(.cc27)
        case  28: self = .undefined(.cc28)
        case  29: self = .undefined(.cc29)
        case  30: self = .undefined(.cc30)
        case  31: self = .undefined(.cc31)
        case  32: self = .undefined(.cc32)
        case  33: self = .undefined(.cc33)
        case  34: self = .undefined(.cc34)
        case  35: self = .undefined(.cc35)
        case  36: self = .undefined(.cc36)
        case  37: self = .undefined(.cc37)
        case  38: self = .undefined(.cc38)
        case  39: self = .undefined(.cc39)
        case  40: self = .undefined(.cc40)
        case  41: self = .undefined(.cc41)
        case  42: self = .undefined(.cc42)
        case  43: self = .undefined(.cc43)
        case  44: self = .undefined(.cc44)
        case  45: self = .undefined(.cc45)
        case  46: self = .undefined(.cc46)
        case  47: self = .undefined(.cc47)
        case  48: self = .undefined(.cc48)
        case  49: self = .undefined(.cc49)
        case  50: self = .undefined(.cc50)
        case  51: self = .undefined(.cc51)
        case  52: self = .undefined(.cc52)
        case  53: self = .undefined(.cc53)
        case  54: self = .undefined(.cc54)
        case  55: self = .undefined(.cc55)
        case  56: self = .undefined(.cc56)
        case  57: self = .undefined(.cc57)
        case  58: self = .undefined(.cc58)
        case  59: self = .undefined(.cc59)
        case  60: self = .undefined(.cc60)
        case  61: self = .undefined(.cc61)
        case  62: self = .undefined(.cc62)
        case  63: self = .undefined(.cc63)
        case  64: self = .undefined(.cc64)
        case  65: self = .undefined(.cc65)
        case  66: self = .undefined(.cc66)
        case  67: self = .undefined(.cc67)
        case  68: self = .undefined(.cc68)
        case  69: self = .undefined(.cc69)
        case  70: self = .soundCtrl1_soundVariation
        case  71: self = .soundCtrl2_timbreIntensity
        case  72: self = .soundCtrl3_releaseTime
        case  73: self = .soundCtrl4_attackTime
        case  74: self = .soundCtrl5_brightness
        case  75: self = .soundCtrl6_decayTime
        case  76: self = .soundCtrl7_vibratoRate
        case  77: self = .soundCtrl8_vibratoDepth
        case  78: self = .soundCtrl9_vibratoDelay
        case  79: self = .soundCtrl10_defaultUndefined
        case  80: self = .undefined(.cc80)
        case  81: self = .undefined(.cc81)
        case  82: self = .undefined(.cc82)
        case  83: self = .undefined(.cc83)
        case  84: self = .undefined(.cc84)
        case  85: self = .undefined(.cc85)
        case  86: self = .undefined(.cc86)
        case  87: self = .undefined(.cc87)
        case  88: self = .undefined(.cc88)
        case  89: self = .undefined(.cc89)
        case  90: self = .undefined(.cc90)
        case  91: self = .effects1Depth_reverbSendLevel
        case  92: self = .effects2Depth
        case  93: self = .effects3Depth_chorusSendLevel
        case  94: self = .effects4Depth
        case  95: self = .effects5Depth
        case  96: self = .undefined(.cc96)
        case  97: self = .undefined(.cc97)
        case  98: self = .undefined(.cc98)
        case  99: self = .undefined(.cc99)
        case 100: self = .undefined(.cc100)
        case 101: self = .undefined(.cc101)
        case 102: self = .undefined(.cc102)
        case 103: self = .undefined(.cc103)
        case 104: self = .undefined(.cc104)
        case 105: self = .undefined(.cc105)
        case 106: self = .undefined(.cc106)
        case 107: self = .undefined(.cc107)
        case 108: self = .undefined(.cc108)
        case 109: self = .undefined(.cc109)
        case 110: self = .undefined(.cc110)
        case 111: self = .undefined(.cc111)
        case 112: self = .undefined(.cc112)
        case 113: self = .undefined(.cc113)
        case 114: self = .undefined(.cc114)
        case 115: self = .undefined(.cc115)
        case 116: self = .undefined(.cc116)
        case 117: self = .undefined(.cc117)
        case 118: self = .undefined(.cc118)
        case 119: self = .undefined(.cc119)
        case 120: self = .undefined(.cc120)
        case 121: self = .undefined(.cc121)
        case 122: self = .undefined(.cc122)
        case 123: self = .undefined(.cc123)
        case 124: self = .undefined(.cc124)
        case 125: self = .undefined(.cc125)
        case 126: self = .undefined(.cc126)
        case 127: self = .undefined(.cc127)
        case 128: self = .undefined(.cc128)
        case 129: self = .undefined(.cc129)
        case 130: self = .undefined(.cc130)
        case 131: self = .undefined(.cc131)
        case 132: self = .undefined(.cc132)
        case 133: self = .undefined(.cc133)
        case 134: self = .undefined(.cc134)
        case 135: self = .undefined(.cc135)
        case 136: self = .undefined(.cc136)
        case 137: self = .undefined(.cc137)
        case 138: self = .undefined(.cc138)
        case 139: self = .undefined(.cc139)
        case 140: self = .undefined(.cc140)
        case 141: self = .undefined(.cc141)
        case 142: self = .undefined(.cc142)
        case 143: self = .undefined(.cc143)
        case 144: self = .undefined(.cc144)
        case 145: self = .undefined(.cc145)
        case 146: self = .undefined(.cc146)
        case 147: self = .undefined(.cc147)
        case 148: self = .undefined(.cc148)
        case 149: self = .undefined(.cc149)
        case 150: self = .undefined(.cc150)
        case 151: self = .undefined(.cc151)
        case 152: self = .undefined(.cc152)
        case 153: self = .undefined(.cc153)
        case 154: self = .undefined(.cc154)
        case 155: self = .undefined(.cc155)
        case 156: self = .undefined(.cc156)
        case 157: self = .undefined(.cc157)
        case 158: self = .undefined(.cc158)
        case 159: self = .undefined(.cc159)
        case 160: self = .undefined(.cc160)
        case 161: self = .undefined(.cc161)
        case 162: self = .undefined(.cc162)
        case 163: self = .undefined(.cc163)
        case 164: self = .undefined(.cc164)
        case 165: self = .undefined(.cc165)
        case 166: self = .undefined(.cc166)
        case 167: self = .undefined(.cc167)
        case 168: self = .undefined(.cc168)
        case 169: self = .undefined(.cc169)
        case 170: self = .undefined(.cc170)
        case 171: self = .undefined(.cc171)
        case 172: self = .undefined(.cc172)
        case 173: self = .undefined(.cc173)
        case 174: self = .undefined(.cc174)
        case 175: self = .undefined(.cc175)
        case 176: self = .undefined(.cc176)
        case 177: self = .undefined(.cc177)
        case 178: self = .undefined(.cc178)
        case 179: self = .undefined(.cc179)
        case 180: self = .undefined(.cc180)
        case 181: self = .undefined(.cc181)
        case 182: self = .undefined(.cc182)
        case 183: self = .undefined(.cc183)
        case 184: self = .undefined(.cc184)
        case 185: self = .undefined(.cc185)
        case 186: self = .undefined(.cc186)
        case 187: self = .undefined(.cc187)
        case 188: self = .undefined(.cc188)
        case 189: self = .undefined(.cc189)
        case 190: self = .undefined(.cc190)
        case 191: self = .undefined(.cc191)
        case 192: self = .undefined(.cc192)
        case 193: self = .undefined(.cc193)
        case 194: self = .undefined(.cc194)
        case 195: self = .undefined(.cc195)
        case 196: self = .undefined(.cc196)
        case 197: self = .undefined(.cc197)
        case 198: self = .undefined(.cc198)
        case 199: self = .undefined(.cc199)
        case 200: self = .undefined(.cc200)
        case 201: self = .undefined(.cc201)
        case 202: self = .undefined(.cc202)
        case 203: self = .undefined(.cc203)
        case 204: self = .undefined(.cc204)
        case 205: self = .undefined(.cc205)
        case 206: self = .undefined(.cc206)
        case 207: self = .undefined(.cc207)
        case 208: self = .undefined(.cc208)
        case 209: self = .undefined(.cc209)
        case 210: self = .undefined(.cc210)
        case 211: self = .undefined(.cc211)
        case 212: self = .undefined(.cc212)
        case 213: self = .undefined(.cc213)
        case 214: self = .undefined(.cc214)
        case 215: self = .undefined(.cc215)
        case 216: self = .undefined(.cc216)
        case 217: self = .undefined(.cc217)
        case 218: self = .undefined(.cc218)
        case 219: self = .undefined(.cc219)
        case 220: self = .undefined(.cc220)
        case 221: self = .undefined(.cc221)
        case 222: self = .undefined(.cc222)
        case 223: self = .undefined(.cc223)
        case 224: self = .undefined(.cc224)
        case 225: self = .undefined(.cc225)
        case 226: self = .undefined(.cc226)
        case 227: self = .undefined(.cc227)
        case 228: self = .undefined(.cc228)
        case 229: self = .undefined(.cc229)
        case 230: self = .undefined(.cc230)
        case 231: self = .undefined(.cc231)
        case 232: self = .undefined(.cc232)
        case 233: self = .undefined(.cc233)
        case 234: self = .undefined(.cc234)
        case 235: self = .undefined(.cc235)
        case 236: self = .undefined(.cc236)
        case 237: self = .undefined(.cc237)
        case 238: self = .undefined(.cc238)
        case 239: self = .undefined(.cc239)
        case 240: self = .undefined(.cc240)
        case 241: self = .undefined(.cc241)
        case 242: self = .undefined(.cc242)
        case 243: self = .undefined(.cc243)
        case 244: self = .undefined(.cc244)
        case 245: self = .undefined(.cc245)
        case 246: self = .undefined(.cc246)
        case 247: self = .undefined(.cc247)
        case 248: self = .undefined(.cc248)
        case 249: self = .undefined(.cc249)
        case 250: self = .undefined(.cc250)
        case 251: self = .undefined(.cc251)
        case 252: self = .undefined(.cc252)
        case 253: self = .undefined(.cc253)
        case 254: self = .undefined(.cc254)
        case 255: self = .undefined(.cc255)
            
        default:
            // should never happen since the switch case covers all 256 values of UInt8
            assertionFailure("Unhandled MIDI Per-Note CC controller number: \(number).")
            self = .modWheel
            
        }
        
    }
    
}
