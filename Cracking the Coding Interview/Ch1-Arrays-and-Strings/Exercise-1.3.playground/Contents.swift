// Jason Ngo
// Oct 18, 2018

// URLify: Write a method to replace all spaces in a string with '%20'. You may assume
// that the string has sufficient space at the end to hold the additional characters,
// and that you are given the "true" length of the string.

// Example:
// Input: "Mr John Smith    ", 13
// Output: "Mr%20John%20Smith"

import Foundation // need to important foundation to use replaceOccurrences...

// Extend the String struct to trim trailing/leading whitespace.
extension String {
    func trimSpaces() -> String {
        var temp = self
        
        while temp.hasPrefix(" ") {
            temp = String(temp.dropFirst())
        }
        
        while temp.hasSuffix(" ") {
            temp = String(temp.dropLast())
        }
        
        return temp
    }
}

// Uses Swifts built in function to replace spaces with "%20"
public func URLify(urlString: String) -> String {
    return urlString.trimSpaces().replacingOccurrences(of: " ", with: "%20")
}

// The algorithm behaves as follows:
// newLength represents the current index of the string where spaces are replaced with %20

// Algorithm:
// 1. Calculate the end index of the array after replacements have occured
// 2. Iterate through the string starting from the last character that is not a space
// 3. While iterating backwards, two possible options can occur:
// - we find a character: here we can insert the character and decrement the counter by 1
// - we find a space: here we insert "%20" and decremnt by 3

// This algorithm has a run-time of O(n) since we have to iterate through the input string once.
// It has a O(1) space complexity since we're making replacements in-place.

public func URLify(urlString: inout Array<Character>, count: Int) -> String {
    // newLength is the count after replacing spaces with "%20"
    var newLength = urlString.count - 1
    
    for i in (0..<count).reversed() {
        if urlString[i] != " " {
            urlString[newLength] = urlString[i]
            newLength -= 1
        } else {
            urlString[newLength] = "0"
            urlString[newLength - 1] = "2"
            urlString[newLength - 2] = "%"
            newLength -= 3
        }
    }
    
    return String(urlString)
}

var testString1 = "Mr John Smith    "
var testArray1 = Array<Character>(testString1)
var testString1Verified = "Mr%20John%20Smith"

assert(testString1Verified == URLify(urlString: testString1)) // true
assert(testString1Verified == URLify(urlString: &testArray1, count: 13)) // true
