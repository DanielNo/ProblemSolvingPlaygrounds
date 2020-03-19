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
 Attempt 1: Create two functions:
 turns a node into a number
 number into a node
 
 create a number with the number creation function and convert the number into a node with the other function
 
 Note - Worked until the input node exceeded Int64 number of digits.
 
 */

/* Attempt 2:
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
}

public func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    
    return nil
}

