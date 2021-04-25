//: [⇐ Previous: 04 - Challenge - Dictionaries](@previous)
//: ## Episode 05: Creating and Populating Sets

var someSet: Set<Int> = Set()
var anotherSet: Set<Int> = Set()



someSet.insert(1)
someSet.insert(10)
anotherSet.insert(1)
anotherSet.insert(20)

let unionSet = someSet.union(anotherSet)
let diff = someSet.symmetricDifference(anotherSet)
someSet.formSymmetricDifference(anotherSet)



//: [⇒ Next: 06 - Challenge - Sets](@next)
