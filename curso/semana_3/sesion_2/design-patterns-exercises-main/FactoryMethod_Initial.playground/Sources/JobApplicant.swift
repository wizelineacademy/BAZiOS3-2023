import Foundation

public struct JobApplicant {
    public let name: String
    public let email: String
    public var status: Status
    
    public enum Status {
        case new
        case interview
        case hired
        case rejected
    }
    
    public init(name: String, email: String, status: Status) {
        self.name = name
        self.email = name
        self.status = status
    }
}
