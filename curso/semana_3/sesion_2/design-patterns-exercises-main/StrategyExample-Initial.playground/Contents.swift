import UIKit

/**
 `Contexto:`
    Programaste una pantalla de Inicio de Sesión con un campo de texto de tipo `CustomTextField`.
    Este campo de texto valida si el texto ingresado tiene formato de correo electrónico.
    El equipo de producto tiene la iniciativa de permitir que los usuarios ahora puedan iniciar sesión con email y teléfono.
 
 `Instrucciones:`
    1. Crea una clase `EmailValidationStrategy` para evaluar un texto de tipo email. Haz que conforme con el protocolo `TextValidationStrategy`.
    2. Mueve la lógica de validacion de email desde el '`CustomTextField`al `EmailValidationStrategy`.
    2. Crea una clase `PhoneValidationStrategy` para evaluar un texto de tipo teléfono. Haz que conforme con el protocolo `TextValidationStrategy`.
    3. Crea una clase `EmailOrPhoneValidationStrategy` y úsala para unir ambas lógicas de validación .
    5. Crea una propiedad de tipo `TextValidationStrategy` en el `CustomTextField` y asígnale una instancia de `EmailOrPhoneValidationStrategy`.
**/

let customTextField = CustomTextField()

print(customTextField.configure(with: "test@email.com"))
print(customTextField.configure(with: "Esto no es un email"))
