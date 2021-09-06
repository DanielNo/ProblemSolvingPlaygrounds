import UIKit

/*
1190. Reverse Substrings Between Each Pair of Parentheses
Approach : Use a 2d Array as it were a stack. One array will contain the contents of a set of parenthesis.
When an opening parenthesis is iterated, we add an array to the stack and append items to the last element. When a closing parenthesis is encountered, we remove the last element from the stack, and append the contents to the 2nd last element after reversing it.

Note : This approach was designed by myself and may not be the most optimal, but it worked after a few debug runs and index out of bound errors. Shoulld review again.

Time: O(n)
Space: O(n)
*/

func reverseParentheses(_ s: String) -> String {
        var stack : [[Character]] = [[]]
        for (i,c) in s.enumerated(){
            if(c == "("){
                stack.append([])
            }else if(c == ")"){
                if stack.count > 1{
                    let last = stack.removeLast()
                    let rev = Array(last.reversed())
                    let end = stack.endIndex
                    stack[end-1].append(contentsOf:rev)
                }else{
                    let end = stack.endIndex
                    stack[end-1] = stack[end-1].reversed()
                }
            }else{
                let end = stack.endIndex-1
                stack[end].append(c)
            }
        }
        return String(stack[0])
    }

/*
 1198. Find Smallest Common Element in All Rows
 
 Approach : Brute force two nested loops will iterate through the entire matrix.
 Create a dictionary to store frequencies of elements.
 Since the matrix is sorted, doing a linear iteration of the matrix will yield the minimum common element first, before the other common elements.
 We iterate the matrix, while iterating we store frequencies. The first matching frequency will be the answer.
 
 Note : Even though we use nested loops in code, in a matrix it is basically linear time complexity. There may be a more optimal solution but this one is good enough and very simple to code. Not worthy of a medium for this version of code.
 
 Time : O(nm) where n and m is height and width of matrix
 Space : O(mn)
 
 */

func smallestCommonElement(_ mat: [[Int]]) -> Int {
    var freqDict : [Int : Int] = [:]
    let count = mat.count
    for(y,row) in mat.enumerated(){
        for (x,col) in row.enumerated(){
            let num = mat[y][x]
            freqDict[num] = freqDict[num,default:0] + 1
            if freqDict[num] == count{
                return num
            }
        }
    }
    return -1
}
