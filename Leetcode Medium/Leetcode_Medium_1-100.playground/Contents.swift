import UIKit
/*
 2. Add Two Numbers
 You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
 
 You may assume the two numbers do not contain any leading zero, except the number 0 itself.
 
 Example:
 
 Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
 Output: 7 -> 0 -> 8
 Explanation: 342 + 465 = 807.
 */

/*
 Attempt 1 without cheating: Create two functions:
 turns a node into a number
 number into a node
 
 create a number with the number creation function and convert the number into a node with the other function
 
 Note - Worked until the input node exceeded Int64 number of digits.
 
 */

/* Attempt 2, after cheating:
 Look at leetcode solution of adding in place and keeping track of the carry
 */

public class ListNode {
    
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    public func desc() -> String{
        var str = String(self.val)
        var node = self
        while node.next != nil {
            node = node.next!
            str+="->\(String(node.val))"
        }
        return str
    }
    
    
    convenience init(_ arr : [Int]) {
        self.init(0)
        var head : ListNode?
        for (index,num) in arr.enumerated(){
            if index == 0{
                self.init(num)
                head = self
            }else{
                head?.next = ListNode(num)
                head = head?.next
            }
        }
    }
}

public func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    guard let _ = l1 else{
        return l2
    }
    guard let _ = l2 else{
        return l1
    }
    var head : ListNode?
    var node = head
    var n1 = l1
    var n2 = l2
    var carry = 0
    while n1 != nil || n2 != nil{
        let v1 = n1?.val ?? 0
        let v2 = n2?.val ?? 0
        let sum = v1 + v2 + carry
        if n1 != nil{
            n1 = n1?.next
        }
        
        if n2 != nil{
            n2 = n2?.next
        }
        
        if head == nil{
            head = ListNode(sum%10)
            node = head
        }else{
            node?.next = ListNode(sum%10)
            node = node?.next
        }
        
        carry = sum/10
    }
    if carry > 0{
        node?.next = ListNode(carry)
    }
    return head
}
let test1 = ListNode([9,8])
let test2 = ListNode([5])

test1.desc()
test2.desc()


let ans = addTwoNumbers(test1, test2)
ans?.desc()


let test3 = ListNode([2,4,3])
let test4 = ListNode([5,6,4])

let ans2 = addTwoNumbers(test3, test4)
ans2?.desc()


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

var treeAns : [Int] = Array()

/*
94. Binary Tree Inorder Traversal
 Approach 1 : recursion
 Approach 2 :
 Code copied from tushar youtube video to understand morris traversal.
 Morris traversal, which mutates the binary tree and creates links between rightmost child in left subtree of a node to itself. Continues going left until left child is null.
 
 
 TODO : Try problem again after fully understanding morris traversal.
 
 */
func inorderTraversal(_ root: TreeNode?) -> [Int] {
    traverse(root)
    return treeAns
}

func traverse(_ root: TreeNode?) -> [Int]{
    var curr = root
    var arr : [Int] = Array()
    while curr != nil{
        if curr?.left == nil{
            arr.append(curr!.val)
            curr = curr?.right
        }else{
            var predecessor = findRightPredecessor(node: curr)
            if predecessor?.right == nil{
                predecessor?.right = curr
                curr = curr?.left
                
            }else{
                predecessor?.right = nil
                arr.append(curr!.val)
                curr = curr?.right
            }

        }
    }
    
    
    return arr
}

func findRightPredecessor(node : TreeNode?) -> TreeNode?{
    var pred : TreeNode? = node?.left
    while pred?.right != nil && (pred?.right !== node) {
        pred = pred?.right
    }
    return pred
}

let tree = TreeNode(8)
tree.left = TreeNode(4)
tree.right = TreeNode(9)
tree.left?.left = TreeNode(2)
tree.left?.right = TreeNode(6)
tree.left?.left?.left = TreeNode(1)
tree.left?.left?.right = TreeNode(3)
tree.left?.right?.left = TreeNode(5)
tree.left?.right?.right = TreeNode(7)

traverse(tree)

//let x = findRightPredecessor(node: tree)

/*
    36. Valid Sudoku
 
 Approach (initial thoughts): Validate every row and column and cube in a seperate hash set of characters
 
 Approach(cheating from nick white video): Create a single set of strings that contains row,column and cube identifiers
 - Was fairly simple to code out.
 
 Time Complexity : O(n * m)
 Space Complexity : O(n * m)
 */

func isValidSudoku(_ board: [[Character]]) -> Bool {
    var seen : Set<String> = Set()
    for (i,row) in board.enumerated(){
        for(j,col) in row.enumerated(){
            let str = board[i][j]
            if str == "."{
                continue
            }
            let r = "\(str),row \(i)"
            let c = "\(str),col \(j)"
            let cube = "\(str),cube\(i/3)\(j/3)"
            if seen.contains(r) || seen.contains(c) || seen.contains(cube){
                return false
            }else{
                seen.insert(r)
                seen.insert(c)
                seen.insert(cube)
            }
        }
    }
        return true
    }

