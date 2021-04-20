//: [⇐ Previous: 07 - Optionals](@previous)
//: ## Episode 08: Challenge - Optionals

/*:
 ## Challenge 1
 
 You've been provided with a constant below, `hasAllergies`, which has been set to `true`.
 
 Below that, declare a Optional String variable named `dogName`.
 
 On the next line, use a ternary conditional operator to set the value of `dogName` to `nil` if `hasAllergies` is `true`, and to `"Mango"` otherwise.
 */

// TODO: Write solution here
let hasAllergies = false
var dogName: String? = hasAllergies ? nil : "Mango"

/*:
 ## Challenge 2
 
 Create a constant called `parsedInt` and set it to `Int("10")`. Swift will attempt to parse the string `10` and convert it to an `Int`.
 
 Place your mouse over the constant name and use **Option-Click** to check the type of `parsedInt`. Why is `parsedInt` an optional here?
 */

// TODO: Write solution here
let parsedInt = Int("10")
// That is because the string inside Int() may not be parsed as a legal integer value. In that case, the value should be set as nil.



/*:
 ## Challenge 3
 
 Create another constant named `newParsedInt` and set it equal to `Int("cat")`.
 
 What will the value of `newParsedInt be? Why?
 
 */

// TODO: Write solution here
let newParsedInt = Int("cat")
// nil. Because 'cat' cannot be parsed as a integer value.


