import UIKit

/* We want to compare the use of value and reference types with closures and capture lists
 
 To begin, closures capture references to variables.
 */

struct Calculator {
    var a: Int
    var b: Int

    var sum: Int {
        return a + b
    }
}

class Additioner {
    var a: Int
    var b: Int

    init(a: Int, b: Int) {
        self.a = a
        self.b = b
    }

    var sum: Int {
        return a + b
    }
}

func runClosure(_ closure: @escaping () -> Void) {
    print("Running closure")
    DispatchQueue.global().asyncAfter(deadline: .now() + 0.2) {
        closure()
    }
}

func calculate() {
    var calculator = Calculator(a: 3, b: 5)

    withUnsafePointer(to: calculator) {
        print("1 Calculator address", $0)
    }

    let closure = { [calculator] in
//        calculator = Calculator(a: 33, b: 55)
        withUnsafePointer(to: calculator) {
            print("2 Calculator address", $0, "Sum is: ", calculator.sum)
        }
    }

    withUnsafePointer(to: calculator) {
        print("3 Calculator address", $0, "Sum is: ", calculator.sum)
    }

    calculator = Calculator(a: 3, b: 3)
    closure()

    withUnsafePointer(to: calculator) {
        print("4 Calculator address", $0, "Sum is: ", calculator.sum)
    }

    calculator = Calculator(a: 3, b: 11)
    withUnsafePointer(to: calculator) {
        print("5 Calculator address", $0, "Sum is: ", calculator.sum)
    }
}

func add() {
    var additioner = Additioner(a: 3, b: 5)

    withUnsafePointer(to: additioner) {
        print("1 Additioner address", $0)
    }

    let closure = { [unowned additioner] in
//        calculator = Calculator(a: 33, b: 55)
        withUnsafePointer(to: additioner) {
            print("2 Additioner address", $0, "Sum is: ", additioner.sum)
        }
    }

    withUnsafePointer(to: additioner) {
        print("3 Additioner address", $0, "Sum is: ", additioner.sum)
    }

    closure()

    additioner = Additioner(a: 3, b: 3)


    withUnsafePointer(to: additioner) {
        print("4 Additioner address", $0, "Sum is: ", additioner.sum)
    }

    additioner = Additioner(a: 3, b: 11)
    withUnsafePointer(to: additioner) {
        print("5 Additioner address", $0, "Sum is: ", additioner.sum)
    }
}

calculate()
print("----------------------------------------")
add()
