import Foundation

public struct Strings {
    
    public struct Applicant {
        public static let name = "Jackson Smith"
        public static let email = "jackson.smith@example.com"
    }
    
    public struct Sender {
        public static let recruitmentEmail = "recruitment@example.com"
    }
    
    struct Subject {
        static let new: String = "We Received Your Application"
        static let interview: String = "We Want to Interview You"
        static let hired: String = "We Want to Hire You"
        static let rejected: String = "Thanks for Your Application"
    }
    
    struct Message {
        static func new(recipient: String) -> String {
            "Thanks \(recipient) for applying for a job here! " +
            "You should hear from us in 17-42 business days."
        }
        
        static func interview(recipient: String) -> String {
            "Thanks for your resume, \(recipient)! " +
            "Can you come in for an interview in 30 minutes?"
        }
        
        static func hired(recipient: String) -> String {
            "Congratulations, \(recipient)! " +
            "We liked your code, and you smelled nice. " +
            "We want to offer you a position! Cha-ching! $$$"
        }
        
        static func rejected(recipient: String) -> String {
            "Thank you for applying, \(recipient)! " +
            "We have decided to move forward " +
            "with other candidates. " +
            "Please remember to wear pants next time!"
        }
    }
}

public var newApplicantEmail = Email(subject: Strings.Subject.new)
public var interviewApplicantEmail = Email(subject: Strings.Subject.interview)
public var hiredApplicantEmail = Email(subject: Strings.Subject.hired)
public var rejectedApplicantEmail = Email(subject: Strings.Subject.rejected)
