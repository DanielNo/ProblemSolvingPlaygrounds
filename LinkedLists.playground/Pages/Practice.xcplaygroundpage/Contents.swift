//: [Previous](@previous)

import Foundation


var linkedList = SinglyLinkedList(nums: [1,1,3,1,5,1,1,2,11,1])
let fre = linkedList.countFrequency(val: 5, node: linkedList.head)

//SinglyLinkedList.recursiveContainsval(val: 4, node: linkedList.head)

linkedList.removeNodesWithValue(value: 1)

var sortedLinkedlist = SinglyLinkedList(nums: [1,1,2])
var sortedLinkedlist2 = SinglyLinkedList(nums: [1,2,3,3])

var head = sortedLinkedlist2.head

var x = Node.deleteDuplicates(head)
Node.printAllValues(node: x)
