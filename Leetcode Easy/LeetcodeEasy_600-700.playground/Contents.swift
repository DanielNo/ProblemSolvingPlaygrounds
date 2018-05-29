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
