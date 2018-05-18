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

/*
 541. Reverse String II
 https://leetcode.com/problems/reverse-string-ii/description/
 Given a string and an integer k, you need to reverse the first k characters for every 2k characters counting from the start of the string. If there are less than k characters left, reverse all of them. If there are less than 2k but greater than or equal to k characters, then reverse the first k characters and left the other as original.
 Example:
 Input: s = "abcdefg", k = 2
 Output: "bacdfeg"
 Restrictions:
 The string consists of lower English letters only.
 Length of the given string and k will in the range [1, 10000]
 */

func reverseK(str : String, k : Int) -> String{
    let count = str.count
    switch k {
    case _ where k*2 < count:
        print("k less than count")
    case _ where k < count:
        print("k less than count")
    default:
        break
    }
    
    
    return ""
}

reverseK(str: "hello", k: 2)

