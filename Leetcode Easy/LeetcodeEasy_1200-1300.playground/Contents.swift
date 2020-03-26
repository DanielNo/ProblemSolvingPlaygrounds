import UIKit
/*
1221. Split a String in Balanced Strings

Balanced strings are those who have equal quantity of 'L' and 'R' characters.
Given a balanced string s split it in the maximum amount of balanced strings.
Return the maximum amount of splitted balanced strings.

Example 1:

Input: s = "RLRRLLRLRL"
Output: 4
Explanation: s can be split into "RL", "RRLL", "RL", "RL", each substring contains same number of 'L' and 'R'.
 
 Initial thoughts : Clueless, had to look at answer. Will implement the solution at least for practice.
 
 Approach : Use a greedy algorithm which obtains an answer at each local step of the problem.
 
 Time : O(n)
 Space : O(1)
 
*/

func balancedStringSplit(_ s: String) -> Int {
    var ans = 0
    var count = 0
    for (index,char) in s.enumerated(){
        if char == "R"{
            count += 1
        }else if char == "L"{
            count -= 1
        }
        if count == 0{
            ans+=1
        }
    }
    
    return ans
}

balancedStringSplit("RLLLLRRRLR")

/*
 1266. Minimum Time Visiting All Points

 Approach 1: Use a greedy algorithm to travel diagonally until you cant. Find the difference in coordinates with consideration to negative and positive coords. The number of total moves between two coordinate sets, will be the greater value of the x and y coordinate differences. 
 
 */

func minTimeToVisitAllPoints(_ points: [[Int]]) -> Int {
    var prev : [Int] = []
    var ans = 0
    
    for (index,pt) in points.enumerated(){
        if index != 0 {
            let xDiff = abs(prev[0] - pt[0])
            let yDiff = abs(prev[1] - pt[1])
            let greaterVal = xDiff > yDiff ? xDiff : yDiff
            ans += greaterVal
        }
        prev = pt
    }
    return ans
}


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
 1290. Convert Binary Number in a Linked List to Integer
 Approach 1 (wrong): Keep track of binary val and * 2. Add to sum and return.
 
 Approach (cheating) : Bitwise operation, this should have been an obvious choice for bitwise operations, need to refresh on bitwise operators for the future.
 
 */

// Wrong first attempt
func getDecimalValueWrong(_ head: ListNode?) -> Int {
    var ptr = head
    var count = 0
    var base = 1
    
    
    while ptr != nil{
        let num = base * ptr!.val
        count += num
        ptr = ptr?.next
    }
    return count
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

