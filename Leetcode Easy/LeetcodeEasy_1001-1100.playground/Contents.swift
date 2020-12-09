import UIKit

/*
1099. Two Sum Less Than K
Approach : Use same approach as:
167. Two Sum II- Input array is sorted
To use the same approach, we must sort the input array
Then use the same two pointers approach, one pointer at beginning, one pointer at end

Note : Cheated and found out that the i < j limitation does not prevent us from sorting.
a[i] + a[j] == a[j] + a[i] which means the limitation is that i != j

Time: O(n log n)
Space : O(n) for sorted and filtered input array

*/


func twoSumLessThanK(_ A: [Int], _ K: Int) -> Int {
    var nums = A.filter{
        $0 < K
    }.sorted()
    var i = 0
    var j = nums.count - 1
    var maxSum = -1
    while i < j{
        let sum = nums[i] + nums[j]
        if(sum < K){
            maxSum = max(maxSum,sum)
            i+=1
        }else if(sum >= K){
            j-=1
        }
    }
    return maxSum
}
