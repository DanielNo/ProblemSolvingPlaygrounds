import UIKit

/*
 1207. Unique Number of Occurrences
 Given an array of integers arr, write a function that returns true if and only if the number of occurrences of each value in the array is unique.

 Input: arr = [1,2,2,1,1,3]
 Output: true
 Explanation: The value 1 has 3 occurrences, 2 has 2 and 3 has 1. No two values have the same number of occurrences.

 Approach : Store occurences in a dictionary. Insert the occurences in a set to figure out if occurence is unique or not. Fairly simple, breezed past coding this. Be careful for optional dictionary values when coding without autocomplete and precompile warnings.
 Time : O(n)
 Space : O(n)
 
 */

func uniqueOccurrences(_ arr: [Int]) -> Bool {
    var dict : [Int:Int] = Dictionary()
    var occ : Set<Int> = Set()
    for num in arr{
        if let val = dict[num]{
            dict[num]=val+1
        }else{
            dict[num] = 1
        }
    }
    
    for val in dict.values{
        if occ.contains(val){
            return false
        }else{
            occ.insert(val)
        }
    }
    return true
}
/*
1213. Intersection of Three Sorted Arrays

Approach : Create a set for intersection of arr1 and arr2. Create a set for the intersection of arr 3 and the union of arr1 & arr2 to find the intersection of all arrays.
When the union set and the final array contain a match, add the value to the output array.

Note : Can be solved more optimally using three pointers. Try solving again using that approach


Time: O(n log n) worst case scenario we have to sort an array that contains a union of every single element in the input arrays.
Space: O(n)

*/
func arraysIntersection(_ arr1: [Int], _ arr2: [Int], _ arr3: [Int]) -> [Int] {
        var union : Set<Int> = Set(arr1)
        var union2 : Set<Int> = Set()
        var ans : [Int] = []
        for (i,num) in arr2.enumerated(){
            if union.contains(num){
                union2.insert(num)
            }
        }
        for (i,num) in arr3.enumerated(){
            if union2.contains(num){
                ans.append(num)
            }
        }
        return ans.sorted()
    
}

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
 1260. Shift 2D Grid
 
 Approach (no cheating):
 Find number of shifts by using modulo on total, to reduce repetition if k is greater than total number of elements.
 Flatten the 2d grid into a single array and create an index value.
 From the flattened 1d array, take the last k elements and place them into the front.
 Read values from 1d array and rewrite into the 2d array by using index value.
 Initial idea worked... but there is likely an more optimal solution

 */
func shiftGrid(_ grid: [[Int]], _ k: Int) -> [[Int]] {
    var ans = grid
    let n = grid.count
    guard let m = grid.first?.count else{
        return grid
    }
    let total = n * m
    let shifts = k % total
    
    var all = grid.flatMap{
        $0
    }
    
    var head = all[(total-shifts)..<total]
    var tail = all[0..<total-shifts]
    var new = Array(head + tail)
    for(i,r) in grid.enumerated(){
        for(j,c) in r.enumerated(){
            var index = 0
            if i == 0{
                index = i+j
            }else{
                index = (i * m)+(j)
            }
            let val = new[index]
            print(val)
            ans[i][j] = new[index]
        }
    }
    return ans
}
let grid = [[1,2,3],[4,5,6],[7,8,9]]
shiftGrid(grid, 7)


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
1275. Find Winner on a Tic Tac Toe Game
   
    Approach : Generate a board first from the moves input array. Use a modulo operator to determine if the move is a X or O and write the player string(A or B) instead of X and O value
Check for edge case of less than 5 moves, there will be no winner possible with less than 5 total moves.
Create separate functions for validating all rows columns and diagonals in the grid.
If there is a winner, return any value that was validated.
If all validation functions fail, check for moves count less than 9 to determine if the game is pending or a draw.

Time : Not sure, O(n) or O(n*m)
Space : O(n*m), space used for the matrix.
*/

func tictactoe(_ moves: [[Int]]) -> String {
    var board = generateBoard(moves)
    let count = moves.count
    if count < 5{
        return "Pending"
    }
    
    if let rowWinner = validateRows(board){
        return rowWinner
    }
    if let columnWinner = validateColumns(board){
        return columnWinner
    }
    if let diagWinner = validateDiagonals(board){
        return diagWinner
    }
    
    if count < 9{
        return "Pending"
    }else{
        return "Draw"
    }
}

func generateBoard(_ moves : [[Int]]) -> [[String]]{
    var board : [[String]] = [["","",""],["","",""],["","",""]]
    for (i,arr) in moves.enumerated(){
        let move = i % 2 == 0 ? "A" : "B"
        let y = arr[0]
        let x = arr[1]
        board[y][x] = move
    }
    return board
}

func validateRows(_ board : [[String]]) -> String?{
    for (i,row) in board.enumerated(){
        if (row[0] == row[1] && row[1] == row[2] && row[0].count > 0){
            return row[0]
        }
        
    }
    return nil
}

func validateColumns(_ board : [[String]]) -> String?{
    for i in 0...2{
        if board[0][i] == board[1][i] && board[1][i] == board[2][i] && board[0][i].count > 0{
            return board[0][i]
        }
    }
    return nil
}

func validateDiagonals(_ board : [[String]]) -> String?{
    if board[1][1].count > 0{
        if board[0][0] == board[1][1] && board[1][1] == board[2][2]{
            return board[0][0]
        }else if(board[2][0] == board[1][1] && board[1][1] == board[0][2]){
            return board[2][0]
        }

    }
    return nil
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
1290. Convert Binary Number in a Linked List to Integer
 *solved again after a while*

Approach : Do two passes on the linked list. Once to get the length, so we can calculate the first decimal number in base 2, second time to iterate through the linked list and perform math to find the decimal value.

Note : Not sure how the discussion solutions solve this problem without reversing the linked list, or taking the approach I used. Other solutions use bit manipulation and can solve in one pass.

TIme : O(n)
Space : O(1)

*/
func getDecimalValue(_ head: ListNode?) -> Int {
        var sum = 0
        var count = 0
        var dec = 0
        var curr = head
         
        while curr != nil{
            curr = curr?.next
            count+=1
            dec = dec == 0 ? 1 : dec*2
        }
        curr = head
        while count != 0 && curr != nil{
            sum = sum + (curr!.val * dec)
            curr = curr?.next
            count -= 1
            dec /= 2
        }
        return sum
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

/*
 1299. Replace Elements with Greatest Element on Right Side
 Given an array arr, replace every element in that array with the greatest element among the elements to its right, and replace the last element with -1.
 After doing so, return the array.

 Example 1:
 Input: arr = [17,18,5,4,6,1]
 Output: [18,6,6,6,1,-1]
 
 Approach : Iterate through the array in reverse, keeping track of the greatest element. Assign arr[i] to the current greatest element.
 Result: Took a few submissions after running code but was solvable. Should practice doing questions correctly in one submission. TODO: Try solving with a mutable input array. After cheating, this can be accomplished using a temp variable.
 Time : O(n)
 Space : O(n) due to requiring a copy of the array. Leetcode does not support inout on input array...

 */
func replaceElements(_ arr: [Int]) -> [Int] {
    var ans = arr
    let count = arr.count
    if count == 1{
        return [-1]
    }
    var greatest = -1
    for i in (0..<count).reversed(){
        if i == count-1{
            greatest = arr[i]
            ans[i] = -1
        }else{
            ans[i] = greatest
            if arr[i] > greatest{
                greatest = arr[i]
            }
        }
        
    }
    return ans
}

