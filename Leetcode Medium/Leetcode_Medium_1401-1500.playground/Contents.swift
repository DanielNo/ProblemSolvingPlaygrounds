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
