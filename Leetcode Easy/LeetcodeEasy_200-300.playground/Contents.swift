import UIKit

/*
 203. Remove Linked List Elements
 
 Approach : Trim the front values that equal to the target value to remove.
 After removing values at the front of the linked list that match the value, we know the head's value does not equal the target.
 From here we can assign the trimmed head as a current node iterator. With this current node iterator, we can check the next value for matches to the target.
 If the next value matches, we assign current's next value as its second next value. This will lose the reference to the matching next value, and will reassign next to the second next
 
 Ex: target = 2
 1-> 2 -> 3
 Becomes 1 -> 3
 
 Ex: Trim the front test case
 target = 2
 
 2-> 2-> 3 -> 2 -> 4
 Trim front step : head and curr points to : 3 -> 2 -> 4
 Trim remainder step:
 head points to initial node still
 curr points to 3 -> 4. Curr ultimately points to 4
 
 Time : O(n)
 Space : O(1)
 
 */

func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
    var h = head
    var trimFront = false
    
    while trimFront == false{
        if let v = h?.val, v == val{
            h = h?.next
        }else{
            trimFront = true
        }
    }
    
    var cur = h
    
    while cur?.next != nil{
        if let target = cur?.next?.val{
            if target == val{
                cur?.next = cur?.next?.next
            }else{
                cur = cur?.next
            }
        }
    }
    
    return h
}


/* 204. Count Primes : https://leetcode.com/problems/count-primes/description/
 Count the number of prime numbers less than a non-negative number, n.
 Approach : Use sieve of eranthoses algorithm to mark off composite numbers in an array until the remaining numbers in array are prime.
 */
func countPrimes(_ n: Int) -> Int {
    if n <= 2{
        return 0
    }
    var arr = Array(repeating: true, count: n)
    arr[0] = false
    arr[1] = false
    arr[2] = true
    var test = 1
    var limit = Int(Double(n).squareRoot())
    while test <= limit{
        // find next prime and mark off all
        let prime = findNextPrime(arr, primeIndex:test)
        //        print("prime found at index: \(prime), test : \(test)")
        markBoolean(array: &arr, num: prime)
        if prime > test {
            test = prime + 1
        }else{
            test += 1
        }
    }
    var count = 0
    //    var primes = [Int]()
    for (index,val) in arr.enumerated(){
        if val == true {
            count += 1
            //            primes.append(index)
        }
    }
    //    print(primes)
    //    print(arr)
    return count
}

// Get next prime number index in array
func findNextPrime(_ nums : [Bool], primeIndex : Int) -> Int{
    var pIndex = primeIndex
    for index in primeIndex...nums.count{
        if(nums[index] == true){
            pIndex = index
            break
        }
    }
    return pIndex
}

// Mark all values that are factors of num as a boolean value
func markBoolean( array : inout [Bool], num : Int) -> [Bool]{
    var count = num + num
    //    print("marking \(num)")
    while (count < array.count){
        array[count] = false
        count += num
    }
    return array
}

/*
 206. Reverse Linked List
 
 (Resolved after 2 years)
 Approach : Keep a temporary pointer to next, and use a head and tail pointer. Tail pointer is initialized to nil, which we copied from our previous approach.
 Update the two pointers inside the while loop and reassign the temporary next variable.
 
 */


func reverseList(_ head: ListNode?) -> ListNode? {
    var h = head
    var tail : ListNode? = nil
    
    while h != nil{
        let next = h?.next
        h?.next = tail
        tail = h
        h = next
    }
    
    return tail
}

/*
243. Shortest Word Distance

Approach : Store all indexes of word 1 and word 2 in seperate arrays. Iterate through both arrays and calculate the word distance. Store the minimum word distance and return it.

Time : Roughly O(n), there is a nested for loop but it will never reach O(n)^2.
Space : O(n)
Note : Can be solved with no index arrays.
*/
 func shortestDistance(_ wordsDict: [String], _ word1: String, _ word2: String) -> Int {
        var wordOneIndexes : [Int] = []
        var wordTwoIndexes : [Int] = []
         
        for(i,word) in wordsDict.enumerated(){
            if word == word1{
                wordOneIndexes.append(i)
            }else if word == word2{
                wordTwoIndexes.append(i)
            }
        }
        var minimum = Int.max
        for index in wordOneIndexes{
            for index2 in wordTwoIndexes{
                minimum = min(abs(index-index2),minimum)
            }
        }
         
        return minimum
    }

/*
252. Meeting Rooms

Approach: Using the question's specified boundaries: An interval is stated to be in range (0...100000)
We create an array to store units of time booked already. We initialize it as an array of 100000 with values of false.
For each interval we rewrite values in this time booked array to true. If an interval we are iterating, finds a booked value(true), we know we cannot attend all meetings because there is a time overlap.

Time : O(n) * 1000, not sure
Space : O(100000), constant space?

*/

func canAttendMeetings(_ intervals: [[Int]]) -> Bool {
    var arr : [Bool] = Array(repeating: false, count: 100000)
        for (i,interval) in intervals.enumerated(){
            let low = interval[0]
            let high = interval[1]
             
            for time in low..<high{
                if time >= 100000{
                    break
                }
                if arr[time] == false{
                    arr[time] = true
                }else{
                    return false
                }
            }
        }
         
        return true
    }

