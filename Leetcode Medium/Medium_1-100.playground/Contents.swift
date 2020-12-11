import UIKit
/*
 2. Add Two Numbers
 You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
 
 You may assume the two numbers do not contain any leading zero, except the number 0 itself.
 
 Example:
 
 Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
 Output: 7 -> 0 -> 8
 Explanation: 342 + 465 = 807.
 */

/*
 Attempt 1 without cheating: Create two functions:
 turns a node into a number
 number into a node
 
 create a number with the number creation function and convert the number into a node with the other function
 
 Note - Worked until the input node exceeded Int64 number of digits.
 
 */

/* Attempt 2, after cheating:
 Look at leetcode solution of adding in place and keeping track of the carry
 */

public class ListNode {
    
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    public func desc() -> String{
        var str = String(self.val)
        var node = self
        while node.next != nil {
            node = node.next!
            str+="->\(String(node.val))"
        }
        return str
    }
    
    
    convenience init(_ arr : [Int]) {
        self.init(0)
        var head : ListNode?
        for (index,num) in arr.enumerated(){
            if index == 0{
                self.init(num)
                head = self
            }else{
                head?.next = ListNode(num)
                head = head?.next
            }
        }
    }
}

public func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    guard let _ = l1 else{
        return l2
    }
    guard let _ = l2 else{
        return l1
    }
    var head : ListNode?
    var node = head
    var n1 = l1
    var n2 = l2
    var carry = 0
    while n1 != nil || n2 != nil{
        let v1 = n1?.val ?? 0
        let v2 = n2?.val ?? 0
        let sum = v1 + v2 + carry
        if n1 != nil{
            n1 = n1?.next
        }
        
        if n2 != nil{
            n2 = n2?.next
        }
        
        if head == nil{
            head = ListNode(sum%10)
            node = head
        }else{
            node?.next = ListNode(sum%10)
            node = node?.next
        }
        
        carry = sum/10
    }
    if carry > 0{
        node?.next = ListNode(carry)
    }
    return head
}
let test1 = ListNode([9,8])
let test2 = ListNode([5])

test1.desc()
test2.desc()


let ans = addTwoNumbers(test1, test2)
ans?.desc()


let test3 = ListNode([2,4,3])
let test4 = ListNode([5,6,4])

let ans2 = addTwoNumbers(test3, test4)
ans2?.desc()


 public class TreeNode {
     public var val: Int
     public var left: TreeNode?
     public var right: TreeNode?
     public init(_ val: Int) {
         self.val = val
         self.left = nil
         self.right = nil
     }
 }

var treeAns : [Int] = Array()

/*
 3. Longest Substring Without Repeating Characters

 Approach : We are trying to find the longest substring without repeating characters.
 Use the sliding window technique using two pointers to check for duplicates in the substring range.
 
 Time : O(n) because of sliding window iteration through character array
 Space: O(n) because of Array of characters needed to iterate characters.
 */

func lengthOfLongestSubstring(_ s: String) -> Int {
    var chars = Array(s)
    let count = chars.count
    if count == 1 || count == 0{
        return count
    }
    var head = 0
    var tail = 0
    
    var ans = 0
    
    var sub : Set<Character> = Set()
    while (tail < count) {
        // If the tail pointer is contained in the set, remove the head element from the set and inch the sliding window forward. For the edge case where the tail and tail-1 value are equal, the head will keep getting removed and the sliding window will shorten to a size of 1 element and restart from the duplicated value.
        if sub.contains(chars[tail]){
            sub.remove(chars[head])
            head += 1
        }else{
            // If the tail pointer is not contained in the set, insert it to the set, increase the tail of the sliding window by 1 to continue finding the largest substring.
            sub.insert(chars[tail])
            tail += 1
            let total = sub.count
            if total > ans{
                ans = total
            }
        }
    }
            
    return ans
}

