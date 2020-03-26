import UIKit

/*
 1351. Count Negative Numbers in a Sorted Matrix

 Approach 1: Linear scan on all elements of arrays
 
 Approach 2: Binary search on each array. Why is this slower on leetcode than linear scan?
 
 Approach 3: Scan each array from right side until you hit a positive number.
 */

func countNegatives(_ grid: [[Int]]) -> Int {
    var count = 0
    
    var arrCount = grid.count
    var eleCount = grid[0].count ?? 0
    
    for i in 0..<arrCount{
        
        for j in (0..<eleCount).reversed(){
            if grid[i][j] < 0{
                count+=1
                print(grid[i][j])
            }else{
                break
            }
        }
        
    }
    
    
    return count

}
countNegatives([[4,3,2,-1],[3,2,1,-1],[1,1,-1,-2],[-1,-1,-2,-3]])

func countNegativesBinarySearch(_ grid: [[Int]]) -> Int {
    var count = 0
    for (index,arr) in grid.enumerated(){
        count += binarySearch(arr)
    }
    
    return count
}

func binarySearch(_ arr : [Int]) -> Int{
    let count = arr.count
    if count == 1{
        let num = arr[0]
        return num >= 0 ? 1 : 0
    }
    let mid = count/2
    let first = Array(arr[0..<mid])
    let second = Array(arr[mid...count-1])
    if arr[mid-1] >= 0{
        return binarySearch(second)
    }else if (arr[count-1] >= 0){
        return 0
    }else{
        return binarySearch(first) + binarySearch(second)
    }
    
}

//countNegatives([[3,2],[1,0]])
//countNegatives([[5,1,0],[-5,-5,-5]])
/*
1365. How Many Numbers Are Smaller Than the Current Number
 Given the array nums, for each nums[i] find out how many numbers in the array are smaller than it. That is, for each nums[i] you have to count the number of valid j's such that j != i and nums[j] < nums[i].

 Return the answer in an array.
 Constraints:

 2 <= nums.length <= 500
 0 <= nums[i] <= 100

 
 Approach 1: Sort the array and traverse once
 Edge cases : duplicate numbers
 
 Time : O(n log n ) because of sorting
 Space : O(n)
 
 
 Approach 2: Use an dictionary to store counts
 
 Time : O(n)
 Space : O(n)
 
 Approach 3: Using the constraints, create an array with a range to store counts
 
 */


func smallerNumbersThanCurrent(_ nums: [Int]) -> [Int] {
    var ans = nums
    var counts = Array(repeating: 0, count: 101)
    // get the occurences of numbers
    for (index,num) in nums.enumerated(){
        counts[num]+=1
    }
    print(counts)
    
    // add up value with previous index
    for (index,num) in counts.enumerated(){
        if index == 0{
            
        }else{
            counts[index]+=counts[index-1]
        }
    }
    print(counts)

    for (index,element) in ans.enumerated() {
        if index == 0{
            counts[index] = 0
        }else{
            ans[index] = ans[element-1]
        }
    }
    print(counts)
    return ans
}
smallerNumbersThanCurrent([8,1,2,2,3])
//smallerNumbersThanCurrent([1,4,1,2,7,5,2])

/*
1389. Create Target Array in the Given Order
 Given two arrays of integers nums and index. Your task is to create target array under the following rules:

 Initially target array is empty.
 From left to right read nums[i] and index[i], insert at index index[i] the value nums[i] in target array.
 Repeat the previous step until there are no elements to read in nums and index.
 Return the target array.

 It is guaranteed that the insertion operations will be valid.

 Constraints:

 1 <= nums.length, index.length <= 100
 nums.length == index.length
 0 <= nums[i] <= 100
 0 <= index[i] <= i

 Initial thoughts : Maybe use a linked list? Or the problem is super simple and use Array insertion.
 Approach 1 : Made a mistake trying to create an array of size nums.length with -1, reassigning values in array and using filter. Insertion operations fail. The question turned out to be very simple and tried again using swift array insertion.

 Approach 2: Use array insertion on empty array. Swift insertion takes care of increasing the size of the array, inserting before an index that exists, or appending at the end of the array

 Time : O(n)
 Space : O(n)
*/

func createTargetArray(_ nums: [Int], _ index: [Int]) -> [Int] {
    var ans : [Int] = Array()
    
    for (i,num) in nums.enumerated(){
        let ind = index[i]
        ans.insert(num, at: ind)
    }

    return ans
}
