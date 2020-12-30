import UIKit

/*
1448. Count Good Nodes in Binary Tree(medium)
Approach : Recursively traverse through binary tree while passing the current maximum value in the tree path through parameter in helper function.
Increment global or ivar
Time : O(n)
Space : O(n) stack space
*/
var goodNodes = 1
func goodNodes(_ root: TreeNode?) -> Int {
    guard let r = root else{
        return 0
    }
    traverse(r.left, i : r.val)
    traverse(r.right, i : r.val)
    return goodNodes
}

func traverse(_ root: TreeNode?, i : Int){
    guard let r = root else{
        return
    }
    if r.val >= i{
        goodNodes+=1
        traverse(r.left, i : r.val)
        traverse(r.right, i : r.val)
    }else{
        traverse(r.left, i : i)
        traverse(r.right, i : i)
    }
    
}
/*
1456. Maximum Number of Vowels in a Substring of Given Length

 Approach : Create a sliding window of size k while keeping count of vowels in the window. Slide the window by 1 for both pointers and increment and decrement vowel counts.
 
 Time : O(n)
 Space : O(1), character array counts as O(n) though
 
*/

func maxVowels(_ s: String, _ k: Int) -> Int {
    var ans = Int.min
    var arr = Array(s)
    var j = 0
    var vowels = 0
    for (i,c) in arr.enumerated(){
        if isVowel(c){
            vowels+=1
        }
    
        if (i-j+1 == k){
            ans = max(ans,vowels)
            if isVowel(arr[j]){
                vowels-=1
            }
            j+=1
        }
    }
    return ans
}

func isVowel(_ char:Character)->Bool{
    if (char == "a" || char == "e" || char == "i" || char == "o" || char == "u"){
        return true
    }else{
        return false
    }
}

/*
 1493. Longest Subarray of 1's After Deleting One Element

 Approach : Use a sliding window with two pointers to create a window with no more than 1 zero.
 Increase window size in outer loop. Shrink the window when zeros is greater than 1 (window is no longer valid).
 
 Note : Seems like a standard two pointers question with the same template as the others.
 
 Time : O(n)
 Space : O(1)
 
 
 */

func longestSubarray(_ nums: [Int]) -> Int {
    var zeros = 0
    var ans = 0
    var j = 0
    for (i,num) in nums.enumerated(){
        if num == 0{
            zeros+=1
        }
        while(zeros > 1 && j < i){
            if nums[j] == 0{
                zeros-=1
            }
            j+=1
        }
        ans = max(ans,i-j)
    }
    return ans
}
