//: Playground - noun: a place where people can play

import UIKit

/*
 216. Combination Sum III

 
 */

var combos : [[Int]] = []
func combinationSum3(_ k: Int, _ n: Int) -> [[Int]] {
    let nums = [1,2,3,4,5,6,7,8,9]
    backtrack(k,n,nums,[])
    return combos
}

func backtrack(_ k : Int,_ n : Int,_ nums : [Int],_ currNums : [Int]) -> Void{
    if k < 0 || n < 0{
        return
    }else if(n == 0 && k == 0){
        combos.append(currNums)
        return
    }
    
    for (i,num) in nums.enumerated(){
        let range = Array(nums[i+1..<nums.count])
        var newNums = currNums
        newNums.append(num)
        let remainder = n - num
        if remainder < 0{
            return
        }else{
            backtrack(k-1,remainder,range,newNums)
        }
        
    }
}


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