/*
3. Longest substring without repeating character (medium)
Note : Solved again using a different approach (two pointers). Solved with relative ease, two compilations, and off by one mistake and syntax error.

Approach : Use two pointers and a set to identify longest substring with unique characters.
We will need a current length, longest string length, head and tail pointer(i and j).
Two pointers implementation usually uses tail pointer as outer loop.
Head pointer is used when some condition is invalid, in this problem's case. The invalid case is when a non unique variable is seen in the current substring. Increment the head pointer until the condition is valid again.

Time : O(n)
Space : O(1) if not counting string to character array pointer.

*/
func lengthOfLongestSubstring2(_ s: String) -> Int {
        let count = s.count
        if count <= 1{
            return count
        }
        var set : Set<Character> = Set()
        var str = Array(s)
        var i = 0
        var j = 0
        var longest = Int.min
        var length = 0
        while j < count{
            length += 1
            if set.contains(str[j]){
                while(set.contains(str[j])){
                    set.remove(str[i])
                    i+=1
                    length-=1
                }
            }else{
                longest = max(length,longest)
            }
            set.insert(str[j])
            j+=1
        }
         
        return longest
    }
/*
16. 3Sum Closest (medium) brute force
Approach : Calculate sum of all possible sum combinations of 3 numbers into a set to avoid duplicates.
Find the difference between the sum and target value by using absolute value of target - sum.
Note : Try solving again in a more optimal approach. Solved using a brute-force like approach for practice. Revisit again.

Time : O(n^3) due to 3 nested for loops.
Space : O(n) due to storing sums in a set

*/
func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        var sums : Set<Int> = Set()
        let count = nums.count
        for i in 0..<count{
            for j in i+1..<count{
                for k in j+1..<count{
                    let sum = nums[i] + nums[j] + nums[k]
                  //print("\(nums[i]), \(nums[j]), \(nums[k]) , sum : \(sum)")
                    sums.insert(sum)
                }
            }
        }
//      print(sums)
        
        var closest = Int.max
        var ans = 0
        for sum in sums{
            let diff = target-sum
            if abs(diff) < closest{
                closest = abs(diff)
                ans = sum
            }
        }
        
        
        return ans
    }

/*
17. Letter Combinations of a Phone Number

Approach : Create a 2d array map that contains the character set for each phone number. Make a function that retrieves the character set for an INT. Create a recursive function that solves the problem when visualizing the problem as a tree that branches off into a new leaf for each character combination. When the final recursive call or tail of the phone number is reached, add the answer to the answer.

Time: O(3^n x 4^m) where n is the number of digits in the input that maps to 3 letters. M is the number of digits in the input that maps to 4 letters.  n+m is the total number of digits in the input.
Space: O(3^n x 4^m) since one has to keep 3^n x 4^m solutions.


Note : Was able to solve the problem eventually on my own without cheating. It did take some time to think through and code up a solution but I broke it up and was successful.
Don’t really understand the time and space complexity for this problem, copied it from the solutions.

*/

    var map : [[Character]] =
    [
        ["a","b","c"],
        ["d","e","f"],
        ["g","h","i"],
        ["j","k","l"],
        ["m","n","o"],
        ["p","q","r","s"],
        ["t","u","v"],
        ["w","x","y","z"]
    ]
    
    var answer : [String] = []
    
        // Sets up helper recursive function that does all the work
    func letterCombinations(_ digits: String) -> [String] {
        answer = []
        if digits.count == 0{
            return answer
        }
        var chars = Array(digits)
        traverse(chars,0,"")
        return answer
    }
    
        
    func traverse(_ digits : [Character],_ i : Int,_ str : String)->Void{
        // When we reach the last digit, add the current string to the answer array. By this point the "str" parameter will be a unique and complete combination of characters.
        if i == digits.count{
            answer.append(str)
            return
        }else{
            let charSet = characterSetForDigit(digits[i])
            
                        // Loop through all possible characters for a number. For each character, call the function recursively.
                        // Visualize the problem as a tree that branches off into seperate recursive calls for each digit.
            for char in charSet{
                let newStr = str + String(char)
                traverse(digits,i+1,newStr)
            }
        }
        
    }
    
        // Retreives character set for a phone number digit from the predefined 2d array.
        // Use a 2d array that uses the (phone number - 2) as an index.
        // Values are character arrays that match a digit of a phone number
    func characterSetForDigit(_ digit : Character) -> [Character]{
        guard let num = Int(String(digit)), num > 1 && num < 10 else{
            return []
        }
        return map[num-2]
    }

