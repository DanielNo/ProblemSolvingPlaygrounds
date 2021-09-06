import UIKit

/*
1920. Build Array from Permutation
Approach: Create an array and overwrite or insert values to empty array. Very simple question with high acceptance rate. It gives the answer in the problem's wording.
Time : O(n)
Space : O(n)
Note: Followup question to solve with O(n) space requires bitshifting. Not going to look into that approach at this time.
*/

    func buildArray(_ nums: [Int]) -> [Int] {
        var ans : [Int] = []
        var i = 0
        
        for (i,n) in nums.enumerated(){
            ans.append(nums[nums[i]])
        }
        
        return ans
    }
