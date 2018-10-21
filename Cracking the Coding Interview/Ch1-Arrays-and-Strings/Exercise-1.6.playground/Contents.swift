// Jason Ngo
// Exercise 1.6

// String compression. Given a string of characters, compress them using the counts of
// repeated characters. If the compressed version is longer than the input string,
// than return the original string

// Input: aabbccccaa
// Output: a2b2c4a2

//

public func compress(string: String) -> String {
    
    // Create an array to hold each set of repeated characters
    // we can reserve space for the array since we know the max number of possible entries is equal to
    // the number of characters in the string.
    typealias Entry = (character: Character, count: Int)
    var entries: [Entry] = []
    entries.reserveCapacity(string.count)
    
    var currentIndex = string.startIndex
    var character = string[currentIndex] // init to first character
    var count = 0                        // number of repeated characters
    
    // iterate through the string counting the number of repeating characters
    while currentIndex < string.endIndex {
        if string[currentIndex] == character {
            currentIndex = string.index(after: currentIndex)
            count += 1
        } else {
            entries.append(Entry(character: character, count: count))
            count = 0
            character = string[currentIndex]
        }
    }
    
    entries.append(Entry(character: character, count: count))
    
    // if the length of the compressed version is longer than the input string, return input string
    // we multiply the number of entries by 2 since each entry has a character and count associated with it.
    if (entries.count * 2) > string.count { return string }
    
    var result: String = ""
    for entry in entries {
        result = result + "\(entry.character)\(entry.count)"
    }
    
    return result
}

var input = "abcdef"
compress(string: input)

var input2 = "aabbccccaa"
compress(string: input2)
