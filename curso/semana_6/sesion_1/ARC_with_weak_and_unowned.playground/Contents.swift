import Foundation

let originalGrades = [73, 67, 84, 38, 33]

func shouldBeRounded(_ grade: Int) -> Bool {
    return grade > 40
}

func getRoundedGrades() -> [Int] {
    var roundedGrades: [Int] = []
    originalGrades.forEach { number in
        let modulus = number % 5
        if shouldBeRounded(number) {
            let gradeCeiling = number + (5 - modulus)
            print(gradeCeiling - number <= 3)
            if gradeCeiling - number < 3 {
                roundedGrades.append(gradeCeiling)
            } else {
                roundedGrades.append(number)
            }
        } else {
            roundedGrades.append(number)
        }
    }
    return roundedGrades
}

// getRoundedGrades()

// MARK: - Closures ARC
class CelestialBody {
    var name: String
    init(name: String) {
        self.name = name
        print("☀️ init \(name)")
    }
    
    deinit {
        print("💀 deinit \(name)")
    }
}

var value = 0
let show = {
    print(value)
}

show()
value = 10
show()

let show2 = { [value] in
    print(value)
}

show2()
value = 20
show2()

value = 30

let show3 = { [plainValue = value, addedValue = value + 1] in
    print(plainValue, addedValue)
}

show3()
value = 40
show3()

class Supernova: CelestialBody {
    lazy var explode: () -> Void = { [unowned self] in
        self.name = "BOOMED \(self.name)"
    }
}

do {
    let tycho = Supernova(name: "Tycho")
    tycho.explode()
    print(tycho.name)
}

do {
    let kepler = Supernova(name: "Kepler")
    DispatchQueue.global().asyncAfter(deadline: .now() + 0.1) {
        kepler.explode()
        print(kepler.name)
    }
}

do {
    let galileo = Supernova(name: "Galileo")
    DispatchQueue.global().asyncAfter(deadline: .now() + 0.1) { [weak galileo] in
        guard let galileo = galileo else { print("Galileo is nil"); return }
        galileo.explode()
        print(galileo.name)
    }
}
