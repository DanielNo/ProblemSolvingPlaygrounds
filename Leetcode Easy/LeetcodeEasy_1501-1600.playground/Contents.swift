import UIKit

/*
1512. Number of Good Pairs
Approach : Brute force nested for loops

Note: After looking at answers, found there is a math equation that calculates number of pairs in N elements. The formula is
n*(n-1) / 2

Time : O(n)^2
Space : O(1)
*/

func numIdenticalPairs(_ nums: [Int]) -> Int {
        var count = 0
        
        for i in 0..<nums.count{
            for j in i+1..<nums.count{
                if nums[i] == nums[j] && i < j{
                count+=1
                            
                }
                
            }
        }
        return count
}


/*
1528. Shuffle String

Approach : Create an array with the input string's size. Loop through one array and rewrite values.

Time: O(n)
Space: O(n)

*/

func restoreString(_ s: String, _ indices: [Int]) -> String {
        var ans = Array(s)
        for (i,c) in s.enumerated(){
            let newIndex = indices[i]
            ans[newIndex] = c
        }
        return String(ans)
    }
