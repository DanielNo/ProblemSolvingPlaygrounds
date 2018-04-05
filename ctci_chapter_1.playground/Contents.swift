//: Playground - noun: a place where people can play

import UIKit

// 1.2 Check Permutation
// Approach 1 : Sort the strings, compare sorted strings for equality. Very clean but not optimal.
// Time : O(n log n)
// Space : O(n), O(1) if input strings are mutable
// Approach solved: Use a dictionary to track counts of characters in string 1, then eneumerate string 2 and decrease counts, if character in string 2 does not exist, return false, otherwise continue enumerating and return true at the end.
// Time : O(n)
// Space : O(n)

func isPermutationSimple(s1 : String, s2 : String) -> Bool{
    return s1.sorted() == s2.sorted()
}

func isPermutation(s1 : String, s2 : String) -> Bool{
    if s1.count != s2.count{
        return false
    }
    var dict : [Character : Int] = Dictionary()
    for char in s1{
        dict[char] = (dict[char] == nil) ? 1 : dict[char]! + 1
        print(char)

    }
    for char in s2{
        if dict[char] == nil {
            return false
        }else{
            if dict[char]! - 1 < 0 {
                return false
            }else{
                dict[char] = dict[char]! - 1
            }
        }
    }
//    print(dict)
    return true
}




// 1.5 ONE AWAY

func oneAway(s1 : String, s2 : String) -> Bool{
    let big = s1.count > s2.count ? s1 : s2
    let small = s1.count > s2.count ? s2 : s1
    let diff = big.count - small.count
    
    switch diff {
    case 0:
        return oneCharDiff(s1: s1, s2: s2)
    case 1:
        return oneInsert(big: big, small: small)
    default:
        return false
    }
    
}

func oneInsert(big : String, small : String) -> Bool{
    var diffChar : String = ""
    var diffIndex = 0
    for i in small.enumerated(){
        let index = i.offset
        let bigChar = strAtIndex(str: big, index: index)
        let smallChar = strAtIndex(str: small, index: index)
        if(bigChar != smallChar){
            diffChar = bigChar
            diffIndex = index
            break
        }
    }
    if diffChar == "" {
        diffChar = String(big.last!)
        diffIndex = big.count-1
    }
    var smallStr = small
    print("diffIndex : \(diffIndex) diffChar : \(diffChar)")
    let charIndex = smallStr.index(smallStr.startIndex, offsetBy: diffIndex)

    smallStr.insert(Character(diffChar), at: charIndex)
    return smallStr == big
}

func oneCharDiff(s1 : String, s2 : String) -> Bool{
    var diffs = false
    for index in 0..<s1.count{
        let c1 = strAtIndex(str: s1, index: index)
        let c2 = strAtIndex(str: s2, index: index)
        if (c1 != c2){
            if diffs {
                return false
            }else{
                diffs = true
            }
        }
    }
    return true
}

func strAtIndex(str : String, index : Int) -> String{
    let index = str.index (str.startIndex, offsetBy: index)
    return String(str[index])
}


oneAway(s1: "pales", s2: "pales")

// 1.6 String Compression
let c = Character(UnicodeScalar(65))
let s = String(UnicodeScalar(UInt8(65)))
let ss = "\u{66}"


func compressedString(s1 : String) -> String{
    var compressedString = ""
    var currentLetter = String(s1.first!)
    var currentCount = 0
    for char in s1.enumerated(){
        let letter = String(char.element)
        if currentLetter != letter {
            compressedString.append("\(currentLetter)\(currentCount)")
            currentCount = 1
            currentLetter = letter
            
        }else{
            currentCount+=1
        }
    }
    compressedString.append("\(currentLetter)\(currentCount)")

    return compressedString
}

//func smallerCompressedString(s1 : String) -> String{
//
//    if dict.keys.count < s1.count/2{
//        print("less")
//        return compressedString(s1: s1)
//    }else{
//        print("more")
//        return s1
//    }
//}
