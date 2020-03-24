import UIKit

/*
1281. Subtract the Product and Sum of Digits of an Integer
 
 Approach 1: Use modulo and divide by 10 to get digits. Apply simple math with digits.
 Result : Easiest leetcode problem so far, got it in one attempt.
 
 Time : O(log n)
 Space : O(1)
*/

func subtractProductAndSum(_ n: Int) -> Int {
    var product = 1
    var sum = 0
    var num = n
    
    while num > 0{
        let digit = num % 10
        product *= digit
        sum += digit
        num = num/10
    }
    return product - sum
}

/*
1295. Find Numbers with Even Number of Digits
 
 Approach: Find number of digits by dividing by 10, keep track of digits and sum of even digits. Find if even by using modulo 2
 Result: Accepted on first try. Didnt read constraints, possible to optimize a bit but my initial solution was fine.
 
 Time : O(n)
 Space : O(1)
*/
func findNumbers(_ nums: [Int]) -> Int {
    var even = 0
    for (index,num) in nums.enumerated(){
        var n = num
        var count = 0
        while n > 0{
            count += 1
            n = n / 10
        }
        if count % 2 == 0{
            even += 1
        }
    }
    return even
}

