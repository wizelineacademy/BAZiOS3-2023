import Foundation

public struct Email {
    public let subject: String
    public var messageBody: String
    public var recipientEmail: String
    public var senderEmail: String
    
    public init(subject: String, messageBody: String = "", recipientEmail: String = "", senderEmail: String = "") {
        self.subject = subject
        self.messageBody = messageBody
        self.recipientEmail = recipientEmail
        self.senderEmail = senderEmail
    }
    
    public mutating func add(messageBody: String) {
        self.messageBody = messageBody
    }
    
    public mutating func add(recipient: String) {
        self.recipientEmail = recipient
    }
    
    public mutating func add(sender: String) {
        self.senderEmail = sender
    }
}
