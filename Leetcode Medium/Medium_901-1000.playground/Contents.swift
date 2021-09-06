import UIKit

/*
921. Minimum Add to Make Parentheses Valid
Approach : Use a stack to keep track of unpaired parenthesis.
Pushing items onto stack after checking if the top of the stack is a valid parenthesis of the current character in the string.

Note : There is a more optimal solution found from looking at discussion using no space. That approach uses two variables to count closed and open parenthesis

Time : O(n)
Space : O(n)

*/
func minAddToMakeValid(_ S: String) -> Int {
        var stack : [Character] = []
        for (i,c) in S.enumerated(){
            let last = stack.last
            if last == "(" && c == ")"{
                stack.removeLast()
            }else{
                stack.append(c)
            }
        }
        return stack.count
    }


// 938. Range Sum of BST
//Given the root node of a binary search tree, return the sum of values of all nodes with value between L and R (inclusive).
//The binary search tree is guaranteed to have unique values.

// Initial Approach : Use recursion to traverse the tree. Check the node value to see if it falls within range. Didn't remember types of tree traversals but kinda remembered recursion on binary trees. I ended up using Depth first search - pre order traversal.
// Optimize with a different approach possible? not sure.

// Time complexity : O(n)
// Space complexity : ?
/*
 From stackoverflow
 BFS:
 
 Time complexity is O(|V|) where |V| is the number of nodes,you need to traverse all nodes.
 Space complecity is O(|V|) as well - since at worst case you need to hold all vertices in the queue.
 
 DFS:
 
 Time complexity is again O(|V|), you need to traverse all nodes.
 Space complexity - depends on the implementation, a recursive implementation can have a O(h) space complexity [worst case], where h is the maximal depth of your tree.
 Using an iterative solution with a stack is actually the same as BFS, just using a stack instead of a queue - so you get both O(|V|) time and space complexity.
 
 (*) Note that the space complexity and time complexity is a bit different for a tree then for a general graphs becase you do not need to maintain a visited set for a tree, and |E| = O(|V|), so the |E| factor is actually redundant.
 
*/
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}
class Solution {
    func rangeSumBST(_ root: TreeNode?, _ L: Int, _ R: Int) -> Int {
        guard let node = root else{
            return 0
        }
        if node.val >= L && node.val <= R{
            return rangeSumBST(node.left,L,R) + rangeSumBST(node.right,L,R) + node.val
        }else if(node.val > R){
            return rangeSumBST(node.left,L,R)
        }else{
            return rangeSumBST(node.right,L,R)
        }
    }
}


/*
977. Squares of a Sorted Array

Approach : Find the first positive and negative numbers. To accomplish this, find the first positive number, then subtract the index by 1 to find the first negative number.
Because "two pointers" is suggested as solution. We grab our first negative and positive value's index from the array.
We iterate the negative pointer in reverse, and the positive pointer forward.
Compare absolute values and append squared values to output array. Traverse the remaining pointer and append those squared values.

Note : Was able to reach the concept without looking at coded solution but struggled with off by 1 index and index out of bounds errors while coding.
Also did not code up edge case without looking at solution.
Should solve again without errors next time.

Time : O(n)
Space : O(1)

*/
    
func sortedSquares(_ A: [Int]) -> [Int] {
        let count = A.count
        if count == 1{
            return [A[0]*A[0]]
        }else if count == 0{
            return []
        }
        var i = 0
        var j = 0
        var ans : [Int] = Array()
        while A[i] < 0{
            i+=1
        }
        j = i-1
        
        while j >= 0 && i < count{
           print("i : \(i), j : \(j)")
            if abs(A[j]) > abs(A[i]){
                ans.append(A[i]*A[i])
                i+=1
            }else if(abs(A[j]) < abs(A[i])){
                ans.append(A[j]*A[j])
                j-=1
            }else{
                ans.append(A[j]*A[j])
                ans.append(A[i]*A[i])
                j-=1
                i+=1
            }
        }
        
        while j >= 0{
            ans.append(A[j]*A[j])
            j-=1
        }
        while i < count{
            ans.append(A[i]*A[i])
            i+=1
        }


        return ans
    }