/*
Note: Solved using the approach shown in discussion and solutions tabs, which is to use sorting
Approach : Sort the ranges by their start times. This enables us to compare the tail and head of neighboring intervals for an overlap.

Time : O(n log n)
Space : O(1)
*/

    func canAttendMeetingsBySorting(_ intervals: [[Int]]) -> Bool {
        if intervals.count <= 1{
            return true
        }
        var sortedIntervals = intervals.sorted(by:{
            return $0[0] < $1[0]
        })
         
        for i in 0..<sortedIntervals.count-1{
            let first = sortedIntervals[i]
            let second = sortedIntervals[i+1]
            if first[1] <= second[0]{
                continue
            }else{
                return false
            }
        }
        return true
    }

/*
 257. Binary Tree Paths
 Approach : Recursively traverse through binary tree using a helper method. Pass in the current path at each node. When reaching a node without any leaves, append to answer.
 
 Note: Can solve iteratively using a stack
 
 Time: O(n)
 Space: not sure, but will require stack space for recursion
 
 */
func binaryTreePaths(_ root: TreeNode?) -> [String] {
    var paths : [String] = []
    guard let r = root else{
        return paths
    }
    traverse(r,"\(r.val)", &paths)
    return paths
}

func traverse(_ node: TreeNode?,_ curr : String,_ paths : inout [String]){
    guard let n = node else{
        return
    }
    if n.left != nil && n.right != nil{
        traverse(n.left,"\(curr)->\(n.left!.val)",&paths)
        traverse(n.right,"\(curr)->\(n.right!.val)",&paths)
    }else if (n.left != nil){
        traverse(n.left,"\(curr)->\(n.left!.val)",&paths)
    }else if (n.right != nil){
        traverse(n.right,"\(curr)->\(n.right!.val)",&paths)
    }else{
        paths.append(curr)
    }
}

/*
 266. Palindrome Permutation
 
 Approach : A palindrome permutation means the letter counts of the string validate as a palindrome.
 The validation rules are : The remaining odd value counts should be less than or equal to 1
 Ex: aabbeee
 [a:2,b:2,e:3] the a and b even counts are removed and we check the odd count letters. Cannot have more than 1 odd value.
 
 To solve we use fancy reduce into function that does the same as manually counting in a for loop. We filter the value array of the dictionary and check if the count of that result is <= 1.
 
 Note : The edge case here is an odd letter sequence such as "eee" or "e"
 This means only one letter with odd counts may exist.
 
 Time : O(n)
 Space : O(n)
 
 
 */
func canPermutePalindrome(_ s: String) -> Bool {
    let dict = s.reduce(into:[:]){(counts,letter) in
            counts[letter, default: 0] += 1
    }
    let remainder = dict.values.filter{
        return $0 % 2 == 1
    }
    return remainder.count <= 1
}

/* 268. Missing Number
 Approach : To get the answer in linear time and without extra space, get the sum of the values in the input array.
 Then take the sum of 1...n and return the difference of the two to find the missing number.
 
 Time Complexity : O(n)
 Space Complexity : O(1)
 
 */

func missingNumber(_ nums: [Int]) -> Int {
    let total = nums.reduce(0, +)
    let count = nums.count
    var sum = 0
    for num in 1...count{
        sum += num
    }
    return sum - total
}


/*
 283. Move Zeroes
 
 */



var input1 = [0, 1, 0, 3, 12]
var input2 = [1,0,3,12,0]
var input3 = [0,0,1]
var input4 = [1,0,0,5,0,7,0]
var input5 = [10,0,0,0,99,99,100,0,202]

/*
 
 Review this again
 */

func moveZeroes(_ nums: inout [Int]) {
    print("input : \(nums)")
    let count = nums.count
    var nIndex = 0
    for i in 0..<count{
        if nums[i] != 0{
            let temp = nums[nIndex]
            nums[nIndex] = nums[i]
            nums[i] = temp
            nIndex+=1
        }
        print(nums)
        
    }
    
}

/*
 
 Naive solution : Scan the array each time for the first 0 and nonzero value. Swap them and repeat.
 
 Time Complexity : O(n^2)
 Space Complexity : O(1) no extra space used
 */


func moveZeroesNaive(_ nums: inout [Int]) {
    var zIndex = -1
    var nIndex = -1
    let count = nums.count
    for i in 0..<count{
        if nums[i] != 0 {
            continue
        }
        for j in i..<count{
            if nums[j] == 0 && zIndex == -1 {
                zIndex = j
            }
            if nums[j] != 0 && nIndex == -1 {
                nIndex = j
            }
        }
        if nIndex != -1 && zIndex != -1 {
            let temp = nums[nIndex]
            nums[nIndex] = nums[zIndex]
            nums[zIndex] = temp
            nIndex = -1
            zIndex = -1
        }
    }
}

/*
 Solution found on leetcode
 */
func moveZeroes2(_ nums: inout [Int]) {
    print("input : \(nums)")
    var insertPos = 0
    for num in nums{
        if num != 0 {
            nums[insertPos] = num
            insertPos += 1
            print(nums)
            
        }
    }
    print(insertPos)
    
    while insertPos < nums.count {
        nums[insertPos] = 0
        insertPos += 1
    }
    
    
}


moveZeroes(&input5)
//moveZeroes(&input1)
