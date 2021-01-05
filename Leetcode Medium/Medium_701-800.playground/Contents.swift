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


/*
 784. Letter Case Permutation
 
 Approach : Build a lookup table to see if a character is a letter and also to find its inverse capitalization easily.
 Make a recursive helper function that builds a permutation from the bottom up.
 
 Note: Had to cheat on the first solve of the problem. But this is my own solution after not looking at the problem for some time, and resolving after getting more comfortable with backtracking. Solved again with relative ease.
 
 Time: O(2^n)
 Space: O(n) which is the height of the recursive call stack
 
 */
var table : [Character : Character] = [
    "a" : "A","b" : "B","c" : "C","d" : "D","e" : "E","f" : "F","g" : "G","h" : "H","i" : "I","j" : "J","k" : "K","l" : "L","m" : "M","n" : "N","o" : "O","p" : "P","q" : "Q","r" : "R","s" : "S","t" : "T","u" : "U","v" : "V","w" : "W","x" : "X","y" : "Y","z" : "Z","A" : "a","B" : "b","C" : "c","D" : "d","E" : "e","F" : "f","G" : "g","H" : "h","I" : "i","J" : "j","K" : "k","L" : "l","M" : "m","N" : "n","O" : "o","P" : "p","Q" : "q","R" : "r","S" : "s","T" : "t","U" : "u","V" : "v","W" : "w","X" : "x","Y" : "y","Z" : "z"]

func letterCasePermutation(_ S: String) -> [String] {
    var perms : [String] = []
    let str = Array(S)
    backtrack(str, Array(), &perms,0)
    return perms
}

func backtrack(_ chars : [Character],_ perm : [Character],_ perms : inout [String],_ index : Int ) -> Void{
    // print("\(perm) \(index)")
    if index == chars.count{
        perms.append(String(perm))
        return
    }
    let char = chars[index]
    var currPerm = perm
    currPerm.append(char)
    if let val = table[char]{
        backtrack(chars,currPerm,&perms,index+1)
        currPerm.removeLast()
        currPerm.append(val)
        backtrack(chars,currPerm,&perms,index+1)
    }else{
        backtrack(chars,currPerm,&perms,index+1)
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
