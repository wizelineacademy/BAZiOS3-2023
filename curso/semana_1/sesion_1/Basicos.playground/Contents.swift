do {
    // Bool
    true
    // Int
    10
    // Double / Float
    0.5
    // Range
    0..<3
    // CloseRange
    0...3
    // String
    "hola"
}

do {
    // Bool
    type(of: true)
    // Int
    type(of: 10)
    // Double / Float
    type(of: 0.5)
    // Range
    type(of: 0..<3)
    // CloseRange
    type(of: 0...3)
    // String
    type(of: "hola")
}

do {
    // Enteros
    let numberOfItems = 10
    // Boleano
    let isPrimeNumber = false
    // Cadena de caracteres
    let greeting = "Hola mundo"
    // Valor con punto flotante
    let iOSVersion = 15.6
}

do {
    // Boleano
    var isPrimeNumber = false
    
    // No puedes asignar un valor de tipo 'String' a tipo 'Bool'
    // isPrimeNumber = "true"
}

do {
    // Valor con punto flotante
    let iOSVersion: Float = 15.6
}

do {
    // Tuple con nombre y edad de un usuario
    let user: (String, Int) = ("José", 33)
    let age = user.1
}

do {
    // Tuple con nombre de
    let user: (name: String, age: Int) = ("José", 33)
    let age = user.age
}

do {
    // Tuple con nombre no cambia el tipo de dato
    let tupe: (String, Int) = ("José", 33)
    var namedTuple: (name: String, age: Int) = ("Juan", 31)

    namedTuple = tupe
}

do {
    // El nombre del usuario
    _ = "Miguel Del Toro"
    // El nombre de la aplicación
    _ = "SuperApp™"
    // Si el usuario ya inició sesión
    _ = false
    // Un contador de intentos fallidos al iniciar sesión
    _ = 0
    // Un valor aproximado de pi
    _ = 3.14159
    // La latitud y longitud de un lugar
    _ = (20.6466236, -103.4113876)
}

do {
    // El nombre del usuario
    let userName = "Miguel Del Toro"
    // El nombre de la aplicación
    let appName = "SuperApp™"
    // Si el usuario ya inició sesión
    var isUserLoggedIn = false
    // Un contador de intentos fallidos al iniciar sesión
    var loginAttemptsCount: Int = 0
    // Un valor aproximado de pi
    let pi: Float = 3.14159
    // La latitud y longitud de un lugar
    let location: (lat: Double, lng: Double) = (20.6466236, -103.4113876)
}
