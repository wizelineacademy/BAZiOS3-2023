import UIKit
import PlaygroundSupport

/**
 El área de Negocio de tu empresa requiere conocer cuántas personas hacen clic en el botón `Enviar Email`, utilizando analíticos.
 
 `Instrucciones:`
 
 1. Crea una clase llamada `SendEmailAnalyticsDecorator` para manejar el envío de analíticos.
 2. Haz que la clase `SendEmailAnalyticsDecorator` conforme con el protocolo `SendEmailDelegate`.
 3. Utiliza la clase `Analytics` dentro de `SendEmailAnalyticsDecorator` para enviar analytics en la función `didSendEmail()`.
 4. Asigna una instancia de tu decorador al controlador `SendEmailViewController` a través del delegate `sendEmailDelegate`.
 **/

final class SendEmailConfirmationDelegate: SendEmailDelegate {
    func didSendEmail() {
        print("Show email confirmation")
    }
}

let sendEmailConfirmationDelegate = SendEmailConfirmationDelegate()
var sendEmailViewController = SendEmailViewController()
sendEmailViewController.sendEmailDelegate = sendEmailConfirmationDelegate

PlaygroundPage.current.liveView = sendEmailViewController
