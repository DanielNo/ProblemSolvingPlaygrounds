import UIKit

/*
1431. Kids With the Greatest Number of Candies
Approach : Find the max value in array. Iterate through array and see if arr[I] + extraCandies >= max value

Time: O(n)
Space : O(n) for answer array, otherwise O(1)

*/
func kidsWithCandies(_ candies: [Int], _ extraCandies: Int) -> [Bool] {
    var max = candies.max() ?? 0
    var ans : [Bool] = Array()
    
    for (i,n) in candies.enumerated(){
        if n == max || n + extraCandies >= max{
            ans.append(true)
        }else{
            ans.append(false)
        }
    }
    return ans
}

/*
1450. Number of Students Doing Homework at a Given Time
Approach : Problem is very simple. Compare two numbers in both arrays in a for loop. Keep a counter of conditions that match.

Time : O(n)
Space : O(1)
*/

func busyStudent(_ startTime: [Int], _ endTime: [Int], _ queryTime: Int) -> Int {
    let count = startTime.count
    var busy = 0
    for i in 0..<count{
        let start = startTime[i]
        let end = endTime[i]
        if queryTime >= start && queryTime <= end{
            busy+=1
        }
         
    }
    return busy
}


/*
1460. Make Two Arrays Equal by Reversing Sub-arrays

 Approach (cheated): Problem is easier than initially thought. After looking at answers, being able to reverse any subarray an infinite number of times, allows us to manipulate the array into any order. Because of the ability to reverse subarrays infinitely, we just need to compare character(integers) counts of the arrays and check for equality.
 
 Time : O(n)
 Space : O(n)
 
*/
func canBeEqual(_ target: [Int], _ arr: [Int]) -> Bool {
    var dict : [Int : Int] = Dictionary()
    for num in target{
        if let val = dict[num]{
            dict[num] = val + 1
        }else{
            dict[num] = 1
        }
    }
    
    for num in arr{
        if let val = dict[num]{
            dict[num] = val - 1
        }else{
            dict[num] = -1
        }
    }
    
    for key in dict.keys{
        if let val = dict[key], val == 0{
            continue
        }else{
            print("false")
            return false
        }
    }
    
    return true
}



/*
1464. Maximum Product of Two Elements in an Array
Approach : Find first and second greatest elements in array. Subtract 1 from each value and return product. Pretty straightforward problem
Time : O(n)
Space : O(1)
*/

func maxProduct(_ nums: [Int]) -> Int {
    let count = nums.count
    if count == 2{
        return (nums[0]-1) * (nums[1]-1)
    }
    
    var first = 0
    var second = 0
    
    for (i,num) in nums.enumerated(){
        if num >= first{
            second = first
            first = num
        }else if num >= second{
            second = num
        }


    }
    return (first-1) * (second-1)
}
/*
1470. Shuffle the Array
Approach : Problem wants arr[x1,x2,x3,y1,y2,y3] to become alternating sequence : [x1,y1,x2,y2,x3,y3]
 To do this, I wrote the problem down and found a digestible pattern.
 For x values : Iterate the first half and write to index 0 and stride by 2 for x values
 For y values : iterate second half and stride by 2, starting at index 1
 
 Should be able to optimize by doing in place, but my solution was correct on first run.
 
 Time : O(n)
 Space : O(n)
 
 Approach (in place(cheated)) : Utilize bit manipulation
 Did not try because seems too complicated for now and not worth the effort to understand it. Maybe revisit.
 
 */
func shuffle(_ nums: [Int], _ n: Int) -> [Int] {
    let count = nums.count
    var arr = Array(repeating:0, count:count)
    
    var pos = 0
    for i in 0..<n{
        arr[pos] = nums[i]
        pos += 2
    }
    
    pos = 1
    for j in n..<count{
        arr[pos] = nums[j]
        pos += 2
    }
    
    return arr
}


/*
 1480. Running Sum of 1d Array

 Approach : Create a variable that will store the running sum. For each index, add number to sum and write to output array.
 
 Time : O(n)
 Space : O(n) for output array. Could be O(1) if mutating input array.
 */
func runningSum(_ nums: [Int]) -> [Int] {
    let count = nums.count
    var sum = 0
    var ans = Array(repeating: 0, count : count)
    for (i,n) in nums.enumerated(){
        sum += n
        ans[i] = sum
    }
    return ans
}

/*
1492. The kth Factor of n
Approach : Build an array with all factors. Return the kth factor by accessing array by index. Ex : 1st index should be arr[0] which is index k-1
Note : Consider edge cases carefully before executing code.
Time : O(n)
Space : O(n)

*/

func kthFactor(_ n: Int, _ k: Int) -> Int {
    var factors : [Int] = Array()
    if n > 1{
        for i in 1...n/2{
            if n % i == 0{
                factors.append(i)
            }
        }
    }
    factors.append(n)
    if factors.count < k{
        return -1
    }else{
        return factors[k-1]
    }
}

/*
1496. Path Crossing
Approach : Keep track of the x and y coordinate values. For each direction, increment or decrement the x or y variable. For each coordinate created from mutating the x and y values, store the coordinate as a string in a set. If there is a duplicate entry trying to be inserted into the set, we have a path cross.

Time: O(n) for loop on every character in the string
Space: O(n) for number of characters in string. For each character, a string would be stored in the set in the worst case.

*/


func isPathCrossing(_ path: String) -> Bool {
        var set : Set<String> = Set()
        set.insert("00")
        var x = 0
        var y = 0
        for (i,char) in path.enumerated(){
            switch(char){
            case "N":
                y+=1
            case "S":
                y-=1
            case "E":
                x+=1
            case "W":
                x-=1
            default:
                print("none")
            }
            let coord = "\(x)\(y)"
            if set.contains(coord){
                return true
            }else{
                set.insert(coord)
            }
        }
        return false
    }
