import UIKit

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
