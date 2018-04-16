//: Playground - noun: a place where people can play

import UIKit

/*
 Pascal's Triangle
 https://leetcode.com/problems/pascals-triangle/description/
 
 Approach : First create a 2d array with the required space beforehand. Initialize all values to 1. Use pattern matching and nested statements to overwrite existing values.
 
 Time complexity : Linear O(n)
 Space complexity : Linear O(n)

 */

func generate(numRows : Int) -> [[Int]]{
    var triangle : [[Int]] = []
    triangle.reserveCapacity(numRows)
    
    for num in 0..<numRows{
        let row = Array(repeating: 1, count: num+1)
        triangle.append(row)
    }
    
    if numRows > 2 {
        for (index,row) in triangle.enumerated(){
            switch index {
            case _ where index < 2:
                break
            default:
                for rowVal in 0...index{
                    switch rowVal {
                    case _ where rowVal == 0 || rowVal == index:
                        continue
                    default:
                        triangle[index][rowVal] = triangle[index-1][rowVal-1] + triangle[index-1][rowVal]
                    }
                }
                break
            }
        }
    }
    return triangle
    
}
let rows = generate(numRows: 1)

/*
 136. Single Number
 Approach : Looking for a single number in an array with all others being duplicates.
 Using XOR num xor 0 will return num.
 Using XOR on a different number will add the result.
 Using XOR on a duplicate number will subtract the result.
 Basically using xor on this number set will decide to either add or subtract the given number and will return the single occurence number.
 
 Time Complexity : O(n)
 Space Complexity : O(1)
 
 */
func singleNumber(_ nums: [Int]) -> Int {
    var res = 0
    for num in nums{
        res = res ^ num
        print(res)
    }
    return res
}
let nums = [1,5,6,5,6,3,1]
let singleNum = singleNumber(nums)


