import UIKit

/*
 1244. Design a Leaderboard
 
 Approach(easy to code) : Create a dictionary to store player ID : player score totals.
 Top K will sort the values and return the top K values found in the sorted array.
 
 Note: There should be a more optimal approach to solve the problem. This is the easiest to code.
 
 Time :
 O(1) add/reset
 O(n log n) topK function
 
 Space : O(n) for dictionary and array created when calling topK Function
 */

class Leaderboard {
    var dict : [Int:Int]

    init() {
        dict = Dictionary()
    }
    
    func addScore(_ playerId: Int, _ score: Int) {
        if let totalScore = dict[playerId]{
            dict[playerId] = totalScore + score
        }else{
            dict[playerId] = score
        }
    }
    
    func top(_ K: Int) -> Int {
        var sum = 0
        var topK = dict.values.sorted { (a, b) -> Bool in
                                       return a > b
                                      }
        for i in (0..<K){
            sum += topK[i]
        }
        return sum
    }
    
    func reset(_ playerId: Int) {
        dict[playerId] = 0
    }
}


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
