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

var linkedList = SinglyLinkedList(nums: [5,5,5,5,5,5,5,4,4,5])
removeDupesNoBuffer(linkedList: &linkedList)
//removeDuplicates(linkedList: &linkedList)

