//: Playground - noun: a place where people can play

import UIKit

/* 287. Find the Duplicate Number

 
 */

let input1 = [1,3,4,2,2]
let input2 = [3,1,3,4,2]
let input3 = [5,1,5,4,2]


func findDuplicate(_ nums: [Int]) -> Int {
    let count = nums.count
    let sum = nums.reduce(0, +)
    var sum2 = 0
    for num in 1...count{
       sum2 += num
    }
    print(sum2)
    
    return sum2 - sum - 1
}

//findDuplicate(input1)
findDuplicate(input2)
//findDuplicate(input3)
