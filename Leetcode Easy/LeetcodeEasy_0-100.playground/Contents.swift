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
14. Longest Common Prefix

Approach : We want to check each individual letter of each string for a match.
To outer for loop bounds will be the shortest string's length, because a prefix match will be at most, the length of the shortest string.
The inner for loop is iteration of each word in the input array.
For each letter index of the outer for loop, we will iterate every word.


Time: O(S) where S is the sum of all characters in the string. This is the worst case and should be used as the time complexity
Space: O(n) for a character array copy of the input array.


Note : Had some difficulty coding up the solution because I had never coded up a similiar problem, also did not correctly code it up a few times. But the approach to solving the problem was trivial.
Time complexity thoughts were wrong as I stated the exact time under the optimal case. Going forward, make sure to estimate time complexity on the worst case.


*/


 func longestCommonPrefix(_ strs: [String]) -> String {
        var pref = ""
        var count = Int.max
        
        if strs.count == 1{
            return strs[0]
        }else if(strs.count == 0){
            return pref
        }
        
        var chars : [[Character]] = strs.map{
            count = min(count,$0.count)
            return Array($0)
        }
        
// Count is the shortest length String
// Get the i'th letter of the first word to use as a comparison
// Check each word excluding the first word for a match
        for i in 0..<count{
            let letter = chars[0][i]
            for j in 1..<chars.count{
                if chars[j][i] == letter{
                    continue
                }else{
                    return pref
                }
            }
            pref+=String(letter)
        }
        
        return pref
    }

/*
 20. Valid Parentheses
 
 Approach : Use a stack like data structure to push and pop characters. If an enclosing character is encountered (")" "}" ]") , compare last element on stack with current element. If an inverse or matching opening and closing character set is found, pop item from stack and do not append. Otherwise, push an opening character to stack.
 Can also use a string or an array to mimic a stack data structure by using append and remove last.
 
 Time : O(n)
 Space : O(n)
 
 */

func isValid(_ s: String) -> Bool {
    var stack = String()
    
    for c in s{
        if let last = stack.last{
            if isInverse(last, c2 : c){
                stack.removeLast()
            }else{
                stack.append(c)
            }
        }else{
            stack.append(c)
        }
        print(c)
    }
    
    if stack.count == 0{
        return true
    }else{
        return false
    }
}

func isInverse(_ c1 : Character, c2 : Character)->Bool{
    if c1 == "(" && c2 == ")"{
        return true
    }else if(c1 == "[" && c2 == "]"){
        return true
    }else if (c1 == "{" && c2 == "}"){
        return true
    }
    return false
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

/*
53. Maximum Subarray
Approach : Looked at a very simple to read version of Kadane's algorithm which optimally solves the problem.
Basically it means, keep track of the current maximum subarray, if the subarray goes negative, we start over from 0. This is calculated by max(currMax,0), add the current number to get the new currentMax. To update the totalMax, we get the greater value of currMax or totalMax.
Note: Memorize this easy implementation and edit it to fit other problems. Try solve again.

Time: O(n)
Space: O(1)

*/
func maxSubArrayOptimal(_ nums: [Int]) -> Int {
        var totalMax = Int.min
        var currMax = Int.min
        for (i,num) in nums.enumerated(){
            currMax = max(currMax,0) + num
            totalMax = max(totalMax, currMax)
        }
        return totalMax
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

/*
66. Plus One

Approach: Problem looks deceptively easy, but if you think for a moment you will realize that carrying places will be the problem to solve.
Create a for loop that will increment by one, starting at the end of the array.
Increment the number by 1. If the sum is less than 10, return the array.
If the sum is not less than 10, we set the current digit to 0 so that the next iteration of the loop will increment the next tens' place by 1.

Note : Cheated but was able to code up the solution shown in discussion.
Very good logic that is transformed into simple and concise code.

Time : O(n) worst case of [9,9,9,9,....,9]
Space : O(1) if not considering mutable array. Ideally the input array should be mutable to not use extra space.

*/
func plusOne(_ digits: [Int]) -> [Int] {
        let count = digits.count-1
        var ans = digits
         
        for i in (0...count).reversed(){
            ans[i] = ans[i] + 1
            if ans[i] < 10{
                return ans
            }
            ans[i] = 0
        }
         
        return [1]+ans
    }

/*
 70. Climbing Stairs
 Approach : This is an basic dynamic programming problem with recursion.
 It may not be obvious but this question is asking for a fibonacci value. Build up a memoized dictionary of previous values and return.
 
 Note : Tried backtracking initially but got time limit exceeded. Peeked at discussion titles and saw it was fibonacci sequence. Wrote it down on paper and was able to code up quickly without much trouble.
 
 Time: O(n)
 Space : O(n) for memo table
 
 */
var memo : [Int : Int] = [0:0,1:1,2:2]
func climbStairs(_ n: Int) -> Int {
    let ans = climb(n)
    return ans
}
func climb(_ count : Int)->Int{
    if let memoVal = memo[count]{
        return memoVal
    }else{
        let val = climb(count-2) + climb(count-1)
        memo[count] = val
        return val
    }
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



