import UIKit

/*
 695. Max Area of Island
 
 Approach : This problem is nearly the same as the original island problem. The twist here is adding a max variable.
 Create a grid DFS function that searches all neighboring grid points. In this case, an island is either top bottom left or right from a point. We have a return value that is an Integer. If the coordinates are invalid, return 0. Or if the value of the grid point is valid and is equal to zero, then we return zero because it is not part of the island.
 When a grid point is "seen", we overwrite the value as zero so we dont repeat our checks on neighbors as part of the island.
 Add up the values and store in a max variable.
 
 Note: Was pretty easy to solve, after putting in about 10-15 mins of coding.
 Have to be careful of off by 1 errors
 
 Time: O(n m) where n/m are number of rows and columns in grid
 Space: O(1) if not counting the copy of the grid due to the setup of the initial function(not mutable)
 
 */

func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
    var g = grid
    var maxArea = 0
    
    for (y,row) in grid.enumerated(){
        for(x,col) in row.enumerated(){
            if g[y][x] == 1{
                let area = traverse(&g,x,y)
                maxArea = max(area,maxArea)
            }
        }
    }
    return maxArea
}

func traverse(_ grid: inout [[Int]], _ x : Int, _ y : Int) -> Int{
    let rows = grid.count
    let cols = grid[0].count
    if x > cols-1 || y > rows-1 || x < 0 || y < 0 {
        return 0
    }
    let val = grid[y][x]
    if val == 0{
        return 0
    }else{
        grid[y][x] = 0
        let right = traverse(&grid,x+1,y)
        let left = traverse(&grid,x-1,y)
        let top = traverse(&grid,x,y+1)
        let bottom = traverse(&grid,x,y-1)
        return 1 + right + left + top + bottom
    }
}
