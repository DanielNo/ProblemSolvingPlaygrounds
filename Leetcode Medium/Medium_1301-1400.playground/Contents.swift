import UIKit
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}


/*
 1302. Deepest Leaves Sum
 
 Approach : Copy pasted the answer from :
 637. Average of Levels in Binary Tree
 Similar concept of using BFS(Queue) or DFS(stack)
 The concept being for BFS, add items to a queue, remove the node and add its children to the queue.
 Keep a total counter on each iteration of the queue, the final total value will be the deepest leaves sum.
 
 */
func deepestLeavesSum(_ root: TreeNode?) -> Int {
    if root == nil{
        return 0
    }
    var queue : [TreeNode] = [root!]
    var total = 0
    while (queue.count > 0){
        let count = queue.count
        total = 0
        for i in 0..<count{
            let node = queue.removeFirst()
            total += node.val
            if let l = node.left{
                queue.append(l)
            }
            if let r = node.right{
                queue.append(r)
            }
        }
    }
    return total
}
/*
 Approach using level parameter :
 
 */
func deepestLeavesSum2(_ root: TreeNode?) -> Int {
    var sum : [Int] = [0]
    addLeaves(root, &sum, 0)
    return sum.last ?? 0
}

func addLeaves(_ root: TreeNode?,_ arr : inout [Int],_ level : Int) -> Void{
    guard let r = root else{
        return
    }
    let count = arr.count
    if(count <= level){
        arr.append(r.val)
    }else{
        arr[level] = arr[level] + r.val
    }
    addLeaves(r.left,&arr,level+1)
    addLeaves(r.right,&arr,level+1)
}

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
