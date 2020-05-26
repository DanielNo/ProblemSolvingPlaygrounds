import UIKit

/*
 905. Sort Array By Parity
 Given an array A of non-negative integers, return an array consisting of all the even elements of A, followed by all the odd elements of A.

 You may return any answer array that satisfies this condition.

Approach 1(trivial): Filter array for odd and even, and combine into new array. Not very efficient but very simple to implement.
 
 Approach 2: In place swap. Took a few submissions for edge cases using while loop. After cheating, learned the question is solvable with a for loop. TODO : attempt with a for loop
 
 */

func sortArrayByParity(_ A: [Int]) -> [Int] {
    var nums = A
    var i = 0
    var j = nums.count-1
    while i < j{
        if nums[i]%2 == 0 {
            i+=1
        }else if(nums[j]%2 == 0){
            let temp = nums[i]
            nums[i] = nums[j]
            nums[j] = temp
            j-=1
            i+=1
        }else{
            j-=1
        }
    }
    return nums
}
sortArrayByParity([3,1,2,4,6,9,4,2,1,0,7])
//sortArrayByParity([1,3])

/*
 961. N-Repeated Element in Size 2N Array
 In a array A of size 2N, there are N+1 unique elements, and exactly one of these elements is repeated N times.
 Return the element repeated N times.

 Example 1:
 Input: [1,2,3,3]
 Output: 3
 
 Approach : Use a set. Because there are N+1 unique elements, this means all are unique minus the element that is repeated. Use a set to find the duplicate. Ex : 2N array where n = 2, array count = 4 and unique elements = 3 where 1 of the three elements is repeated twice (n times)
 Time : O(n)
 Space : O(n)

 */
func repeatedNTimes(_ A: [Int]) -> Int {
    var set : Set<Int> = Set()
    for (i,num) in A.enumerated(){
        if set.contains(num){
            return num
        }else{
            set.insert(num)
        }
    }
    return 0
}


/*
 977. Squares of a Sorted Array
 Look at this problem again..
 
 */

func sortedSquares(_ A: [Int]) -> [Int] {
    // put in thought process in repo, cheated
    var arr = Array(repeating:0, count:A.count)
    var head = 0
    var tail = A.count-1
    var pos = A.count-1
    
    while (pos >= 0){
        if (abs(A[head]) >= abs(A[tail])){
            arr[pos] = A[head] * A[head]
            head+=1
        }else{
            arr[pos] = A[tail] * A[tail]
            tail-=1
        }
        pos-=1
    }
    
    return arr
}
