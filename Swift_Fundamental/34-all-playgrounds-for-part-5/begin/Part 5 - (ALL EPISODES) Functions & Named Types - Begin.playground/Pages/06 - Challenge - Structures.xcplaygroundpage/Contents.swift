//: [⇐ Previous: 05 - Structures](@previous)
//: ## Episode 06: Challenge - Structures

/*:
 # Challenge 1

1. Create a structure named `Student` with three properties: first name, last name and grade.
2. Create a structure named `Classroom` with two properties: the subject, and an array of students.
3. Create a method that returns the highest grade in the classroom.
*/
struct Student {
  var fistName: String
  var lastName: String
  var grade: Int
}

struct Classroom {
  var subject: String
  var students: [Student]?
  
  
  func highestGrade() -> Int {
    guard let students = students else {
      return 0
    }
    var ret = 0;
    for student in students {
      ret = max(ret, student.grade)
    }
    return ret
  }
 
  func hightestGrade_sort() -> Int {
    guard let students = students else { return 0 }
    let sorted = students.sorted { $0.grade > $1.grade }
    guard sorted.count > 0 else {
      return 0
    }
    return sorted.first!.grade
  }
}

struct Mock {
  let arg1: Int
  let arg2: Int
  
  init(a1: Int) {
    arg1 = a1
    arg2 = 0
  }
}

let name: String? = nil
let haha = name
print(haha)

var mock1 = Mock(a1: 10)
print(mock1)




/*:
 # Challenge 2

 1. Create an instance of a `Classroom`
 2. Use the `getHighestGrade` method
*/
let niko = Student(fistName: "Niko", lastName: "Shu", grade: 70)
let vic = Student(fistName: "Vic", lastName: "Wan", grade: 90)
let mike = Student(fistName: "Micheal", lastName: "Jiang", grade: 85)


var mathRoom = Classroom(subject: "Math", students: [niko, vic, mike])
print(mathRoom.hightestGrade_sort())


//: [⇒ Next: 07 - Classes](@next)
