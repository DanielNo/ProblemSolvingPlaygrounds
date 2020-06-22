import UIKit

/*
 1315. Sum of Nodes with Even-Valued Grandparent
 
Approach : Use recursion and keep track of a sum variable. In order to solve the problem easier, create a helper function to just calculate the sums. Return the sum in the main function
Note : Slow down and think while trying not to get overwhelmed by first time seeing a grandchildren problem.

Time : O(n) I think this is right because we are recursively calling helper function for each node in the tree.
Space : O(h) where h is the height of the tree and stack frames required for recursive traversal

*/

class Solution {
    var sum = 0
    func sumEvenGrandparent(_ root: TreeNode?) -> Int {
        calcSum(root)
        return sum
    }
    
    func calcSum(_ node : TreeNode?) -> Void{
        guard let r = node else{
            return
        }
        if r.val % 2 == 0{
            sum += r.left?.left?.val ?? 0
            sum += r.left?.right?.val ?? 0
            sum += r.right?.left?.val ?? 0
            sum += r.right?.right?.val ?? 0
        }
        calcSum(r.left)
        calcSum(r.right)
    }
}
