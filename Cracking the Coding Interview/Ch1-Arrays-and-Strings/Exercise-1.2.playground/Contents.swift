// Check permuation: Given two strings, write a method to determine if one is a
// permutation of the other.

// Important things to note are:
// - are the strings case sensetive? Is Job == obj?
// - does whitespace matter? Is "hello   " == "hello"

// We're going to assume that strings are case sensetive and whitespace matters

// By definition, a permutation is an ordering of elements of a collection.
// Example: ABC has the permutations:
// - ABC
// - ACB
// - BAC
// - BCA
// - CAB
// - CBA

// This algorithm takes advantage of the fact that two strings are permutations
// if they have the same characters in a different ordering. So we make the ordering
// the same and compare the strings.

// Algorithm is as follows:
// 1. Check the lengths
// 2. Sort both strings
// 3. Compare the sorted version of both strings

// This algorithm runs in O(nlogn) time since we have to sort both strings.
// It uses O(n) space complexity since we have to allocate space for the
// sorted versions of our strings

public func isPermutation(stringA: String, stringB: String) -> Bool {
    // If the strings are of different lengths than they can't be permutations
    guard stringA.count == stringB.count else { return false }
    
    // sort the strings
    let sortedStringA = stringA.sorted()
    let sortedStringB = stringB.sorted()
    
    // compare the result
    return sortedStringA == sortedStringB
}

// Another possible algorithm takes advantage of the fact that two strings that
// are permutations of each other will have the same number of characters

// Algorithm is as follows:
// 1. Create a character array
// 2. Iterate through stringA counting the instances of each character
// 3. Iterate through stringB decrementing the count for each instance
// 4. If we ever decrement past 0 than the two strings cannot be permutations of each other.

// This algorithm is more efficient since we only have to iterate through each string once.
// Iterating through each string will take: O(n + n) = O(n).
// This algorithm takes O(1) space since we have to create a character array of fixed size.

// Extensions used to help convert from ASCII to int
extension StringProtocol {
    var ascii: [UInt32] { return unicodeScalars.compactMap { $0.isASCII ? $0.value : nil } }
}

extension Character {
    var ascii: UInt32? { return String(self).ascii.first }
}

public func isPermutation2(stringA: String, stringB: String) -> Bool {
    // If the strings are of different lengths than they can't be permutations
    guard stringA.count == stringB.count else { return false }
    
    let encodingCount = 128 // Assume ASCII-Extended
    var charCountArray = Array(repeating: 0, count: encodingCount)
    
    // iterate through stringA incrementing character counts
    for c in stringA.ascii {
        let index = Int(c)
        charCountArray[index] += 1
    }
    
    // iterate through stringB decrementing character counts
    for c in stringB.ascii {
        let index = Int(c)
        charCountArray[index] -= 1
        
        // if we decrement past 0 than the two strings cannot be permutations of each other
        if (charCountArray[index] < 0) { return false }
    }
    
    return true
}

let stringA1 = ""
let stringB1 = ""

let stringA2 = "ABC"
let stringB2 = "CBA"

let stringA3 = "God"
let stringB3 = "dog"

let stringA4 = "hello   "
let stringB4 = "hello"

isPermutation(stringA: stringA1, stringB: stringB1) // true
isPermutation2(stringA: stringA1, stringB: stringB1) // true

isPermutation(stringA: stringA2, stringB: stringB2) // true
isPermutation2(stringA: stringA2, stringB: stringB2) // true

isPermutation(stringA: stringA3, stringB: stringB3) // false
isPermutation2(stringA: stringA3, stringB: stringB3) // false

isPermutation(stringA: stringA4, stringB: stringB4) // false
isPermutation2(stringA: stringA4, stringB: stringB4) // false
