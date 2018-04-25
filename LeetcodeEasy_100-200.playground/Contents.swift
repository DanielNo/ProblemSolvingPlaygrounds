//: Playground - noun: a place where people can play

import UIKit

/*
 118. Pascal's Triangle
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
    print(triangle)

    return triangle
    
}
//let rows = generate(numRows: 4)

/*
 121. Best time to buy and sell stock
 https://leetcode.com/problems/best-time-to-buy-and-sell-stock/description/

 Naive Approach : Calculate the profit for each value in array individually. Traverse through array and for each value, find the max value in the subarray excluding previous numbers.
 Ex : [1,2,3,4,5]   for number n at index i=0 : find max of [2,3,4,5]
 ans = 0
 ans = n - max[2,3,4,5]
 return ans
 
 Time complexity : O(n^2). Finding the max of the subarray which is O(n) nested within another for loop.
 Space complexity : O(1)
 Note : Fails on edge case where all numbers in a large array where following numbers are all smaller. EX: [1000,999,998...0]
 */
func maxProfitNaive(_ prices: [Int]) -> Int {
    let count = prices.count
    var ans = 0
    switch count {
    case _ where count == 2:
        ans = prices[0] < prices[1] ? prices[1]-prices[0] : 0
    case _ where count < 2:
        break
    default:
        for (index,num) in prices.enumerated() {
            let sellPrices = prices[index+1..<prices.count]
            if sellPrices.count == 0 {
                break
            }
            let max = sellPrices.max()
            let profit = max! - num
            ans = profit > ans ? profit : ans
        }
        break
    }
    return ans
}

maxProfitNaive([7,1,5,3,6,4])

/*
 Approach : Create a lookup table for the max value after an index by reverse enumerating through the prices array. Use previous values(memoization) to add a new max value to the table. Loop through the array again and
 Time Complexity : O(n) linear run time, O(2n) calculations
 Space Complexity : O(n)
*/
func maxProfit(_ prices: [Int]) -> Int {
    let count = prices.count
    var maxDict : [Int : Int] = [:]
    var min = Int.max
    var ans = 0
    for (index,num) in prices.enumerated().reversed(){
        if index == count-1 {
            maxDict[index] = num
            continue
        }
        let prevMax = maxDict[index+1]!
        maxDict[index] = num > prevMax ? num : prevMax
        
    }
    for (index,num) in prices.enumerated(){
        min = num < min ? num : min
        let profit = maxDict[index]! - min
        ans = profit > ans ? profit : ans
    }
    return ans
}
maxProfit([7,1,5,3,6,4])

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
//let singleNum = singleNumber(nums)
