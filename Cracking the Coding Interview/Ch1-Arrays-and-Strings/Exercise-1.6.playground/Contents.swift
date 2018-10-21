// Jason Ngo
// Exercise 1.6

// String compression. Given a string of characters, compress them using the counts of
// repeated characters. If the compressed version is longer than the input string,
// than return the original string

// Input: aabbccccaa
// Output: a2b2c4a2

public func compress(string: String) -> String {
    
    var currentIndex = string.startIndex
    var result: String = ""
    var character: Character
    
    character = string[currentIndex]
    
    var count = 0
    while currentIndex < string.endIndex {
        if string[currentIndex] == character {
            currentIndex = string.index(after: currentIndex)
            count += 1
        } else {
            result = result + "\(character)" + "\(count)"
            count = 0
            character = string[currentIndex]
        }
    }
    
    result = result + "\(character)" + "\(count)"
    
    return result.count > string.count ? string : result
}

var input = "abcdef"
compress(string: input)
