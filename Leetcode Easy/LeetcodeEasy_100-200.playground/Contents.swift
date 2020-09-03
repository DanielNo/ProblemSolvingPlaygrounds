//: Playground - noun: a place where people can play

import UIKit

/*
107. Binary Tree Level Order Traversal II

Approach (mine) : Count levels of tree and create empty 2d array. Recursively insert elements into the 2d array based on level.
Approach (took a hint from answers and was able to solve):
Insert elements into output array while traversing through tree in level order and reverse output.

*/

func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
    var ans : [[Int]] = Array()
    traverseBottom(root,level:1,arr : &ans)
    return ans.reversed()
}

func traverseBottom(_ root: TreeNode?, level : Int, arr : inout [[Int]]) -> Void{
    guard let r = root else{
        return
    }
    let count = arr.count
    if count < level{
        arr.append([])
    }
    arr[level-1].append(r.val)
    
    
    if r.left != nil && r.right != nil{
        traverseBottom(r.left, level: level+1, arr : &arr)
        traverseBottom(r.right, level: level+1, arr : &arr)
    }
    if r.left == nil && r.right != nil{
        traverseBottom(r.right, level: level+1, arr : &arr)
    }
    if r.left != nil && r.right == nil{
        traverseBottom(r.left, level: level+1, arr : &arr)
    }
}

/*
112. Path Sum
Approach : Level order traversal(BFS) using parameters to pass data to recursive calls.
Keep track of the current sum in the path by using the currentSum parameter. When a node has no more children, the path is complete and we check for sum equality.

Time : O(n), each node will be visited once.
Space : O(n) if the tree is completely unbalanced
O(log n) if the tree is completely balanced.

Note: Did not know the correct time and space complexity, review binary tree/recursive time complexity again in future.

*/

func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
        if root == nil{
            return false
        }
        return checkSum(root,sum,0)
    }
    
    func checkSum(_ root: TreeNode?, _ sum: Int,_ currentSum: Int) -> Bool{
        guard let r = root else{
            return currentSum == sum
        }
        let newSum = currentSum + r.val
        if r.left == nil && r.right == nil{
            return newSum == sum
        }else if(r.left == nil && r.right != nil){
            return checkSum(r.right,sum,newSum)
        }else if(r.left != nil && r.right == nil){
            return checkSum(r.left,sum,newSum)
        }else{
            return checkSum(r.left,sum,newSum) || checkSum(r.right,sum,newSum)
        }
    }

/*
 118. Pascal's Triangle
 https://leetcode.com/problems/pascals-triangle/description/
 
 Approach 1(long time ago) : First create a 2d array with the required space beforehand. Initialize all values to 1. Use pattern matching and nested statements to overwrite existing values.
 
 Time complexity : Linear O(n)
 Space complexity : Linear O(n)

 */

func generate(numRows : Int) -> [[Int]]{
    var triangle : [[Int]] = []
    triangle.reserveCapacity(numRows)
    
    for num in 0..<numRows{
        let row = Array(repeating: 1, count: num+1)
        triangle.append(row)
    }
    
    if numRows > 2 {
        for (index,row) in triangle.enumerated(){
            switch index {
            case _ where index < 2:
                break
            default:
                for rowVal in 0...index{
                    switch rowVal {
                    case _ where rowVal == 0 || rowVal == index:
                        continue
                    default:
                        triangle[index][rowVal] = triangle[index-1][rowVal-1] + triangle[index-1][rowVal]
                    }
                }
                break
            }
        }
    }
    print(triangle)

    return triangle
}

// Recent submission
func generate2(_ numRows: Int) -> [[Int]] {
    var ans : [[Int]] = Array()
    if numRows == 0{
        return ans
    }
    
    var row = 1
    while (row <= numRows){
        // Initialize row of 1's
        var arr = Array(repeating:1, count: row)
        ans.append(arr)
        // If row is not first or second row, calculate values that are not the first and last in row because nothing should be done. Our row is initialized to contain all 1's and we overwrite values that are not edges of the triangle.
        if row != 1 && row != 2{
            for n in 0..<arr.count{
                if n != 0 && n != arr.count-1{
                 ans[row-1][n] = ans[row-2][n] + ans[row-2][n-1]
                }
            }
        }
        row += 1
    }
    return ans
}

//let rows = generate(numRows: 4)

