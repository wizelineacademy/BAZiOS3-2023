import Foundation

do {
    // userFavoriteAnimal se asigna nil por default
    var userFavoriteAnimal = Optional<String>("Dogs")
    // Optional("Dogs")

    userFavoriteAnimal = nil
    // nil
}

do {
    // userFavoriteAnimal se asigna nil por default
    var userFavoriteAnimal: String?
    // nil
    
    userFavoriteAnimal = getUserResponse() // "Dogs"
    // Optional("Dogs")
}

do {
    var userFavoriteAnimal: String? = "Dogs"

    let actualValue = userFavoriteAnimal!
    // Dogs
}

do {
    var userFavoriteAnimal: String? = "Dogs"
    // Optional("Dogs")
    if userFavoriteAnimal != nil {
        let actualValue = userFavoriteAnimal!
        // Dogs
    }
}

do {
    var userFavoriteAnimal: String? = "Dogs"
    // Optional("Dogs")
    if let value = userFavoriteAnimal {
        value // "Dogs"
    } else {
        // nil
    }
}

do {
    var greeting: String? = "Hello"
    // el llamado a este metodo no se realiza si el opcional es igual a nil
    greeting?.append(contentsOf: " David!")
    // Optional("Hello David!")
}

do {
    var greeting: String? = "Hello"
    greeting?.appending(" David!")
    // Optional("Hello David!")
}

do {
    var greeting: String? = "Hello"
    greeting?.appending(" ").appending("David").appending("!")
    // Optional("Hello David!")
}

do {
    var userBalance: Int? = 80
    let productPrice = 14

    userBalance!.advanced(by: -productPrice)
    // 66
}

do {
    let sum = 5 + 5
    let par = sum % 2 == 0
    // true
}

do {
    let access = Bool.random()
    let message = access ? "granted" : "denied"
    print("access \(message)")
}

do {
    let access = Bool.random()
    let message: String
    if access {
        message = "granted"
    } else {
        message = "denied"
    }
    print("access \(message)")
}

do {
    let userName: String? = "John"
    let message: String = "Hello " + (userName != nil ? userName! : "World")
    // Hello John
}

do {
    let userName: String? = "John"
    let message: String = "Hello " + (userName ?? "World")
    // Hello John
}

do {
    let firstName: String? = "Leslie"
    let lastName: String? = "Atkins"
    var fullname = ""
    let travelBy: (bus: Int?, car:  Int?)? = (1400, 1120)
    var avgDistance: Double = 0
    // ⬇ code here
    // ⬆
    print("\(fullname) recorrio una distancia promedio de \(avgDistance) metros por medio de transporte")
    // Leslie Atkins recorrio una distancia promedio de 1260.0 metros por medio de transporte
}

do {
    let firstName: String? = "Leslie"
    let lastName: String? = "Atkins"
    var fullname = ""
    let travelBy: (bus: Int?, car:  Int?)? = (1400, 1120)
    var avgDistance: Double = 0
    // ⬇ code here
    if let firstName = firstName, let lastName = lastName {
        fullname += firstName
        fullname += " "
        fullname += lastName
    }
    if let travelBy = travelBy, let byBus = travelBy.bus, let byCar = travelBy.car  {
        avgDistance += Double(byBus)
        avgDistance += Double(byCar)
        avgDistance /= 2
    }
    // ⬆
    print("\(fullname) recorrio una distancia promedio de \(avgDistance) metros por medio de transporte")
    // Leslie Atkins recorrio una distancia promedio de 1260.0 metros por medio de transporte
}

do {
    let firstName: String? = "Leslie"
    let lastName: String? = "Atkins"
    var fullname = ""
    let travelBy: (bus: Int?, car:  Int?)? = (1400, 1120)
    var avgDistance: Double = 0
    // ⬇ code here
    fullname = (firstName?.appending(" ") ?? "") + (lastName ?? "")

    avgDistance += Double((travelBy?.bus ?? 0) + (travelBy?.car ?? 0))
    avgDistance /= (travelBy?.bus != nil && travelBy?.car != nil ? 2:1)
    // ⬆
    print("\(fullname) recorrio una distancia promedio de \(avgDistance) metros por medio de transporte")
    // Leslie Atkins recorrio una distancia promedio de 1260.0 metros por medio de transporte
}
