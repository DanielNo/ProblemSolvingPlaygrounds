import UIKit

/*
 419. Battleships in a Board
 Approach (mine) : Iterate through board, and overwrite visited battleships to a different character. Continue looking for unvisited in mutable matrix and keep track of counter.
 Note for my approach: Didn't work because the overwritted values were not being iterated through. Tried debugging order of operations, and using index based iteration of the matrix instead of enumerated function. Not sure how to fix and cannot identify problem... Maybe its an array copy issue?
 
 Approach (cheated) : Find top left most value that is a ship character. Increment by 1 if so, otherwise do not increment. Basically increment only the first AND top left most value.
 Note : Apparently after looking at solutions, can solve using DFS. Look into that solution and revisit.
 My solution's time complexity sucks? Try a more optimal approach when more comfortable with medium problems.
 
 Time : O(nm) where n and m are rows and columns of matrix
 Space : O(1)
 */

func countBattleships(_ board: [[Character]]) -> Int {
    var ships = 0
    let cols = board.count
    let rows = board[0].count
    
    
    for y in 0..<cols{
        for x in 0..<rows{
            print("hello")
            if board[y][x] == "X"{
                if y == 0 && x != 0{
                    if board[y][x-1] == "X"{
                        continue
                    }else{
                        ships+=1
                    }
                    
                }else if x == 0 && y != 0{
                    if board[y-1][x] == "X"{
                        continue
                    }else{
                        ships+=1
                    }
                    
                    
                }else if(x == 0 && y == 0){
                    ships+=1
                }else{
                    if board[y][x-1] == "X" || board[y-1][x] == "X"{
                        continue
                    }else{
                        ships+=1
                    }
                }
            }
            
            
        }
    }
    return ships
}

/*
487. Max Consecutive Ones II

Approach : Use two pointers to maintain a sliding window with members that contain no more than 1 zero.
Increase the window when the number is 1.
If number is zero, increment the zero counter and if the number of zeros in the window is greater than 1. We decrease the size of the window until it is valid again. In this case, the window is valid when the number of zeros is <= 1.

Note : Solved the problem version III before solving this one. Answer is pretty similiar so I was able to solve this problem without too much difficulty, no cheating and with help of a few run and adjust fixes.

Time : O(n)
Space : O(1)

*/

func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        var zeros = 0
        var i = 0
        var ans = Int.min
        for (j,num) in nums.enumerated(){
            if num == 0{
                zeros += 1
            }
            while zeros > 1{
                if nums[i] == 0{
                    zeros -= 1
                }
                i+=1
            }
            ans = max(ans,j-i+1)
        }
        
        return ans
    }

/*
 495. Teemo Attacking
 Approach : Find the time overlap between values in the array. Add the full duration if the difference is greater than the duration, or add the difference if the difference is less than the duration
 
 Time : O(n)
 Space :  O(1)
 */

func findPoisonedDuration(_ timeSeries: [Int], _ duration: Int) -> Int {
    let count = timeSeries.count
    var sum = duration
    if count == 1{
        return duration
    }
    if count == 0{
        return 0
    }
    
    for i in 0..<count-1{
        let time = timeSeries[i]
        let next = timeSeries[i+1]
        let diff = next-time
        
        let m = min(duration,diff)
        sum += m
    }
    return sum
}
