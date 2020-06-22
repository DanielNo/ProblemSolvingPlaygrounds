//: Playground - noun: a place where people can play

import UIKit

/*
 9. Palindrome Number
 
 Approach : Check for value in range 0-9, return true because it is a single digit palindrome.
 Convert Int to String, then to Character array.
 Iterate from head and tail using two pointers, compare values until failure or the two pointers pass each other.
 
 Time : O(n) Scan every character in array.
 Space : O(n) storing character array of the integer
 */

func isPalindrome(_ x: Int) -> Bool {
    if x < 0{
        return false
    }
    if x < 10 && x >= 0{
        return true
    }
    
    let chars = Array(String(x))
    
    var i = 0
    var j = chars.count-1
    
    while i < j{
        if chars[i] == chars[j]{
            i+=1
            j-=1
        }else{
            return false
        }
        
    }
    return true
}
/*
26. Remove Duplicates from Sorted Array
Approach : Loop through the array while checking current and next indices.
If a duplicate is found, remove the next index in the array.
Loop under bounds of array count -1 so that it is zero indexed and accounts for next value.

time : O(n), unless swift's remove function implementation is a costly operation
Space : O(1)

*/
func removeDuplicates(_ nums: inout [Int]) -> Int {
    var i = 0
    while(i < nums.count-1){
        if nums[i] == nums[i+1]{
            nums.remove(at: i+1)
        }else{
            i+=1
        }
    }
    return nums.count
}

/* 27. Remove Element
 Example 1:
 
 Given nums = [3,2,2,3], val = 3,
 
 Your function should return length = 2, with the first two elements of nums being 2.
 It doesn't matter what you leave beyond the returned length.
 Example 2:
 
 Given nums = [0,1,2,2,3,0,4,2], val = 2,
 
 Your function should return length = 5, with the first five elements of nums containing 0, 1, 3, 0, and 4.
 */

var arrCase1 = [3,2,2,3]
var arrCase2 = [0,1,2,2,3,0,4,2]
var arrCase3 = [3,3]
var arrCase4 = [3,3,3]

func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
    return 0
}
//removeElement(&arrCase1, 3)
removeElement(&arrCase2, 2)
//removeElement(&arrCase3, 3)

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
        
        
        
    }
    return globalMax
}




let ans2 = maxSubArray(input)
//let input = [-2,1,-3,4,-1,2,1,-5,4]
let ans = maxSubArrayBrute(input)

//let ans = maxSubArrayNaive(input3)

/*
58. Length of Last Word

Approach : Due to edge cases of trailing whitespace and string length 1, enumerate a character array backwards.

Time : O(n) reversing string takes linear time and iterating in reverse is also linear.
Space : O(n) for character array
*/

 func lengthOfLastWord(_ s: String) -> Int {
        let str = Array(s)
        var count = 0
        for (i,c) in str.reversed().enumerated(){
            if c == " "{
                if count > 0{
                    return count
                }else{
                    continue
                }
            }else{
                count += 1
            }
        }
        return count
    }


/* 100. Same Tree
 Approach : Use recursion and compare values of nodes.
 Time Complexity : O(n)
 Space Complexity : O(h) where h is the height of the shorter tree
 */

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
    if (p == nil && q == nil){
        return true
    }else if(p == nil || q == nil){
        return false
    }
    if(p!.val == q!.val){
        return isSameTree(p!.left, q!.left) && isSameTree(p!.right, q!.right)
    }else{
        return false
    }
}



