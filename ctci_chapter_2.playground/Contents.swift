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
    print("target \(target)")
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

var linkedList = SinglyLinkedList(nums: [1,2,3,4,5,6])
let n = kthToLastElementBrute(head: linkedList.head, k: 1)
//removeDupesNoBuffer(linkedList: &linkedList)
//removeDuplicates(linkedList: &linkedList)

