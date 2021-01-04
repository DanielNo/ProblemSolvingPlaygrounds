//: Playground - noun: a place where people can play

import UIKit

/*
 216. Combination Sum III

 Approach : Use backtracking and a bottom up approach to break this problem down into sub problems.
 Each backtrack will attempt every available choice that can lead to an answer. This will reduce the numbers remaining with each call, until we have a valid combination. The trick here is that since we can't use duplicates and have choices in the range of 1-9, we reduce the candidates at each step by using only numbers higher than the current number in question.
 Ex : 1,3,7 = 11
 3,1,7 = 11 cannot be used because we only can use numbers higher than the current. This prevents duplicates from occuring in different orders.
 
 Time : O(9!-K)/(9-k) taken from solutions.
 Space : O(h) for call stack, and O(K) to store elements?
 
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
        let nextSubrange = Array(nums[i+1..<nums.count])
        var currentCombinationOfNumbers = currNums
        currentCombinationOfNumbers.append(num)
        let remainingSum = n - num
        if remainingSum < 0{
            return
        }else{
            backtrack(k-1,remainingSum,nextSubrange,currentCombinationOfNumbers)
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
