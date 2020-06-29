import UIKit
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
