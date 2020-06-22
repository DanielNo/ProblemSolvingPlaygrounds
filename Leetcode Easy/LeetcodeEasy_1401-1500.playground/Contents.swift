import UIKit


/*
1464. Maximum Product of Two Elements in an Array
Approach : Find first and second greatest elements in array. Subtract 1 from each value and return product. Pretty straightforward problem
Time : O(n)
Space : O(1)
*/

func maxProduct(_ nums: [Int]) -> Int {
    let count = nums.count
    if count == 2{
        return (nums[0]-1) * (nums[1]-1)
    }
    
    var first = 0
    var second = 0
    
    for (i,num) in nums.enumerated(){
        if num >= first{
            second = first
            first = num
        }else if num >= second{
            second = num
        }


    }
    return (first-1) * (second-1)
}
