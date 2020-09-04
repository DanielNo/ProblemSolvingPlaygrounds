import UIKit

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}


/*
 23. Merge k Sorted Lists
 
 Approach : Iterate through each linkedlist and add the values into an array that is not sorted. Sort the array and create a new linked list from the sorted array's values
 
 Time: O(n log n), collecting all values into unsorted array is linear O(n). sorting is O(nlogn), iterating and creating the linked list is O(n). O(n log n) is the upper bound.
 Space: O(n)
 
 */
func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
    var values : [Int] = []
    for (i,node) in lists.enumerated(){
        var head = node
        while head != nil{
            values.append(head!.val)
            head = head!.next
        }
        
    }
    values.sort()
    
    var merged : ListNode? = nil
    var head = merged
    for val in values{
        if merged == nil{
            merged = ListNode(val)
            head = merged
        }else{
            merged?.next = ListNode(val)
            merged = merged?.next
        }
    }
    
    return head
}
