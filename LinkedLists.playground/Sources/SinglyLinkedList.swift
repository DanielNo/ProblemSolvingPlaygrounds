import Foundation

public class SinglyLinkedList : CustomStringConvertible{
    public var description: String {
        if head == nil {
            return "[ ]"
        }
        var curr = self.head
        var desc = ""
        while curr != nil {
            if desc == ""{
                desc = curr!.description
            }else{
                desc += ", \(curr!.description)"
                
            }
            curr = curr?.next
        }
        desc = "[\(desc)]"
        return desc
    }
    public var head : Node?
    
    public init() {
        self.head = nil
    }
    
    public init(node : Node) {
        self.head = node
    }
    
    public init(nums : [Int]) {
        if nums.count == 0 {
            self.head == nil
            return
        }
        self.head == nil
        var curr = head
        for num in nums{
            if self.head == nil{
                self.head = Node(num: num)
                curr = self.head
            }else{
                let next = Node(num : num)
                curr?.add(node: next)
                curr = curr?.next
            }
        }
    }
    
    // Add node to end of LinkedList
    public func append(node : Node){
        var current = head
        while current!.next != nil {
            current = current!.next
        }
        current?.add(node: node)
        
    }
    
    public func count() -> Int{
        if head == nil{
            return 0
        }
        var current = head
        var count = 1
        while current?.next != nil {
            current = current!.next
            count += 1
        }
        return count
    }
    
    public func printLinkedList(){
        var node = head
        var output = "["
        while node != nil {
            output = "\(output)\(node!.description)"
            node = node!.next
            if node != nil{
                output = output + ","
            }
        }
        output = output + "]"
        print("Singly Linked List : \(output)")
    }





    public func nodeAt(index: Int) -> Node?{
        if (index < 0){return nil}
        var count = 0
        var node = head
        while count != index && node != nil{
            count += 1
            node = node?.next
            print("iteration : \(count)")
        }
        return node
    }
    
    public func insert(node : Node, index : Int){
        if index >= self.count() || index < 0{
            print("invalid")
            return
        }
        if index == 0{
            let oldHead = head
            node.next = oldHead
            self.head = node
            return
        }
        
        var nodeBefore = self.nodeAt(index: index-1)
        var temp = nodeBefore?.next
        nodeBefore?.next = node
        nodeBefore?.next?.next = temp
        nodeBefore?.printNode()
    }
    
    // Removes first occurence of value in linked list
    public func remove(value : Int){
        var node = head
        if head?.value == value {
            head = head?.next
            return
        }
        var current = head?.next
        var prev = head
        while current?.value != value && current?.next != nil{
            prev = prev?.next
            current = current?.next
        }
        if current?.value == value {
            prev?.next = prev?.next?.next
        }
    }
    
    public func delete(position : Int){
        if position == 0{
            self.head = self.head?.next
            return
        }
        else{
            var node = nodeAt(index: position-1)
            node?.next = node?.next?.next
        }
    }
    
    //        var current = head
    //        var prev : Node? = nil
    //        while current?.value != value && current?.next != nil {
    //            prev = current
    //            current = current?.next
    //            if current?.value == value{
    //                if prev != nil{
    //                    prev?.next = current
    //                }else{
    //                    self.head = current?.next
    //                }
    //
    //            }
    //        }

    
    // TODO:**FINISH THIS**
    public func removeNodesWithValue(value : Int) -> SinglyLinkedList?{
        var ans = self.head
        while (ans?.value == value){
            ans = ans?.next
        }
        var curr = ans
        while curr != nil {
            if(curr?.next?.value == value){
                curr?.next = curr?.next?.next
            }
            curr = curr!.next
        }
        return SinglyLinkedList(node : ans!)
    }
    
    public func reverseTraversal() -> SinglyLinkedList?{
        var prev : Node?
        var current = head
        var nextNode = current?.next
        while current != nil {
            nextNode = current?.next
            current?.next = prev
            prev = current
            current = nextNode
        }
        self.head = prev
        return self
    }
    
    public func recursiveReverse(nextNode : Node?,current : Node?) -> Void{
        if current == nil {
            return
        }else{
            var next = current?.next
            current?.next = nextNode
            recursiveReverse(nextNode: current, current: next)
        }
        
    }
    
    public func recursiveAddition(nextNode : Node) -> Int{
        if nextNode == nil {
            return 0
        }else{
            if nextNode.next != nil{
                return nextNode.value + recursiveAddition(nextNode: nextNode.next!)
            }else{
                return nextNode.value
            }
        }
        
    }
    
    // Recursively count frequency
    public func countFrequency(val : Int, node : Node?) -> Int{
        if node == nil {
            return 0
        }
        return node?.value == val ? 1 + countFrequency(val : val, node : node?.next) : 0 + countFrequency(val : val, node : node?.next)
    }

    // TODO : Revise later
//    static public func recursiveContains(val : Int, node : Node?) -> Bool{
//        if node == nil {
//            return false
//        }
//        if node?.next == nil {
//            return node?.value == val
//        }else{
//            return node?.value == val || recursiveContainsval(val : val, node : node?.next)
//        }
//    }
    
    // TODO:
    public func iterativeContains(val : Int) -> Bool{
        var node = self.head
        return true
    }
    
    /*
     21. Merge Two Sorted Lists : https://leetcode.com/problems/merge-two-sorted-lists/description/
     Merge two sorted linked lists and return it as a new list. The new list should be made by splicing together the nodes of the first two lists.
     
     Input: 1->2->4, 1->3->4
     Output: 1->1->2->3->4->4
     
     Approach : Iterate through both linked lists and compare for the smaller value. Add the smaller value to the combined linked list and bump the head pointer, repeat until one linked list has finished iterating. Add the remaining elements of the larger linked list.
     * Was difficult to do without looking at hints because of difficulty to keep head pointer. Redo again later iteratively and recursively
     Time : O(n) linear
     Space : O(n + m) combined space of linked list n and m
     */

    public static func mergeTwoLists(_ l1: Node?, _ l2: Node?) -> Node? {
        if l1 == nil{
            return l2
        }
        if l2 == nil{
            return l1
        }
        var n1 = l1
        var n2 = l2
        var result : Node? = Node(num : 0)
        var head = result
        while(n1 != nil && n2 != nil){
            if(n1!.value <= n2!.value){
                head?.next = n1
                n1 = n1!.next
            }else{
                head?.next = n2
                n2 = n2!.next
            }
            head = head?.next
        }
        var remainder = n1 == nil ? n2 : n1
        head?.next = remainder
        return result?.next
    }

    
}