/*
64. Minimum Path Sum

Approach : Calculate path sum using a bottom up approach.
Iterate through the matrix from bottom right to top left, row by row.
A point in the grid's path sum is itself + the minimum of its right or bottom point. The first coordinate in the grid will have the minimum path sum after iterating the grid using this algorithm.


Note : Had to read discussions solution but practiced coding it out for practice, understood concept after a while of digesting.

Time: O(n)
Space : O(n) for copy of grid. O(1) if using mutable 2d array instead.
*/

func minPathSum(_ grid: [[Int]]) -> Int {
        var g = grid
            let h = grid.count
        let w = grid[0].count
        for y in (0..<h).reversed(){
            for x in (0..<w).reversed(){
                let right = x+1
                let bottom =  y+1
                if (right < w && bottom < h){
                    g[y][x] += min(g[y+1][x],g[y][x+1])
                }else if(right < w){
                    g[y][x] += g[y][x+1]
                }else if (bottom < h){
                    g[y][x] += g[y+1][x]
                }
            }
        }
        return g[0][0]    
}


/*
94. Binary Tree Inorder Traversal
 Approach 1 : recursion
 Approach 2 :
 Code copied from tushar youtube video to understand morris traversal.
 Morris traversal, which mutates the binary tree and creates links between rightmost child in left subtree of a node to itself. Continues going left until left child is null.
 
 
 TODO : Try problem again after fully understanding morris traversal.
 
 */
func inorderTraversal(_ root: TreeNode?) -> [Int] {
    traverse(root)
    return treeAns
}

func traverse(_ root: TreeNode?) -> [Int]{
    var curr = root
    var arr : [Int] = Array()
    while curr != nil{
        if curr?.left == nil{
            arr.append(curr!.val)
            curr = curr?.right
        }else{
            var predecessor = findRightPredecessor(node: curr)
            if predecessor?.right == nil{
                predecessor?.right = curr
                curr = curr?.left
                
            }else{
                predecessor?.right = nil
                arr.append(curr!.val)
                curr = curr?.right
            }

        }
    }
    
    
    return arr
}

func findRightPredecessor(node : TreeNode?) -> TreeNode?{
    var pred : TreeNode? = node?.left
    while pred?.right != nil && (pred?.right !== node) {
        pred = pred?.right
    }
    return pred
}

let tree = TreeNode(8)
tree.left = TreeNode(4)
tree.right = TreeNode(9)
tree.left?.left = TreeNode(2)
tree.left?.right = TreeNode(6)
tree.left?.left?.left = TreeNode(1)
tree.left?.left?.right = TreeNode(3)
tree.left?.right?.left = TreeNode(5)
tree.left?.right?.right = TreeNode(7)

traverse(tree)

//let x = findRightPredecessor(node: tree)

/*
    36. Valid Sudoku
 
 Approach (initial thoughts): Validate every row and column and cube in a seperate hash set of characters
 
 Approach(cheating from nick white video): Create a single set of strings that contains row,column and cube identifiers
 - Was fairly simple to code out.
 
 Time Complexity : O(n * m)
 Space Complexity : O(n * m)
 */

func isValidSudoku(_ board: [[Character]]) -> Bool {
    var seen : Set<String> = Set()
    for (i,row) in board.enumerated(){
        for(j,col) in row.enumerated(){
            let str = board[i][j]
            if str == "."{
                continue
            }
            let r = "\(str),row \(i)"
            let c = "\(str),col \(j)"
            let cube = "\(str),cube\(i/3)\(j/3)"
            if seen.contains(r) || seen.contains(c) || seen.contains(cube){
                return false
            }else{
                seen.insert(r)
                seen.insert(c)
                seen.insert(cube)
            }
        }
    }
        return true
    }

