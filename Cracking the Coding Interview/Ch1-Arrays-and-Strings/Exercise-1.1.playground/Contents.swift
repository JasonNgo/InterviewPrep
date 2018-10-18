// Jason Ngo
// Oct 18, 2018
// CTCI - Chapter 1 - Exercise 1.1

// IsUnique: Implement an algorithm to determine if a string has all unique characters. What if you cannot use
// additional data strctures?

// One important thing to note is what unique set of characters is the string using? ASCII? UTF-8? etc.

// Assuming we're allowed to use additional data structures, than the Set struct would make this question very simple.
// We compare the size of the set with the size of the string to see if the string is made of unique characters

// Algorithm steps (with Set)
// 1. Create a set
// 2. Iterate through the string, inserting into the set if possible
// 3. Compare the size of the string with the size of the set. If equal than the string uses all unique characters.

public func isUniqueWithSet(testString: String) -> Bool {
    
    // ensure the string isn't empty
    // returns true since a string with no characters still has only unique characters
    guard !testString.isEmpty else { return true }
 
    // create the character set
    var characterSet = Set<Character>()
    
    // iterate through the string, inserting if possible
    for char in testString {
        characterSet.insert(char)
    }
    
    // compare the sizes of set and string
    return characterSet.count == testString.count
}

// If we're not allowed to use additional data structures, we can still use an array.
// Create an array of bools (flags) that are marked true when a character is encountered.
// If we can iterate through the entire string than the string is unique.

// Algorithm steps (without set)
// 1. Create an array of size (128, 256, etc - depends on encoding)
// 2. Iterate through the string, marking flags as true when we encounter characters
// 3. If at anytime we check for a flag and it's already marked true than we can return false

// Assume we're using ASCII encoding.

// Extend string and character to make accessing ASCII value easier
extension StringProtocol {
    var ascii: [UInt32] { return unicodeScalars.compactMap { $0.isASCII ? $0.value : nil } }
}

extension Character {
    var ascii: UInt32? { return String(self).ascii.first }
}

public func isUniqueWithArray(testString: String) -> Bool {
    
    // ensure the string isn't empty
    // returns true since a string with no characters still has only unique characters
    guard !testString.isEmpty else { return true }
    let encodingCount = 128 // change depending on encoding
    
    var characterFlags = Array(repeating: false, count: encodingCount)
    
    for ASCII in testString.ascii {
        let index = Int(ASCII)
        print(index)
        
        if characterFlags[index] == false {
            characterFlags[index] = true
        } else {
            return false
            
        }
    }
    
    return true
}

// Small test cases
var testString = "hello world"
var testString2 = "abcdefghijklmnopqrstuvwxyz"
var testString3 = ""

isUniqueWithSet(testString: testString) // returns false
isUniqueWithSet(testString: testString2) // returns true
isUniqueWithSet(testString: testString3) // returns true

isUniqueWithArray(testString: testString) // returns false
isUniqueWithArray(testString: testString2) // returns true
isUniqueWithArray(testString: testString3) // returns true
