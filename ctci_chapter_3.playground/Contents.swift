//: Playground - noun: a place where people can play

import UIKit

import UIKit

// A linked list
public class ListNode {
  
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
  
  public func print() -> String{
      var str = String(self.val)
      var node = self
      while node.next != nil {
          node = node.next!
          str+="->\(String(node.val))"
      }
      return str
  }
}

// Node for stack or queue
public class Node : CustomStringConvertible{
    public var description: String
    
    var value : Int
    var next : Node?
    
    init() {
        self.value = 0
        self.next = nil
        self.description = String(value)
    }
    
    init(num : Int) {
        self.value = num
        self.description = String(value)
        let x = ""
        let y = ""
    }
    
    func add(node : Node){
        self.next = node
    }
    
    func printNode(){
        print(self.description)
    }
}

public class Stack : CustomStringConvertible{
    var top : Node?
    public var description: String{
        var desc = ""
        var head = top
        while head?.next != nil {
            desc += String(head!.value)
            head = head?.next
        }
        return desc
    }
    
    init() {
        self.top = Node()
    }
    
    func push(node : Node){
        node.next = top
        top = node
    }
    
    func pop(){
        var newTop = top?.next
        top = newTop
    }
}

//FIFO, First in first out
public class Queue : CustomStringConvertible{
    var head : Node?    //Pointer to first node of linked list, first out
    var tail : Node?    //Pointer to last node of linked list, last out
    public var description: String{
        var desc = ""
        var current = head
        while current != nil {
            desc += String(current!.value)
            current = current?.next
        }
        //        desc = "\(head)\(tail)"
        return desc
    }
    
    init() {
        var defaultHead = Node()
        defaultHead.next = Node()
        self.head = nil
        self.tail = nil
    }
    
    func enqueue(node : Node){
        if head == nil {
            head = node
        }else{
            tail?.next = node
            tail = node
        }
    }
    
    func dequeue(){
        if head == nil{
            return
        }
        var next = self.head?.next
        head = next
    }
}




//let node1 = Node(num: 1)
//let node2 = Node(num: 2)
//let node3 = Node(num: 3)
//let node4 = Node(num: 4)
//
//var myStack = Stack()
//myStack.push(node: node1)
//myStack.push(node: node2)
//myStack.push(node: node3)
//myStack.push(node: node4)
//myStack.pop()
//myStack.pop()
//myStack.pop()
//
//var myQueue = Queue()
//myQueue.enqueue(node: node1)
//myQueue.enqueue(node: node1)