/*
 121. Best time to buy and sell stock
 https://leetcode.com/problems/best-time-to-buy-and-sell-stock/description/

 Naive Approach : Calculate the profit for each value in array individually. Traverse through array and for each value, find the max value in the subarray excluding previous numbers.
 Ex : [1,2,3,4,5]   for number n at index i=0 : find max of [2,3,4,5]
 ans = 0
 ans = n - max[2,3,4,5]
 return ans
 
 Time complexity : O(n^2). Finding the max of the subarray which is O(n) nested within another for loop.
 Space complexity : O(1)
 Note : Fails on edge case where all numbers in a large array where following numbers are all smaller. EX: [1000,999,998...0]
 */
func maxProfitNaive(_ prices: [Int]) -> Int {
    let count = prices.count
    var ans = 0
    switch count {
    case _ where count == 2:
        ans = prices[0] < prices[1] ? prices[1]-prices[0] : 0
    case _ where count < 2:
        break
    default:
        for (index,num) in prices.enumerated() {
            let sellPrices = prices[index+1..<prices.count]
            if sellPrices.count == 0 {
                break
            }
            let max = sellPrices.max()
            let profit = max! - num
            ans = profit > ans ? profit : ans
        }
        break
    }
    return ans
}

maxProfitNaive([7,1,5,3,6,4])

/*
 Approach : Create a lookup table for the max value after an index by reverse enumerating through the prices array. Use previous values(memoization) to add a new max value to the table. Loop through the array again and
 Time Complexity : O(n) linear run time, O(2n) calculations
 Space Complexity : O(n)
*/
func maxProfit(_ prices: [Int]) -> Int {
    let count = prices.count
    var maxDict : [Int : Int] = [:]
    var min = Int.max
    var ans = 0
    for (index,num) in prices.enumerated().reversed(){
        if index == count-1 {
            maxDict[index] = num
            continue
        }
        let prevMax = maxDict[index+1]!
        maxDict[index] = num > prevMax ? num : prevMax
        
    }
    for (index,num) in prices.enumerated(){
        min = num < min ? num : min
        let profit = maxDict[index]! - min
        ans = profit > ans ? profit : ans
    }
    return ans
}
maxProfit([7,1,5,3,6,4])

/*
 136. Single Number
 Approach : Looking for a single number in an array with all others being duplicates.
 Using XOR num xor 0 will return num.
 Using XOR on a different number will add the result.
 Using XOR on a duplicate number will subtract the result.
 Basically using xor on this number set will decide to either add or subtract the given number and will return the single occurence number.
 
 Time Complexity : O(n)
 Space Complexity : O(1)
 
 */
func singleNumber(_ nums: [Int]) -> Int {
    var res = 0
    for num in nums{
        res = res ^ num
        print(res)
    }
    return res
}
let nums = [1,5,6,5,6,3,1]
//let singleNum = singleNumber(nums)

/*
141. Linked List Cycle
Approach : Use a fast and slow iterator, where slow iterates by 1 (.next) and fast iterates by 2 (.next.next)
Compare the pointers for equality to see if there is a cycle(itersections of slow and fast pointer)
 
 Time : O(n)
 Space : O(1)

*/
func hasCycle(_ head: ListNode?) -> Bool {
    var slow = head
    var fast = head?.next
    
    while slow != nil{
        if slow === fast{
            return true
        }
        
        slow = slow?.next
        fast = fast?.next?.next
    }
    return false
 }


/* 167. Two Sum II - Input array is sorted
 Three solutions : Two pointers, nested for loops, hash
 */

func twoSumPointers(_ numbers: [Int], _ target: Int) -> [Int] {
    
    // try this again
    return [0]
}

func twoSumNaive(_ numbers: [Int], _ target: Int) -> [Int] {
    let count = numbers.count
    var ans = [Int]()
    for i in 0..<count{
        for j in i+1..<count{
            if numbers[i] + numbers[j] == target {
                ans = [i+1,j+1]
                break
            }
        }
    }
    return ans
}


/* 198. House Robber : https://leetcode.com/problems/house-robber/description/

 
 */

func rob(_ nums: [Int]) -> Int {
    var oddHouses : [Int] = []
    var evenHouses : [Int] = []
    for (index,num) in nums.enumerated(){
        let even = (index % 2 == 0)
        if even{
            evenHouses.append(num)
        }else{
            oddHouses.append(num)
        }
        
    }
    let evenSum = evenHouses.reduce(0,+)
    let oddSum = oddHouses.reduce(0,+)

    return evenSum > oddSum ? evenSum : oddSum
}


rob([2,1,1,2])
