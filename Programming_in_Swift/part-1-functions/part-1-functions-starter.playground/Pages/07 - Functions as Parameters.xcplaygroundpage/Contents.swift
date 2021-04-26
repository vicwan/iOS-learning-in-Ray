//: [⇐ Previous: 06 - Challenge - Overloads & Parameters](@previous)
//: ## Episode 07 - Functions as Parameters

//: Functions are data types, and can be assigned to variables and constants just like `Int` and `String`.
typealias TakeTwoIntsAndReturnOneInt = (Int, Int) -> Int

func add(number1: Int, number2: Int) -> Int {
    number1 + number2
}

func substract(number1: Int, number2: Int) -> Int {
    number1 - number2
}

func printResult(_ operate: TakeTwoIntsAndReturnOneInt, _ a: Int, _ b: Int) {
    let ret = operate(a, b)
    print("The result is: \(ret)")
}

printResult(+, 2, 9)
//let a: Int = + (2, 9)

//: Functions can use functions as parameter and return types. Functions that do this are called  "higher-order functions"


//: A `typealias` lets you give a name to a compound type, or give *another* name to a named type.

// ---------------------------------------------------
typealias Student = (name: String, grade: Int)

let passingGrade = 50
let jessy: Student = (name: "Jessy", grade: 49)
let ozma: Student = (name: "Ozma", grade: 87)

func printPassStatus(for student: Student) {
  print(student.grade >= passingGrade ? "\(student.name) passed!" : "Try again, \(student.name).")
}

printPassStatus(for: jessy)
printPassStatus(for: ozma)
// ---------------------------------------------------

//: [⇒ Next: 08 - Conclusion](@next)
