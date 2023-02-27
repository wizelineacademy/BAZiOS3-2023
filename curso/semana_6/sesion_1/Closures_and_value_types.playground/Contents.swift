import UIKit

/* We want to compare the use of value and reference types with closures and capture lists
 
 To begin, closures capture references to variables.
 */

func runClosure(_ closure: @escaping () -> Void) {
    print("Running closure")
    closure()
}

class Foo {
    var x = 5
}

struct Bar: Equatable {
    var x = 5
}

var foo = Foo()
var bar = Bar()
var x: Int = 5

withUnsafePointer(to: x) {
    print("1: \(x) has address: \($0)")
}

let closure1 = { () in
    withUnsafePointer(to: x) {
        print("2: \(x) has address: \($0)")
    }
    
    print(x)
    print("---")
}

runClosure(closure1)

x = 6
foo.x = 6
bar.x = 6

runClosure(closure1)
runClosure(closure1)
runClosure(closure1)
runClosure(closure1)
runClosure(closure1)

print("Calculator example:____:")

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


func calculate() {
    var calculator = Calculator(a: 3, b: 5)
    withUnsafePointer(to: calculator) {
        print("1 Calculator address", $0)
    }
    
    let closure = { [calculator] in
        //    calculator = Calculator(a: 33, b: 55) // 0x610000221be0
        print(calculator.sum)
        withUnsafePointer(to: calculator) {
            print("2 Calculator address", $0)
        }
    }
    
    withUnsafePointer(to: calculator) {
        print("3 Calculator address", $0)
    }
    
    calculator = Calculator(a: 3, b: 3)
    closure()
    withUnsafePointer(to: calculator) {
        print("4 Calculator address", $0)
        print(calculator.sum)
    }
    
    calculator = Calculator(a: 3, b: 11)
    withUnsafePointer(to: calculator) {
        print("5 Calculator address", $0)
        print(calculator.sum)
    }
}

func add() {
    var additioner = Additioner(a: 3, b: 5)
    
    withUnsafePointer(to: additioner) {
        print("1 Additioner address", $0)
    }

    let closure = { [unowned additioner] in
        //        additioner = Calculator(a: 33, b: 55) // 0x610000221be0
        print(additioner.sum)
        withUnsafePointer(to: additioner) {
            print("2 Additioner address", $0)
        }
    }

    withUnsafePointer(to: additioner) {
        print("3 Additioner address", $0)
    }
    closure()
    additioner = Additioner(a: 3, b: 3)
    //    closure()
    withUnsafePointer(to: additioner) {
        print("4 Additioner address", $0)
        print(additioner.sum)
    }
    
    additioner = Additioner(a: 3, b: 11)
    withUnsafePointer(to: additioner) {
        print("5 Additioner address", $0)
        print(additioner.sum)
    }
}

calculate()
print("----------------------------------------")
add()


