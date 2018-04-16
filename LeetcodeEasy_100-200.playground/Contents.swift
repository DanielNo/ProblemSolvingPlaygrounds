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
let x = generate(numRows: 4)
print(x)
