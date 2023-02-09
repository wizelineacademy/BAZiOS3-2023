import UIKit
import Foundation

/**
El código siguiente está incompleto, siempre muestra un email vacío.
 
 `Instrucciones:`
 
 1. Modifica el `EmailFactory` para devolver un email para cada status diferente .
 2. Utiliza`recipient.status` para crear un switch case.
 3. Utiliza la variable `newApplicantEmail` del struct `Strings` para crear un email de Status `new`.
 4. Utiliza la variable `interviewApplicantEmail` del struct `Strings` para crear un email de Status `interview`.
 5. Utiliza la variable `hiredApplicantEmail` del struct `Strings` para crear un email de Status `hired`.
 6. Utiliza la variable `rejectedApplicantEmail` del struct `Strings` para crear un email de Status `rejected`.
 **/

public struct EmailFactory {
    public let senderEmail: String

    public func createEmail(to recipient: JobApplicant) -> Email {
        return Email(subject: "Empty")
    }
}

var jackson = JobApplicant(name: Strings.Applicant.name, email: Strings.Applicant.email, status: .new)
let emailFactory = EmailFactory(senderEmail: Strings.Sender.recruitmentEmail)

// New
print(emailFactory.createEmail(to: jackson), "\n")
// Interview
jackson.status = JobApplicant.Status.interview
print(emailFactory.createEmail(to: jackson), "\n")
// Hired
jackson.status = JobApplicant.Status.hired
print(emailFactory.createEmail(to: jackson), "\n")

jackson.status = JobApplicant.Status.rejected
print(emailFactory.createEmail(to: jackson), "\n")
