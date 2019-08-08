import UIKit

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
