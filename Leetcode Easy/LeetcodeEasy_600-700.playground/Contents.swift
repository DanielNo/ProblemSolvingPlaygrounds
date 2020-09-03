//: Playground - noun: a place where people can play

import UIKit

/* 617. Merge Two Binary Trees
 Approach : Use Depth first Search to check the root node, then left and right subtrees using recursion.
 Time Complexity : O(n)
 Space Complexity : O(h) where h is the height of the tree
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


func mergeTrees(_ t1: TreeNode?, _ t2: TreeNode?) -> TreeNode? {
    
    if t1 == nil && t2 != nil{
        print("\(t2?.val)")

        return t2
    }else if(t1 != nil && t2 == nil){
        print("\(t1?.val)")
        return t1
    }else if(t1 == nil && t2 == nil){
        return nil
    }
    print("\(t1?.val) \(t2?.val)")
    var root = TreeNode(t1!.val + t2!.val)
    root.left = mergeTrees(t1?.left, t2?.left)
    root.right = mergeTrees(t1?.right, t2?.right)
    
    return root
}

var tree1 = TreeNode(1)
tree1.left = TreeNode(2)
tree1.right = TreeNode(2)
tree1.left?.left = TreeNode(3)
tree1.right?.left = TreeNode(3)
tree1.left?.right = TreeNode(3)
tree1.right?.right = TreeNode(3)
var tree2 = TreeNode(1)
tree2.left = TreeNode(2)
tree2.right = TreeNode(2)
mergeTrees(tree1, tree2)

/*
637. Average of Levels in Binary Tree (resolved with queue approach)

Approach : Use an array to simulate a queue. removeFirst and append methods can be used to mimic behavior of a queue while using an available array collection type.
Use Breadth First Search aka level order traversal (queue approach). Start with a queue containing a root node. First step is to removeFirst(queue dequeue) which returns root. Enqueue its children after finding the average of this level.
Basically empty out the queue every time for each level, replace values with the next level and continue iterating until nothing is left in the queue (no children remain)

*/


func averageOfLevels(_ root: TreeNode?) -> [Double] {
    if root == nil{
        return [0.0]
    }
    var queue : [TreeNode] = [root!]
    var ans : [Double] = Array()
    while (queue.count > 0){
        let count = queue.count
        var total = 0.0
        var nodes = 0
        for i in 0..<count{
            let node = queue.removeFirst()
            total += Double(node.val)
            nodes+=1
            
            if let l = node.left{
                queue.append(l)
            }
            if let r = node.right{
                queue.append(r)
            }
        }
        ans.append(total/Double(nodes))
    }
    
    return ans
}


/* 682. Baseball Game

 
 */

// TODO : Solve this
let input1 = ["5","2","C","D","+"]
let input2 = ["36","28","70","65","C","+","33","-46","84","C"]
let input3 = ["5","-2","4","C","D","9","+","+"]
let answer1 = 30
let answer2 = 219
let answer3 = 27
func calPoints(_ ops: [String]) -> Int {
    let count = ops.count
    var first = 0
    var second = 0
    var third = 0
    var total = 0
    
    
    for i in 0..<count{
        let move = ops[i]
        third = second
        if let score = Int(move){
            second = first
            first = score
            total += first
            print("\(score) - \(total), first : \(first), second : \(second))")
        }else{
            if(move == "D"){
                second = first
                first = first * 2
                total += first
                print("D - \(total), first : \(first), second : \(second))")
                
            }else if(move == "C"){
                total -= first
                first = second
                print("C - \(total), first : \(first), second : \(second))")
                
            }else if(move == "+"){
                let temp = first
                first = first + second
                second = temp
                total += first
                print("+ - \(total), first : \(first), second : \(second))")
            }
            
            
            
            
        }
    }
    
    return total
}

/*
700. Search in a Binary Search Tree

Approach : Check value if greater, less than or equal to target. Recursively search down the leaves based on the value comparison.

Note : Slowly code up the problem using recursion. Was able to solve in a few compilation attempts without much trouble

Time : O(log n)
Space : O(h) stack space which is height of tree

*/


func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
    guard let r = root else{
        return nil
    }
    if r.val == val{
        return root
    }else if r.val > val{
        return searchBST(r.left,val)
    }else if r.val < val{
        return searchBST(r.right,val)
    }
    return nil
}
