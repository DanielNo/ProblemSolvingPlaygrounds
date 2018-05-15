//: Playground - noun: a place where people can play

import UIKit


/*  506. Relative Ranks
 Approach : Sort the array to get the ranks of all elements. Create a dictionary that can look up each number's sorted rank specified by the sorted array's index. Indexes 0-2 are medals, so a switch statement will add medal names instead of ranks. Create a result array, which will lookup the original array values for a string, and append the string value to the result array.
 
 Time Complexity : O(n log n) because of sorting upper bound
 Space Complexity : O(n)
 
 Improvement thoughts :
 */


func findRelativeRanksHash(_ nums: [Int]) -> [String] {
    let sortedNums = nums.sorted { (a, b) -> Bool in
        return a > b
    }
    var dict = [Int : String]()
    var ranks = [String]()
    
    for (index,num) in sortedNums.enumerated(){
        switch index {
        case 0:
            dict[num] = "Gold Medal"
        case 1:
            dict[num] = "Silver Medal"
        case 2:
            dict[num] = "Bronze Medal"

        default:
            dict[num] = String(index+1)
        }
    }
    print(dict)
    for num in nums{
        ranks.append(dict[num]!)
    }
    return ranks
}
let case1 = [5, 4, 3, 2, 1]
let case2 = [10,3,8,9,4]
let case3 = [2,1]
findRelativeRanksHash(case2)

