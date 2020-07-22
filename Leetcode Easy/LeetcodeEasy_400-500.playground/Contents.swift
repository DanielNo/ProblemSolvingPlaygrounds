//: Playground - noun: a place where people can play

import UIKit

/* 404. Sum of Left Leaves
 Approach : Recursively add left *Leaves* using a helper function. Leaves do not have any children.
 Time Complexity : O(n)
 Space Complexity : O(h) where h is the height of the tree.
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

func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
    return sumLeft(root?.left, true) + sumLeft(root?.right, false)
}

func sumLeft(_ node: TreeNode?, _ isLeft : Bool) -> Int{
    if(node == nil){
        return 0
    }
    if(node?.left == nil && node?.right == nil){
        return isLeft ? node!.val : 0
    }
    return sumLeft(node?.left, true) + sumLeft(node?.right, false)
    
}

/*
414. Third Maximum Number

Approach : Keep track of first, second and third max numbers by initializing with Int minimum value. (should also be able to use null value or optional)
Loop through values and make comparisons. Push values of max and second max to second and third max respectively. Be careful of order of operations while assigning the new overwriting value before pushing the values down. A few edge cases to consider : same number being second and third max which should return the first max. Ex : 3, 2, 2 should return 3

Time : O(n) loop through array.
Space : O(1) Constant space, only requires 3 variables and does not grow with increasing input


*/


func thirdMax(_ nums: [Int]) -> Int {
    let count = nums.count
    if count == 1{
        return nums[0]
    }
    var max = Int.min
    var secondMax = Int.min
    var thirdMax = Int.min
    
    for (i,num) in nums.enumerated(){
        if(num == max || num == secondMax || num == thirdMax){
            continue
        }else if num > max{
            thirdMax = secondMax
            secondMax = max
            max = num
        }else if num > secondMax{
            thirdMax = secondMax
            secondMax = num
        }else if num > thirdMax{
            thirdMax = num
        }
    }
    
    if thirdMax == Int.min{
        return max
    }else{
        return thirdMax
    }
}
/*
448. Find All Numbers Disappeared in an Array (resolved)
Approach(cheated): Mark an occurence of a number as negative. Because some numbers may appear twice, perform a check that the number is positive before marking as negative.
We mark the values in the array by using their indexes. Ex: [3,2,1]. We iterate 3, mark arr[3] as -arr[3] but since 3 is out of bounds, we decrement this index by 1. So arr[3-1] = arr[3-1] * -1

Note : Should try solving again because it took many attempts to submit an answer.

Time : O(n)
Space : O(1) because the output array is assumed to not take extra space.

*/
func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        
    var arr = nums
        var ans : [Int] = Array()
        
        for num in arr{
            let i = num-1
            let val = arr[i]
            if val > 0{
                arr[i] = arr[i] * -1
            }
        }
        
        for (i,val) in arr.enumerated(){
            if val > 0{
                ans.append(i+1)
            }
        }
        
        
        return ans
    }



/*
 448. Find All Numbers Disappeared in an Array

 Naive Approach : Loop through the array, check every number and see if it exists, if not add to answer array
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
 Better Approach : *Because the function declaration on leetcode does not allow me to mutate the input array, I must copy the array to a mutable array first. If I can change the function declaration, I would mark the array parameter as inout. I will assume the copied mutable array does not count towards extra space*
 
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

/* 476. Number Complement
 Approach : Convert the int to binary. Flip the binary number using XOR 1 and return it.
 Time complexity : O(n)
 Space Complexity : O(n)
 
 */
func findComplement(_ num: Int) -> Int {
    let str = String(num, radix: 2)
    var ans = 0
    var current = 1
    for (i,char) in str.reversed().enumerated(){
        let val = Int(String(char))!
        let flipped = val ^ 1
        ans += flipped * current
        current = current * 2
        
    }
    return ans
}


/*
 485. Max Consecutive Ones
 Approach : Keep track of the count of consecutive 1's. Keep track of greatest count of consecutive 1's. If the current number of consecutive 1's is greater than the greatest consecutive 1's, assign the current to greatest.
 Time Complexity : O(n)
 Space Complexity : O(1)
 */

func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
    var greatest = 0
    var oneCount = 0
    for num in nums{
        if num == 1{
            oneCount += 1
        }else{
            if oneCount > greatest{
                greatest = oneCount
            }
            oneCount = 0
        }
    }
    if oneCount > greatest{
        greatest = oneCount
    }
    return greatest
}

