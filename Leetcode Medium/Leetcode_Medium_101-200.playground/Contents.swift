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
        
    }
}
/*
 102. Binary Tree Level Order Traversal (medium)
 
 Approach : Use BFS because the problem is named "Binary Tree Level Order Traversal". BFS == level order traversal
 Here we use BFS using parameter that passes the current depth/level of tree. We execute our BFS using recursive helper function.
 Solved in 5 mins but with help of compiler/running against testcases and revising, it may be harder on whiteboard without compiler and output debugging.
 
 Time: O(n) because each node is visited once
 Space : O(n) for call stack worst case scenario and or output array storage which is O(n).
 
 */


func levelOrder(_ root: TreeNode?) -> [[Int]] {
    var ans : [[Int]] = []
    traverseTree(root, 0, &ans)
    return ans
}

func traverseTree(_ root: TreeNode?,_ level : Int,_ treeArray : inout [[Int]]) -> Void{
    guard let r = root else{
        return
    }
    let count = treeArray.count
    if count <= level{
        treeArray.append([r.val])
    }else{
        treeArray[level].append(r.val)
    }
    traverseTree(r.left,level+1,&treeArray)
    traverseTree(r.right,level+1,&treeArray)
}

/*
 103. Binary Tree Zigzag Level Order Traversal
 
 Approach : Traverse the tree with level order traversal (BFS). Use BFS technique using level parameter and recursion.
 Create a 2d array that stores the level order traversal. Reverse alternating rows of the 2d array to get the desired zig zag order that the question asks for. This question is the same as any BFS problem but with the added step of reversing alternating rows.
 
 Time : O(n)
 Space : O(n) because of storage array. May want to review this space complexity
 
 */

func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
    var ans : [[Int]] = []
    traverse(root,0,&ans)
    zigzag(&ans)
    return ans
}

func traverse(_ root : TreeNode?,_ level : Int,_ arr : inout [[Int]])->Void{
    guard let r = root else{
        return
    }
    
    if arr.count <= level{
        arr.append([r.val])
    }else{
        arr[level].append(r.val)
    }
    
    traverse(r.left,level+1,&arr)
    traverse(r.right,level+1,&arr)
}

func zigzag(_ arr : inout [[Int]]) -> Void{
    for i in 0..<arr.count{
        if i%2 == 1{
            arr[i] = arr[i].reversed()
        }
    }
}


/*
 111. Minimum Depth of Binary Tree
 
 Approach : Use BFS
 
 Copied from solutions:
 Time : O(n) visit each node exactly once
 Space : O(n) for storage of call stack in worst case
 O(log n) if tree is completely balanced.
 
 */
func minDepth(_ root: TreeNode?) -> Int {
    return findDepth(root,1)
}

func findDepth(_ root: TreeNode?,_ level : Int) -> Int{
    guard let r = root else{
        return 0
    }
    
    if root?.left == nil && root?.right == nil{
        return level
    }else if(root?.left == nil && root?.right != nil){
        return findDepth(root?.right,level+1)
    }else if(root?.right == nil && root?.left != nil){
        return findDepth(root?.left,level+1)
    }else{
        let left = findDepth(root?.left,level+1)
        let right = findDepth(root?.right,level+1)
        return left < right ? left : right
    }
}


/*
 113. Path Sum II
 
 Approach : Use BFS recursive traversal and maintain a path arr of the current tree path.
 
 Note : Read time and space complexity on solutions but still cannot conclude the correct time/space.
 Time: Not sure
 Space: Not sure
 
 */
var ans : [[Int]] = []
func pathSum(_ root: TreeNode?, _ sum: Int) -> [[Int]] {
    bfsTraverse(root,sum,0,[])
    
    return ans
}

func bfsTraverse(_ root: TreeNode?,_ sum : Int,_ currSum : Int, _ pathArr : [Int]){
    guard let r = root else{
        return
    }
    
    let newArr = pathArr + [r.val]
    if r.left == nil && r.right == nil{
        if currSum + r.val == sum{
            ans.append(newArr)
        }
        
    }else if(r.left == nil && r.right != nil){
        bfsTraverse(root?.right,sum,currSum + r.val,newArr)
    }else if(r.left != nil && r.right == nil){
        bfsTraverse(root?.left,sum,currSum + r.val,newArr)
    }else{
        bfsTraverse(root?.right,sum,currSum + r.val,newArr)
        bfsTraverse(root?.left,sum,currSum + r.val,newArr)
    }
}
