import Foundation

public final class CustomTextField {
    
    public init() { }
    
    struct InvalidTextError: Error { }
    
    public func configure(with text: String) -> String {
        guard isValid(text) else { return "Cannot configure. This text is invalid" }
        return "Configured successfully. This text is valid"
    }
    
    private func isValid(_ text: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: text)
    }
}
