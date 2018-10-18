// Jason Ngo
// Oct 18, 2018

// One Edit: 3 types of edits can occur to a string: insert, remove, replace.
// Give two strings, check if they are 1 (or 0) edits away from each other

// We note the effects that one edit has on a string. If an insert or remove
// occurs the two string lengths will differ by 1. If a replace occurs, the
// strings will have the same length. We can use this fact to check which
// type of edit we should be looking for.

public func isEdit(stringA: String, stringB: String) -> Bool {
    
    // If the strings are the same return true since they will be 0-edits from each other
    guard stringA != stringB else { return true }
    
    // replacement case
    if stringA.count == stringB.count {
        return isReplacementEdit(stringA: stringA, stringB: stringB)
    }
    
    // check for insertion/removal case
    if stringA.count + 1 == stringB.count {
        return isOneEdit(stringA: stringA, stringB: stringB)
    } else if stringA.count - 1 == stringB.count {
        return isOneEdit(stringA: stringB, stringB: stringA)
    }

    return false
}

public func isReplacementEdit(stringA: String, stringB: String) -> Bool {
    var replacementOccured = false
    for i in stringA.indices where stringA[i] != stringB[i] {
        // will trigger if replacementOccured flag set to true beforehand
        if replacementOccured {
            return false
        }
        
        replacementOccured = true
    }
    
    return true
}

public func isOneEdit(stringA: String, stringB: String) -> Bool {
    var strAIndex = stringA.startIndex
    var strBIndex = stringB.startIndex
    
    // walks through both strings and compares values
    while strAIndex < stringA.endIndex && strBIndex < stringB.endIndex {
        if stringA[strAIndex] != stringB[strBIndex] {
            // the index was incremented beforehand and now compared to the other index
            if strAIndex != strBIndex {
                return false
            }
            
            strAIndex = stringA.index(after: strAIndex)
        } else {
            strAIndex = stringA.index(after: strAIndex)
            strBIndex = stringB.index(after: strBIndex)
        }
    }
    
    return true
}

var stringA1 = "Hello"
var stringB1 = "Hell"

var stringA2 = "Hello"
var stringB2 = "Hella"

var stringA3 = "Hellow"
var stringB3 = "Hello"

assert(isEdit(stringA: stringA1, stringB: stringB1) == true)
assert(isEdit(stringA: stringA2, stringB: stringB2) == true)
assert(isEdit(stringA: stringA3, stringB: stringB3) == true)
