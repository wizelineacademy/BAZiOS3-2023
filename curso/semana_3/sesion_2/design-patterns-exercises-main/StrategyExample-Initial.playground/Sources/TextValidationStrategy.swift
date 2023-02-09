import Foundation

public protocol TextValidationStrategy {
    func isValid(_ text: String) -> Bool
}
