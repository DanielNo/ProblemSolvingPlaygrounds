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

/*
 1480. Running Sum of 1d Array

 Approach : Create a variable that will store the running sum. For each index, add number to sum and write to output array.
 
 Time : O(n)
 Space : O(n) for output array. Could be O(1) if mutating input array.
 */
func runningSum(_ nums: [Int]) -> [Int] {
    let count = nums.count
    var sum = 0
    var ans = Array(repeating: 0, count : count)
    for (i,n) in nums.enumerated(){
        sum += n
        ans[i] = sum
    }
    return ans
}
