import UIKit

/* 268. Missing Number
 Approach : To get the answer in linear time and without extra space, get the sum of the values in the input array.
 Then take the sum of 1...n and return the difference of the two to find the missing number.
 
 Time Complexity : O(n)
 Space Complexity : O(1)
 
 */

func missingNumber(_ nums: [Int]) -> Int {
    let total = nums.reduce(0, +)
    let count = nums.count
    var sum = 0
    for num in 1...count{
        sum += num
    }
    return sum - total
}


/*
 283. Move Zeroes

 */



var input1 = [0, 1, 0, 3, 12]
var input2 = [1,0,3,12,0]
var input3 = [0,0,1]
var input4 = [1,0,0,5,0,7,0]
var input5 = [10,0,0,0,99,99,100,0,202]

/*
 
 Review this again
 */

func moveZeroes(_ nums: inout [Int]) {
    print("input : \(nums)")
    let count = nums.count
    var nIndex = 0
    for i in 0..<count{
        if nums[i] != 0{
            let temp = nums[nIndex]
            nums[nIndex] = nums[i]
            nums[i] = temp
            nIndex+=1
        }
        print(nums)
        
    }
    
}

/*
 
 Naive solution : Scan the array each time for the first 0 and nonzero value. Swap them and repeat.
 
 Time Complexity : O(n^2)
 Space Complexity : O(1) no extra space used
 */


func moveZeroesNaive(_ nums: inout [Int]) {
    var zIndex = -1
    var nIndex = -1
    let count = nums.count
    for i in 0..<count{
        if nums[i] != 0 {
            continue
        }
        for j in i..<count{
            if nums[j] == 0 && zIndex == -1 {
                zIndex = j
            }
            if nums[j] != 0 && nIndex == -1 {
                nIndex = j
            }
        }
        if nIndex != -1 && zIndex != -1 {
            let temp = nums[nIndex]
            nums[nIndex] = nums[zIndex]
            nums[zIndex] = temp
            nIndex = -1
            zIndex = -1
        }
    }
}

/*
Solution found on leetcode
*/
func moveZeroes2(_ nums: inout [Int]) {
    print("input : \(nums)")
    var insertPos = 0
    for num in nums{
        if num != 0 {
            nums[insertPos] = num
            insertPos += 1
            print(nums)

        }
    }
    print(insertPos)
    
    while insertPos < nums.count {
        nums[insertPos] = 0
        insertPos += 1
    }
    
    
}


moveZeroes(&input5)
//moveZeroes(&input1)
