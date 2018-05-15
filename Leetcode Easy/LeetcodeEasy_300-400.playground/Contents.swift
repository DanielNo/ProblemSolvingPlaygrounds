//: Playground - noun: a place where people can play

import UIKit

/*
 387. First Unique Character in a String
 
 Approach : Map counts of characters in dictionary. Traverse the string and return the first dictionary value that has one occurence.
 Time Complexity : O(n)   , O(2n) computations
 Space Complexity : O(n)
 */

// Naive solution with mapping, this can be optimized..
func firstUniqChar(_ s: String) -> Int {
    var dict : [Character : Int] = Dictionary()
    for (index,char) in s.enumerated(){
        if let count = dict[char]{
            dict[char] = dict[char]! + 1
        }else{
            dict[char] = 1
        }
    }
    var index = -1
    for (index,char) in s.enumerated(){
        if dict[char] == 1 {
            return index
        }
    }
    return index
    
}
