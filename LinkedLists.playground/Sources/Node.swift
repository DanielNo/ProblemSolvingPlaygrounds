import Foundation

public class Node : CustomStringConvertible{
    public var description: String
    
    public var value : Int
    public var next : Node?
    
    public init() {
        self.value = 0
        self.next = nil
        self.description = String(value)
    }
    
    public convenience init(num : Int) {
        self.init()
        self.value = num
        self.description = String(value)
    }
    
    public func add(node : Node){
        self.next = node
    }
    
    public func printNode(){
        print(self.description)
    }
    
    static public func printAllValues(node : Node?){
        var curr = node
        var desc = ""
        while curr != nil {
            if desc == ""{
                desc = curr!.description
            }else{
                desc += ", \(curr!.description)"
            }
            curr = curr?.next
        }
        print("\(desc)")
    }
    
    // Leetcode : https://leetcode.com/problems/remove-duplicates-from-sorted-list/description/
    // Approach : Use runner technique to check neighboring nodes, we can do this because the linkedlist is sorted
    // Given 1->1->2, return 1->2.
    // Given 1->1->2->3->3, return 1->2->3.
    public static func deleteDuplicates(_ head: Node?) -> Node? {
        var slow = head
        var fast = head?.next
        var node = slow
        while fast != nil {
            if slow?.value == fast?.value{
                slow?.next = fast?.next
                fast = fast?.next
            }else{
                slow = slow?.next
                fast = fast?.next
            }
        }
        return node
    }
    
    // Leetcode : https://leetcode.com/problems/reverse-linked-list/description/
    // Approach : Reverse it in one pass, with multiple pointers to nodes
    // start with tail being nil. This was a little tricky to do on paper without any logical feedback.
    public func reverseList(_ head : Node?) -> Node?{
        if(head?.next == nil){
            return head
        }
        var curr = head
        var tail : Node? = nil
        while(curr != nil){
            let next = curr?.next
            curr?.next = tail
            tail = curr
            curr = next
        }
        return tail

    }

}


