//: Playground - noun: a place where people can play

import UIKit
/*
747. Largest Number At Least Twice of Others

 Approach : Find the first and second largest numbers. Keep track of the greatest index. Compare first being at least twice as large as second, return greatest index or -1. Don't have to check edge case of nums.count being empty as specified by reading the question carefully.
 
 Time Complexity : O(n)
 Space Complexity : O(1)
 
 */
func dominantIndex(_ nums: [Int]) -> Int {
    let count = nums.count
    var first = 0
    var second = 0
    var firstIndex = 0
    for (index,num) in nums.enumerated(){
        if num > first{
            second = first
            first = num
            firstIndex = index
        }else if num > second{
            second = num
        }
        
    }
    return first >= (second * 2) ? firstIndex : -1
}

dominantIndex([0,0,2,3])
dominantIndex([1])

/* 771. Jewels and Stones : https://leetcode.com/problems/jewels-and-stones/description/
 You're given strings J representing the types of stones that are jewels, and S representing the stones you have.  Each character in S is a type of stone you have.  You want to know how many of the stones you have are also jewels.
 The letters in J are guaranteed distinct, and all characters in J and S are letters. Letters are case sensitive, so "a" is considered a different type of stone from "A".
 
 Input: J = "aA", S = "aAAbbbb"
 Output: 3
 Example 2:
 
 Input: J = "z", S = "ZZ"
 Output: 0
 S and J will consist of letters and have length at most 50.
 The characters in J are distinct.
 
 Approach : Take the larger string and enumerate character counts into a dictionary. For each character match of the smaller string in the larger string, increment a counter and return it.
 Time : O(n) linear
 Space : O(n) linear space
 */

func numJewelsInStones(_ J: String, _ S: String) -> Int {
    var stones : [Character : Int] = Dictionary()
    var sum = 0
    for (index,char) in S.enumerated(){
        stones[char] = stones[char] == nil ? 1 : stones[char]! + 1
    }
    for char in J.enumerated(){
        sum += stones[char.element]!
    }
    return sum
}
