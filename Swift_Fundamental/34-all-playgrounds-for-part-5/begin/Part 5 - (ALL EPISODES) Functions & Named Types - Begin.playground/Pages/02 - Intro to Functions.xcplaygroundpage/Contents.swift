//: [⇐ Previous: 01 - Introduction](@previous)
//: ## Episode 02: Introduction to Functions

func gradePasses(name: String, grade: Int) -> Bool {
//  print("\(name) got \(grade)")
  grade >= 60
}

/// 函数调用者只能使用 alas
/// 函数内部只能使用 name
func hello(alas name: String) {
  print(name)
}
hello(alas: "hello")


let pass = gradePasses(name: "Vic", grade: 77)

var name: String? = nil

func printName(name: String?) -> Int {
//  guard let name = name else {
//    print("No name")
//    return 1
//  }
//  print("Here is my name: \(name)")
//  return 0
  if name == nil {
    print("No name")
    return 1
  }
  print("Here is my name: \(name!)")
  return 0
}

printName(name: nil)

var arr1 = ["1", "2"]
var arr2 = arr1
arr2.append("3")

print(arr1)
print(arr2)
//: [⇒ Next: 03 - Functions and Return](@next)
