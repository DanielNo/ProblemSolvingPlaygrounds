//: Playground - noun: a place where people can play

import UIKit
/*
709. To Lower Case
 Approach : Check if character's unicode value falls in range of A to Z. If so, add 32 which is the difference between character cases and overwrite character in the character array.
 Time complexity : o(n)
 space complexity : o(n) because I can't mutate given string and need to make a mutable character array using string parameter.
 
 Note : Difference between Capital and lower case ASCII values is 32. Be careful of optional values!
*/

func toLowerCase(_ str: String) -> String {
    var string = Array(str)
    for (i,char) in string.enumerated(){
        if let val = UnicodeScalar(String(char))?.value{
            if (val >= 65 && val <= 90){
                if let lowerVal = UnicodeScalar(val + 32){
                    string[i] = Character(lowerVal)
                }
            }
        }
    }
    return String(string)
}

let a = UnicodeScalar("a")
let z = UnicodeScalar("z")
let A = UnicodeScalar("A")
let Z = UnicodeScalar("Z")

let ans = toLowerCase("HELLO")

/*
747. Largest Number At Least Twice of Others

 Approach : Find the first and second largest numbers. Keep track of the greatest index. Compare first being at least twice as large as second, return greatest index or -1. Don't have to check edge case of nums.count being empty as specified by reading the question carefully.
 
 Time Complexity : O(n)
 Space Complexity : O(1)
 
 */
func dominantIndex(_ nums: [Int]) -> Int {
    let count = nums.count
    var first = 0
    var second = 0
    var firstIndex = 0
    for (index,num) in nums.enumerated(){
        if num > first{
            second = first
            first = num
            firstIndex = index
        }else if num > second{
            second = num
        }
        
    }
    return first >= (second * 2) ? firstIndex : -1
}

dominantIndex([0,0,2,3])
dominantIndex([1])

/*
 766. Toeplitz Matrix
 Input:
 matrix = [
   [1,2,3,4],
   [5,1,2,3],
   [9,5,1,2]
 ]
 Output: True

 Approach (cheated but understand it): Check if diagonal element in matrix is equal. Iterate through every element until the last row. This would be iterating through row-1 and column-1.
 
 Time : O(n*m)
 Space : O(1)
 */
var matrix =
  [[1,2,3,4],
   [5,1,2,3],
   [9,5,1,2]]

func isToeplitzMatrix(_ matrix: [[Int]]) -> Bool {
    for i in 0..<(matrix.count-1){
        for j in 0..<(matrix[i].count-1){
                if matrix[i][j] == matrix[i+1][j+1] {
//                    print("\(i)\(j)")
                    continue
                }else{
                    return false
                }
        }
    }
    return true
}

isToeplitzMatrix(matrix)

/* 771. Jewels and Stones : https://leetcode.com/problems/jewels-and-stones/description/
 You're given strings J representing the types of stones that are jewels, and S representing the stones you have.  Each character in S is a type of stone you have.  You want to know how many of the stones you have are also jewels.
 The letters in J are guaranteed distinct, and all characters in J and S are letters. Letters are case sensitive, so "a" is considered a different type of stone from "A".
 
 Input: J = "aA", S = "aAAbbbb"
 Output: 3
 Example 2:
 
 Input: J = "z", S = "ZZ"
 Output: 0
 S and J will consist of letters and have length at most 50.
 The characters in J are distinct.
 
 Approach : Take the larger string and enumerate character counts into a dictionary. For each character match of the smaller string in the larger string, increment a counter and return it.
 Time : O(n) linear
 Space : O(n) linear space
 */

func numJewelsInStones(_ J: String, _ S: String) -> Int {
    var stones : [Character : Int] = Dictionary()
    var sum = 0
    for (index,char) in S.enumerated(){
        stones[char] = stones[char] == nil ? 1 : stones[char]! + 1
    }
    for char in J.enumerated(){
        sum += stones[char.element]!
    }
    return sum
}
