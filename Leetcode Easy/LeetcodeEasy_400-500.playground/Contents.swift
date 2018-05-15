//: Playground - noun: a place where people can play

import UIKit

/*
 448. Find All Numbers Disappeared in an Array

 Brute force : Loop through the array, check every number and see if it exists, if not add to answer array
 Time complexity : O(n^2) , array.contains is a linear operation and it is nested within a for loop
 Space complexity : O(1)
 */

var input1 = [4,3,2,7,8,2,3,1]

func findDisappearedNumbersNaive(_ nums: [Int]) -> [Int] {
    let count = nums.count
    if(count == 0){
        return []
    }
    var ans = [Int]()
    for i in 1...count{
        if nums.contains(i) != true {
            ans.append(i)
        }
    }
    return ans
}

/*
 Approach : *Because the function declaration on leetcode does not allow me to mutate the input array, I must copy the array to a mutable array first. If I can change the function declaration, I would mark the array parameter as inout. I will assume the copied mutable array does not count towards extra space*
 
 Values in the array fall within a range limited by the size of the array. Because of this, we can mark numbers at index of a seen value as negative.
 
 Time complexity : O(n) linear
 Space complexity : O(1) constant if I ignore the answer array as noted on the leetcode question, and ignore the mutable array with copied values.
 
 Practice this again.
 
 */

func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
    var ans = [Int]()
    let count = nums.count
    var numsArr = nums
    for i in 0..<count{
        let num = nums[i]
        numsArr[num-1] = -num
    }
    for j in 0..<count{
        if(numsArr[j] > 0){
            ans.append(j+1)
        }
    }
    return ans
}
findDisappearedNumbers(input1)
