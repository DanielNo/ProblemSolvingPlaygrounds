import UIKit

// Typically used for finding pairs in a sorted array. Here for example, we are searching for a target sum of two numbers, which is a pair of numbers.
func twoPointers(_ arr : [Int], target : Int) -> (Int,Int){
    var i = 0
    var j = arr.count-1
    
    while i < j{
        let sum = arr[i] + arr[j]
        if sum == target{
            return (i,j)
        }else if(sum > target){
            j-=1
        }else if(sum < target){
            i+=1
        }
        
    }
    return (0,0)
}
