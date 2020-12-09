import UIKit

/*
1570. Dot Product of Two Sparse Vectors

Approach : Question is asking for a sum of all products of array elements at the same index. Sparse vector means the vector can contain many zeroes. Not sure how this helps other than to skip computation when a 0 is seen. Because multiplying any number by zero will return 0, this is a small optimization in computations done.

Note: Not sure why this is marked "medium" when it is the highest acceptance rate problem and the question is trivial...

Time : O(n) for loop iteration is linear
Space : O(n) store sparse vector in instance of SparseVector class

*/
class SparseVector {
    public var nums : [Int]
    init(_ nums: [Int]) {
        self.nums = nums
    }
    // Return the dotProduct of two sparse vectors
    func dotProduct(_ vec: SparseVector) -> Int {
        var sum = 0
         
        for (i,n) in vec.nums.enumerated(){
            let val1 = self.nums[i]
            if val1 == 0 || n == 0{
                continue
            }
            sum += (val1 * n)
        }
         
        return sum
    }
}
