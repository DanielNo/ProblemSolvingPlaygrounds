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
