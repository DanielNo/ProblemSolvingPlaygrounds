import UIKit

/*
 905. Sort Array By Parity
 Given an array A of non-negative integers, return an array consisting of all the even elements of A, followed by all the odd elements of A.

 You may return any answer array that satisfies this condition.

Approach 1(trivial): Filter array for odd and even, and combine into new array. Not very efficient but very simple to implement.
 
 Approach 2: In place swap. Took a few submissions for edge cases using while loop. After cheating, learned the question is solvable with a for loop. TODO : attempt with a for loop
 
 */

func sortArrayByParity(_ A: [Int]) -> [Int] {
    var nums = A
    var i = 0
    var j = nums.count-1
    while i < j{
        if nums[i]%2 == 0 {
            i+=1
        }else if(nums[j]%2 == 0){
            let temp = nums[i]
            nums[i] = nums[j]
            nums[j] = temp
            j-=1
            i+=1
        }else{
            j-=1
        }
    }
    return nums
}
sortArrayByParity([3,1,2,4,6,9,4,2,1,0,7])
//sortArrayByParity([1,3])
