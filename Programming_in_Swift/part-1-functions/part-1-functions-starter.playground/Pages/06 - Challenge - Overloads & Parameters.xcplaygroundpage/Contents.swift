//: [⇐ Previous: 05 - Advanced Parameters](@previous)
//: ## Episode 06 - Challenge - Overloads & Parameters

/*:
 ## Challenge 1
 Write two possible overloads for the function below. You can use...
 * a different number of parameters
 * different argument labels
 * different parameter types
 * different return types
*/

func multiply(number: Int, by multiplier: Int) -> Int {
  return number * multiplier
}

// TODO: Write solution here
// 1. For different number of params
func multiply(number: Int, by multiplier: Int, context: String? = nil) -> Int {
    return number * multiplier
}
// 2. For different argument labels
func multiply(number: Int, with multiplier: Int) -> Int {
    return number * multiplier
}
// 3. For different parameter types
// 4. For different return types
func multiply(number: Double, by multiplier: Double) -> Double {
    return number * multiplier
}
/*:
 ## Challenge 2
 Eliminate the overloads below by using a default value for a parameter.
*/

// --------------------------------------
//func printMultipleOf(multiplier: Int, number: Int) {
//  print("\(multiplier) * \(number)  = \(multiplier * number)")
//}
//
//func printMultipleOf(multiplier: Int) {
//  print("\(multiplier) * 1)  = \(multiplier * 1)")
//}
// --------------------------------------


// TODO: Write solution here
func printMultipleOf(multiplier: Int, number: Int = 1) {
    print("\(multiplier) * \(number)  = \(multiplier * number)")
}


// --------------------------------------
printMultipleOf(multiplier: 7)
printMultipleOf(multiplier: 11, number: 4)
// --------------------------------------


/*:
 ## Challenge 3
 1 - Change the function below so that it can modify the right parameter.
 2 - Call the function!
*/

var score = 50

func update(score: inout Int, withPoints points: Int) {
  score += points
}

update(score: &score, withPoints: 100)
score


//: [⇒ Next: 07 - Functions as Parameters](@next)
