//: Playground - noun: a place where people can play

import UIKit
/*
 2.1 Remove duplicates - remove duplicate values, but not the single occurence of the value...
 Approach : Using extra space, create a set and confirm values exist or dont exist as a duplicate, remove duplicate values within a single pass of the linkedlist
 */
func removeDuplicates(linkedList : inout SinglyLinkedList) -> SinglyLinkedList{
    var prev : Node?
    var curr = linkedList.head
    var dupes = Set<Int>()
    
    while curr != nil {
        if dupes.contains(curr!.value) {
            prev?.next = curr?.next
        }else{
            dupes.insert(curr!.value)
            prev = curr
        }
        curr = curr!.next
    }


    return linkedList
}
/*
2.1 Follow up : Remove duplicates no extra space/buffer
 Approach : Iterate through array in one pass,track a node to check for duplicates, track prev and curr to allow deletion
 Time : O(n^2) - quadratic time
 Space : O(1) - constant time
 */
func removeDupesNoBuffer(linkedList : inout SinglyLinkedList) -> SinglyLinkedList{
    var nodeCheck = linkedList.head
    var prev = linkedList.head
    var curr = linkedList.head?.next
    while nodeCheck?.next != nil {
        if nodeCheck?.value == curr?.value {
            prev?.next = curr?.next
        }else{
            prev = curr
        }
        curr = curr?.next
        if curr == nil {
            nodeCheck = nodeCheck?.next
            prev = nodeCheck
            curr = nodeCheck?.next
        }
    }
    return linkedList
}

/* 2.2 Return kth to last element in singly linked list
 Approach : Iterate through linked list to find the size. Define a target value to hit on the second iteration of the linked list : LinkedList_Size - kth_to_last_element = Target_Node
    Return the node if the target is reached, else return nil if the kth_to_last_element > size or if nothing is found
 */

func kthToLastElementBrute(head : Node?, k : Int) -> Node?{
    var curr = head
    var size = 0
    var count = 0
    while curr != nil {
        size+=1
        curr = curr?.next
    }
    if k > size {
        return nil
    }
    let target = size - k
//    print("target \(target)")
    curr = head
    while curr != nil {
        if target == count {
            return curr
        }else{
            count+=1
        }
        curr = curr?.next
    }
    return nil
}

/* 2.3 Delete middle node
 Question : Delete a node in the middle (not necessarily the middle node). The node must not be the first or last node of a singly linked list, given only access to that node
 
 Not sure how this input works out, because C could be the first node, we cannot tell....
 input : a > b  > c > d > e > f
 output : a > b > d > e > f
 
 input : a > b
 output : a > b
 
 Approach : If node.next == nil, then the provided node is the tail, do nothing. If node.next != nil && node.next.next != nil, we should delete node.next because we can safely assume that node.next can act as a "middle" node. Not having knowledge on a possible preceding node to the given node, we cannot make concrete assertions about the problem.
    Due to ambiguity in the wording and input output example provided, I will code up a way to delete the given node without a previous pointer. Copy contents of node.next into node and swap pointer of node.next to node.next.next
 */

func deleteMiddleNode(node : Node) -> Node?{
    var curr = node
    curr.value = 2
    curr.next?.next?.value = 99

    curr.next = curr.next?.next
    return curr
}

/*
 2.5 Sum Lists
 Input : (7 -> 1 -> 6) + (5 -> 9 -> 2). That is 617 + 295 = 912
 Output : 2 -> 1 -> 9. That is 912
 
 Approach : Reverse the linked list and add the values to a sum, while keeping a counter for digits
 
 Follow up
 Suppose the digits are stored in forward order. Repeat the above problem
 Example
 Input : (6 -> 1 -> 7) + (2 -> 9 -> 5). That is 617 + 295
 Output : 9 -> 1 -> 2. That is 912

*/

func sumList(num1 : Node?, num2 : Node?) -> Node?{
    let sum = reverseLinkedListToNum(node: num1) + reverseLinkedListToNum(node: num2)
    return numberToLinkedList(number: sum)
}

func reverseLinkedListToNum(node : Node?) -> Int{
    var sum = 0
    var multiple = 1
    var head = node
    while head != nil {
        let val = head!.value * multiple
        multiple = multiple * 10
        head = head?.next
        sum = sum + val
    }
    print("sum : \(sum)")
    return sum
}

func numberToLinkedList(number : Int) -> Node?{
    var num = number
    
    var head : Node? = nil
    
    while (num != 0) {
        let val = num % 10
        num = num / 10
        
        let node = Node(num: val)
        node.next = head
        head = node
    }
    return head
}

let num = SinglyLinkedList(nums: [7,1,6])
let num2 = SinglyLinkedList(nums: [5,9,2])

let sumOfLinkedLists = sumList(num1: num.head, num2: num2.head)
Node.printAllValues(node: sumOfLinkedLists)

var b : Node? = Node(num: 1)
b?.next = Node(num: 2)
b?.next?.next = Node(num: 3)
b?.next?.next?.next = Node(num: 4)
let xa = SinglyLinkedList(node: b!)

deleteMiddleNode(node: b!)

let x = SinglyLinkedList(node: b!)


//var linkedList = SinglyLinkedList(nums: [1,2,3,4,5,6])
var linkedList = SinglyLinkedList(nums: [1,1,1,1,5,1])
let n = kthToLastElementBrute(head: linkedList.head, k: 1)
//removeDupesNoBuffer(linkedList: &linkedList)
//removeDuplicates(linkedList: &linkedList)
let fre = linkedList.countFrequency(val: 5, node: linkedList.head)
var list = SinglyLinkedList(nums: [1,2,3,4])
var head = list.head
var next = head?.next
head?.next = nil

