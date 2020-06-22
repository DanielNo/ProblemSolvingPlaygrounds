import UIKit

/*
 1304. Find N Unique Integers Sum up to Zero

 Approach: Append a number and its negative value for even input. For odd input, do the same with the difference of appending a zero for the last index. Could possibly optimize a bit further but I was able to find a solution without cheating.
 
 Time : O(n)
 Space : O(n) needed for the answer array.
 */
 
func sumZero(_ n: Int) -> [Int] {
    var ans : [Int] = Array(repeating: 0, count: n)
    var count = n
    for num in 0..<n{
        if num == n-1{
            if num % 2 == 0 {
                ans[num] = 0
            }else{
                ans[num] = count * -1
            }
            
        }else{
            if num % 2 == 0{
                ans[num] = count
            }else{
                ans[num] = count * -1
                count -= 1
            }
        }
    }
    return ans
}


sumZero(3)
sumZero(9)

/*
 1323. Maximum 69 Number

 Approach 1: Convert number to character array, then int array. Find the first and leftmost 6
 
 Approach 2: Do math on the input number, finding the leftmost 6 and changing to a 9. Tried to find a loop algorithm that would work using exponents but the pow function returns a "Decimal" type number instead of Int.
 Had to cheat here but the solution was extremely simple. Should have thought of it on my own due to the very small constraints.
 
 */
func maximum69Number (_ num: Int) -> Int {
    if num/1000 == 6{
        return num + 3000
    }else if (num/100 % 10 == 6){
        return num + 300
    }else if(num/10 % 10 == 6){
        return num + 30
    }else if(num % 10 == 6){
        return num + 3
    }else{
        return num
    }
}

maximum69Number(6969)
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
 
Apparently I solved this problem again...
 
 Approach (after cheating): Create an array of 0 to max number as stated in problem limitations.
 Store the counts of the numbers in arr[number]. Ex arr[1] stores occurrences of 1, arr[8] stores occurrences of 8
 Loop through the counts array, keep track of a running sum and overwrite values in the counts array with the running sum.
 Create an array sized to input array to overwrite values.
 In the answer array, overwrite values by looking up the number in the running sum/occurences array.
 Ex: [8,1,2,2,3]
 Look up occurrences array of 8 to find running sum of 8
 */


func smallerNumbersThanCurrent(_ nums: [Int]) -> [Int] {
    var ans = nums
    var counts = Array(repeating: 0, count: 101)
    // get the occurences of numbers
    for (index,num) in nums.enumerated(){
        counts[num]+=1
    }
    
    // add up value with previous index
    for (index,num) in counts.enumerated(){
        if index == 0{
            
        }else{
            counts[index]+=counts[index-1]
        }
    }

    for (index,element) in ans.enumerated() {
        if index == 0{
            counts[index] = 0
        }else{
            ans[index] = ans[element-1]
        }
    }
    return ans
}

func smallerNumbersThanCurrent3(_ nums: [Int]) -> [Int] {
        var arr = Array(repeating: 0, count : 101)
        for (i,num) in nums.enumerated(){
            arr[num] = arr[num] + 1
        }
        
        var sum = 0
        let count = nums.count
        var ans = Array(repeating: 0, count: count)
        
        for (i,num) in arr.enumerated(){
            if num != 0{
            arr[i] = sum
            sum += num
            }
            
        }
        
        for (i,num) in nums.enumerated(){
            ans[i] = arr[num]
        }
        
        return ans
    }

smallerNumbersThanCurrent([8,1,2,2,3])
//smallerNumbersThanCurrent([1,4,1,2,7,5,2])

/*
1374. Generate a String With Characters That Have Odd Counts
 
 Given an integer n, return a string with n characters such that each character in such string occurs an odd number of times.
 The returned string must contain only lowercase English letters. If there are multiples valid strings, return any of them.
 Input: n = 4
 Output: "pppz"
 Explanation: "pppz" is a valid string since the character 'p' occurs three times and the character 'z' occurs once. Note that there are many other valid strings such as "ohhh" and "love".

 Approach : Find if the number is even or odd. Create a string based on even or odd.
 Result : Accepted without cheating. Leetcode solutions look similiar to my answer.
 
*/

func generateTheString(_ n: Int) -> String {
    if n == 1{
        return "a"
    }
    let isEven = n%2 == 0 ? true : false
    
    if isEven{
        let first = n - 1
        var str = String(Array(repeating: "a", count: first))
        str.append("b")
        return str
    }else{
        let first = n - 2
        var str = String(Array(repeating: "a", count: first))
        str.append("bc")
        return str
    }
}


/*
 1380. Lucky Numbers in a Matrix
 Given a m * n matrix of distinct numbers, return all lucky numbers in the matrix in any order.

 A lucky number is an element of the matrix such that it is the minimum element in its row and maximum in its column.
 Constraints:

 m == mat.length
 n == mat[i].length
 1 <= n, m <= 50
 1 <= matrix[i][j] <= 10^5.
 All elements in the matrix are distinct.

 
 Intial approach : Find the minimum element in a row of the matrix. For that minimum element's index, do a scan to see if its the minimum.
 
 Optimized approach : Mark the elements in a row as -1 if it is not the minimum elements. Do a second pass on the matrix and look for values that are not -1. For each of those values, scan the columns to see if it is the greatest elements and append to answer array. This should be an O(n) solution with no additional space, two linear scans through the arrays
 */

func luckyNumbers (_ matrix: [[Int]]) -> [Int] {
    var nums = matrix
    var ans : [Int] = Array()
    for (i,row) in nums.enumerated(){
        var min = Int.max
        var minIndex = 0
        for (j,num) in row.enumerated(){
            if num < min{
                min = num
                minIndex = j
            }else{
                nums[i][j] = -1
            }
        }
    }
    let height = nums.count
    let width = nums.first?.count ?? 0
    for x in 0..<width-1{
        
        for y in 0..<height-1{
            let next = x+1
            print("\(nums[x][y]) > \(nums[next][y])")

            if nums[x][y] > nums[next][y]{
                nums[x][next] = -1
            }else{
                nums[x][y] = -1
            }
        }
    }
    
    for (_,row) in nums.enumerated(){
        for (_,num) in row.enumerated(){
            if num != -1{
                ans.append(num)
            }
        }
    }
    
    print(nums)
    return ans
}

//luckyNumbers([[3,7,8],[9,11,13],[15,16,17]])
//luckyNumbers([[1,10,4,2],[9,3,8,7],[15,16,17,12]])

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
