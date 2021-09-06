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
515. Find Largest Value in Each Tree Row

Approach : Create a dictionary to store the largest value for each row. Use the row as the dictionary key, the values will be the largest value for each row.

Time : O(n log n ) due to sorting the dictionary
Space : O(n)

Note : Can optimize by using an array to store the largest values

*/
var dict : [Int:Int] = [:]
    func largestValues(_ root: TreeNode?) -> [Int] {
        traverse(0,root)
        let sorted = dict.sorted{$0.key < $1.key}.map{$0.value}
        return sorted
    }
     
    func traverse(_ rowLevel : Int,_ node: TreeNode?) -> Void{
        guard let r = node else{
            return
        }
         
        if let value = dict[rowLevel]{
            dict[rowLevel] = max(value,r.val)
        }else{
            dict[rowLevel] = r.val
        }
         
        traverse(rowLevel + 1, r.left)
        traverse(rowLevel + 1, r.right)
         
         
    }

/*
Approach with Array
Note : Was very easy to change from dictionary to array implementation.
*/
var arr : [Int] = []
    func largestValues(_ root: TreeNode?) -> [Int] {
        traverse(0,root)
        return arr
    }
     
    func traverse(_ rowLevel : Int,_ node: TreeNode?) -> Void{
        guard let r = node else{
            return
        }
        if arr.count > rowLevel{
            arr[rowLevel] = max(arr[rowLevel],r.val)
        }else{
            arr.append(r.val)
        }
         
        traverse(rowLevel + 1, r.left)
        traverse(rowLevel + 1, r.right)
    }

/* 520. Detect Capital
 
 Approach : Think about the cases that validate the string. The input to be true, must be all capitals, first capital, or all lower cased.
 Time Complexity : O(n), returning a string as uppercased or lowercased should be linear operation and serves as upper bound of the function.
 Space Complexity : O(4n) = O(n)
 
 Improvement : reduce space complexity
 */

func detectCapitalUse(_ word: String) -> Bool {
    let count = word.count
    if count <= 1{
        return true
    }
    var uppercased = word.uppercased()
    var lowercased = word.lowercased()
    if word == uppercased || word == lowercased {
        return true
    }
    var letters = Array(word)
    var isCapital = String(letters[0]).uppercased() == String(letters[0])
    let remainder = word.dropFirst()
    
    if isCapital {
        if remainder == uppercased.dropFirst() || remainder == lowercased.dropFirst(){
            return true
        }else{
            return false
        }
    }
    
    return remainder == remainder.lowercased()
}

detectCapitalUse("UsA")


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

/*
 559. Maximum Depth of N-ary Tree
 
 Approach : To find the levels of a tree, we have to keep track of the current level of the root. This is doable by passing as a parameter and incrementing by one and using recursion.
 Note : Try solve again using technique used in solutions section. Apparently can use a queue.
 Can also solve without a helper function
 
 */

class Solution {
    var max = 0
    func maxDepth(_ root: Node?) -> Int {
        calcDepth(root,depth:1)
        
        return max
    }
    
    func calcDepth(_ root: Node?, depth : Int) -> Void{
        guard let r = root else{
            return
        }
        
        if r.children.count == 0{
            max = max(depth,max)
        }else{
            for child in r.children{
                calcDepth(child,depth:depth+1)
            }
            
            
        }
        
    }
}

/*
 599. Minimum Index Sum of Two Lists
 
 Approach : Iterate through first list and keep track of restaurant(string) values as key, with index as the value.
 
 Iterate through the second list to find keys that exist in list1 and 2.
 Calculate the minimum index sum with a variable. If there is a collision in index sums, just append the duplicate to the answer (string array)
 
 Time : O(n)
 Space : O(n)
 
 */

func findRestaurant(_ list1: [String], _ list2: [String]) -> [String] {
    var dict : [String : Int] = Dictionary()
    
    for (index,str) in list1.enumerated(){
        dict[str] = index
    }
    var least = Int.max
    var ans : [String] = Array()
    for (index,str) in list2.enumerated(){
        guard let i = dict[str] else{
            continue
        }
        if i + index < least{
            least = i + index
            ans = [str]
        }else if(i + index == least){
            ans.append(str)
        }
    }
    
    return ans
}
