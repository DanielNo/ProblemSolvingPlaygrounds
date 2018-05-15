//: Playground - noun: a place where people can play

import UIKit

/*
53. Maximum Subarray
 Input: [-2,1,-3,4,-1,2,1,-5,4],
 Output: 6
 Explanation: [4,-1,2,1] has the largest sum = 6.

 
 
*/

/*
 O(n^2) brute force solution. Check all subarrays using nested loops.
 */


let input = [-2,1,-3,4,-1,2,1,-5,4]



func maxSubArrayNaive(_ nums: [Int]) -> Int {
    var highest = Int.min
    for (index,num) in nums.enumerated(){
        var sum = num
        highest = sum > highest ? sum : highest
        for index2 in index+1..<nums.count{
            sum = sum + nums[index2]
            highest = sum > highest ? sum : highest
        }
    }
    return highest
}

// Look at all possible subarrays in a brute force approach
func maxSubArrayBrute(_ nums: [Int]) -> Int{
    let count = nums.count
    if(count == 1){
     return nums.first!
    }
    var greatest = 0
    for i in (0..<count).reversed(){
        for j in 0...i{
            let subArray = nums[j..<i]
//            print(subArray)
            let sum = subArray.reduce(0, +)
            if sum > greatest {
                greatest = sum
            }
        }
    }
    return greatest
}

func maxSubArray(_ nums: [Int]) -> Int {
    let count = nums.count
    if count <= 1 {
        return nums.first!
    }
    var globalMax = nums[0]
    var localMax = nums[0]


    for (index,num) in nums.enumerated(){
        let subArray = nums[0...index]
        let sum = subArray.reduce(0, +)
        localMax = sum > nums[index] ? sum : nums[index]
        print(localMax)
        
        
        
    }
    return globalMax
}




let ans2 = maxSubArray(input)
//let input = [-2,1,-3,4,-1,2,1,-5,4]
let ans = maxSubArrayBrute(input)

//let ans = maxSubArrayNaive(input3)

