//: Playground - noun: a place where people can play

import UIKit

//Fibonacci Sequence with memoization xD
var memo = {
    return [0 : 0, 1 : 1]
}()

func fibonacci(num : Int) -> Int{
    if num <= 0 {
        return memo[0]!
    }
    if memo[num] == nil{
        memo[num] = fibonacci(num: num - 1) + fibonacci(num: num - 2)
    }
    
    return memo[num]!
}

// Fibonacci with pattern matching
func swiftyFib(num : Int) -> Int{
    switch num {
    case _ where num <= 0:
        return memo[0]!
    case 1:
        return memo[1]!
    default:
        if memo[num] == nil{
            memo[num] = swiftyFib(num: num - 1) + swiftyFib(num: num - 2)
        }
        return memo[num]!
    }
}

//fibonacci(num: 90)
swiftyFib(num: 90)



public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
    public init(_ val: Int, left : Int, right : Int) {
        self.val = val
        self.left = TreeNode(left)
        self.right = TreeNode(right)
    }
    
    // Leetcode : Max Howell Invert binary tree : https://leetcode.com/problems/invert-binary-tree/description/
    // Approach : Recursively swap left and right nodes of the tree
    public func invertTree(_ root: TreeNode?) -> TreeNode? {
        if root?.left == nil && root?.right == nil {
            return root
        }
        var tree = root
        let left = root?.left
        let right = root?.right
        tree?.left = right
        tree?.right = left
        invertTree(tree?.left)
        invertTree(tree?.right)
        return tree
    }
    
}
var tree = TreeNode(1, left: 2, right: 3)
var left = tree.left?.val
var right = tree.right?.val
tree.invertTree(tree)
var left2 = tree.left?.val
var right2 = tree.right?.val

