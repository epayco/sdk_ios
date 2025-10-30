import Foundation

public struct ExtrasModel: Encodable {
    public let extra1: String?
    public let extra2: String?
    public let extra3: String?
    public let extra4: String?
    public let extra5: String /// Product tagged by default
    public let extra6: String?
    public let extra7: String?
    public let extra8: String?
    public let extra9: String?
    public let extra10: String?
    
    public init(extra1: String? = nil, extra2: String? = nil, extra3: String? = nil, extra4: String? = nil, extra6: String? = nil, extra7: String? = nil, extra8: String? = nil, extra9: String? = nil, extra10: String? = nil) {
        self.extra1 = extra1
        self.extra2 = extra2
        self.extra3 = extra3
        self.extra4 = extra4
        self.extra5 = "P48"
        self.extra6 = extra6
        self.extra7 = extra7
        self.extra8 = extra8
        self.extra9 = extra9
        self.extra10 = extra10
    }
}
