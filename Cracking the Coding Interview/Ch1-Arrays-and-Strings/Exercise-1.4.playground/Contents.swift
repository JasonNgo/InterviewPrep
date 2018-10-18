// Jason Ngo
// Oct 18, 2018

// Given a string, write a function to check if it's a permutation of a palindrome.

// In order for a string to qualify as a palindrome, it needs to to be possible to
// write the word the same forwards and backwards. This leads to the deduction that
// in order for a word to be a palindrome it must have an even amount of each
// characters. In the case of an odd length string, there can only be one element
// with odd characters and the rest must be even.

// Algorithm:
// 1. Iterate through the string counting the number of characters
// 2. Iterate again through the string checking for more than one instance of
// an odd number of characters
// 3. If there is no more than 1 instance of an odd number of characters than
// the string is a permuation of a palindrome.

import Foundation // access replacingOccurrences

public func isPalindromePermutation(string: String) -> Bool {
    // check for an empty string
    guard !string.isEmpty else { return false }
    
    // setup
    var characterCount: [Character: Int] = [:]
    let trimmedString = string.replacingOccurrences(of: " ", with: "").lowercased()
    
    // trim whitespace and setup character count
    for c in trimmedString {
        if let count = characterCount[c] {
            characterCount[c] = count + 1
        } else {
            characterCount[c] = 1
        }
    }
    
    // iterate through hash table checking for more than 1 instance of odd characters
    var numberOfOddCharacters = 0
    for value in characterCount.values where value % 2 != 0 {
        // if multiple odd sets found than return false
        if numberOfOddCharacters > 1 {
            return false
        }

        numberOfOddCharacters += 1
    }
    
    // if 1 or more odd sets of characters than the input string is not a palindrome
    return numberOfOddCharacters == 0 || numberOfOddCharacters == 1
}

var testString1 = "Tact Coa"
var testString2 = "helloworld"
var testString3 = ""
var testString4 = "a"
var testString5 = "ab"
var testString6 = "aa"

assert(isPalindromePermutation(string: testString1) == true)
assert(isPalindromePermutation(string: testString2) == false)
assert(isPalindromePermutation(string: testString3) == false)
assert(isPalindromePermutation(string: testString4) == true)
assert(isPalindromePermutation(string: testString5) == false)
assert(isPalindromePermutation(string: testString6) == true)
