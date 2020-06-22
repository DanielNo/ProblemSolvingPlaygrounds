import UIKit

/*
701. Insert into a Binary Search Tree
Approach : Use recursion to insert the element into the tree. Hold a reference to the original tree and mutate it.
Iterate through the tree using recursion, when an insertion point is found, check to see if it is nil, if it is nil create a new TreeNode with the insertion value. If the insertion point is not nil, continue iterating through the insertion node's leaves.
Note: Be careful with optional types and mutable references when trying to solve the problem. Took multiple compilations and revisions to get a correct answer on leetcode.
Time : O(log n)
Space : Should be O(1), but have to create a mutable reference to the tree due to leetcode limitations on changing function definition to inout so it is O(n) on leetcode.
*/
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


func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
    if root == nil{
        return TreeNode(val)
    }
    var tree = root
    bstInsert(&tree!,val)
    return tree
}

func bstInsert(_ root: inout TreeNode, _ val: Int){
    let nodeVal = root.val
    
    if val < nodeVal{
        if var left = root.left{
            bstInsert(&left,val)
        }else{
            root.left = TreeNode(val)
        }
    }else if (val > nodeVal){
        if var right = root.right{
            bstInsert(&right,val)
        }else{
            root.right = TreeNode(val)
        }
    }
    
}


// 791. Custom Sort String

// First attempt
func customSortString(_ S: String, _ T: String) -> String {
    var dict : [Character : Int] = Dictionary()
    
    var count = 0
    for letter in S{
        if dict[letter] == nil{
            dict[letter] = count
            count += 1
        }
    }
    let head = T.filter { (c) -> Bool in
        dict[c] != nil
        }.sorted { (a, b) -> Bool in
            return dict[a]! < dict[b]!
    }
    let tail = T.filter { (c) -> Bool in
        dict[c] == nil
    }
    
    
    return String(head+tail)
}

// Second attempt using bucket sort
func customSortStringBucket(_ S: String, _ T: String) -> String {
    var bucket : [Character : Int] = Dictionary()
    var tail = ""
    for char in S{
        if bucket[char] == nil {
            bucket[char] = 0
        }
    }
    for char in T{
        if(bucket[char] == nil){
            tail.append(char)
        }else{
            bucket[char] = bucket[char]! + 1
        }
    }
    var head = ""
    for char in S{
        for count in 0..<bucket[char]!{
            head.append(char)
        }
    }
    return head + tail
}


customSortString("cbaed", "wabcdebcdecdeadedceabbaw")
customSortStringBucket("cbaed", "wabcdebcdecdeadedceabbaw")
