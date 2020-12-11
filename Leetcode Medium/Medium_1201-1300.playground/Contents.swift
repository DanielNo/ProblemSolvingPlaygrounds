import UIKit

/*
1265. Print Immutable Linked List in Reverse
Approach 1(extra space & reverse, trivial): Use space to hold elements returned by the getNext method. Reverse contents of the array. Iterate forwards and call the print method

Approach 2(recursion): Use proper order of operations in recursion. If the recursive call reaches end case of : No next value, print it. In parent recursive call in stack, print after the next node's recursive call.

Note : Had to look at discussions to discover recursive approach. Was able to code it up after a few attempts debugging submission. End solution was after some modification after looking at discussions tab. I initially used a while loop which was wrong and unnecessary.

Time: O(n)
Space : O(n) stack space. Recursive call for each node.

*/

 
public class ImmutableListNode {
    public func printValue() {}
    public func getNext() -> ImmutableListNode?{
        return nil // Fake implementation so it compiles
    }
}


func printLinkedListInReverse(_ head: ImmutableListNode?) {
        guard let h = head else{
            return
        }
        if(h.getNext() != nil){
            printLinkedListInReverse(h.getNext())
            h.printValue()
        }else{
            h.printValue()
        }
    }

// Optimized recursive after looking at examples
func printLinkedListInReverse2(_ head: ImmutableListNode?) {
        guard let h = head else{
            return
        }
        printLinkedListInReverse(h.getNext())
        h.printValue()
    }
