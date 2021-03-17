import UIKit

/*
 905. Sort Array By Parity
 Given an array A of non-negative integers, return an array consisting of all the even elements of A, followed by all the odd elements of A.
 
 You may return any answer array that satisfies this condition.
 
 Approach 1(trivial): Filter array for odd and even, and combine into new array. Not very efficient but very simple to implement.
 
 Approach 2: In place swap. Took a few submissions for edge cases using while loop. After cheating, learned the question is solvable with a for loop. TODO : attempt with a for loop
 
 */

func sortArrayByParity(_ A: [Int]) -> [Int] {
    var nums = A
    var i = 0
    var j = nums.count-1
    while i < j{
        if nums[i]%2 == 0 {
            i+=1
        }else if(nums[j]%2 == 0){
            let temp = nums[i]
            nums[i] = nums[j]
            nums[j] = temp
            j-=1
            i+=1
        }else{
            j-=1
        }
    }
    return nums
}
sortArrayByParity([3,1,2,4,6,9,4,2,1,0,7])
//sortArrayByParity([1,3])

/*
 917. Reverse Only Letters
 
 Approach : Use two pointers to iterate through array and find letters to swap.
 From head and tail indicies, perform a check if the character is a letter by comparing unicode/ascii values. A new function was created in the swift library that does this for us.
 
 Time : O(n)
 Space : O(1)
 
 */

func reverseOnlyLetters(_ S: String) -> String {
    var j = S.count-1
    var i = 0
    var str = Array(S)
    while i < j{
        if str[i].isLetter == false{
            i+=1
            continue
        }
        
        while (str[j].isLetter == false){
            j-=1
        }
        let temp = str[i]
        str[i] = str[j]
        str[j] = temp
        i+=1
        j-=1
    }
    return String(str)
}


/*
 922. Sort Array By Parity II
 Approach : iterate through array and check current element if it is in right place(odd value at odd index, even value at even index).
 If not at correct place, use second pointer to find next opposite value(even vs odd) and perform a swap.
 Time : O(n^2)
 Space : O(1)
 Note : attempt again using stride by 2 approach
 */
func sortArrayByParityII(_ A: [Int]) -> [Int] {
    var a = A
    var j = 0
    for i in 0..<a.count-1{
        j = i+1
        // even
        if i % 2 == 0{
            if a[i] % 2 == 0{
                continue
            }else{
                while a[j] % 2 == 1{
                    j+=1
                }
                let temp = a[i]
                a[i] = a[j]
                a[j] = temp
            }
            
            
            // odd
        }else{
            if a[i] % 2 == 0{
                while a[j] % 2 == 0{
                    j+=1
                }
                let temp = a[i]
                a[i] = a[j]
                a[j] = temp
                
                
            }else{
                continue
            }
            
            
        }
    }
    return a
}

/*
929. Unique Email Addresses
Approach : The dot characters means it should be stripped
The + character means it should only consider characters before the + character and the suffix of @domain.com
First step is to separate the email into user and domain name components by splitting by "@" character. Keep a reference to the domain for later.
Strip the + character from the user name, then strip the "." characters from that.
Append the stripped user name and the domain name to find the correct email address to forward to.

Note: I solved the problem in a simple to code manner without trying to optimize. Should be room to optimize based on the performance and memory shown after submitting.
TIme : O(n m) where n is the number of input emails. M is the length of characters in the input emails
Space : O(n) for set of unique emails.

*/
func numUniqueEmails(_ emails: [String]) -> Int {
        var uniqueEmails : Set<String> = Set()
         
        for (i,email) in emails.enumerated(){
            var comps = email.components(separatedBy:"@")
             
            guard var user = comps.first else{
                continue
            }
            user = stripPlusSign(user).replacingOccurrences(of:".", with: "")
            guard var domain = comps.last else{
                continue
            }
             
            uniqueEmails.insert("\(user)@\(domain)")
             
        }
         
        return uniqueEmails.count
    }
     
     
    func stripPlusSign(_ str : String)->String{
        if str.contains("+"){
            let comps = str.components(separatedBy:"+")
            return comps.first!
        }
        return str
    }

/*
953. Verifying an Alien Dictionary
Approach : Make a dictionary that contains the order for each character.
Iterate each character of two adjacent words. Check the order indices of adjacent word's characters.
There are edge cases to consider carefully such as shorter length string, matching letters followed by a sorted/unsorted comparison.

Time:
Space: O(1), a constant space of 26 characters in a map.

*/
func isAlienSorted(_ words: [String], _ order: String) -> Bool {
        var orderDict : [Character : Int] = Dictionary()
        
        for (i,c) in order.enumerated(){
            orderDict[c] = i
        }
        print(orderDict)


        for i in 0..<words.count-1{
            if isSorted(words[i],words[i+1],orderDict){
                continue
            }else{
                return false
            }
            
        }
        return true
    }
    
    func isSorted(_ s1 : String,_ s2 : String,_ orderDict : [Character : Int]) -> Bool{
        let c1 = s1.count
        let c2 = s2.count
        let shorterString = c1 < c2 ? s1 : s2
        let longerString = c1 < c2 ? s2 : s1
        let chars1 = Array(s1)
        let chars2 = Array(s2)
        var i = 0
        while i < shorterString.count{
            if let l1 = orderDict[chars1[i]], let l2 = orderDict[chars2[i]]{
                if l1 < l2{
                    return true
                }else if (l1 == l2){
                    i+=1
                    continue
                }else{
                    return false
                }
            }else{
                return false
            }
        }
        if c1 < c2{
            return true
        }else{
            return false
        }
        
    }



/*
 961. N-Repeated Element in Size 2N Array
 In a array A of size 2N, there are N+1 unique elements, and exactly one of these elements is repeated N times.
 Return the element repeated N times.
 
 Example 1:
 Input: [1,2,3,3]
 Output: 3
 
 Approach : Use a set. Because there are N+1 unique elements, this means all are unique minus the element that is repeated. Use a set to find the duplicate. Ex : 2N array where n = 2, array count = 4 and unique elements = 3 where 1 of the three elements is repeated twice (n times)
 Time : O(n)
 Space : O(n)
 
 */
func repeatedNTimes(_ A: [Int]) -> Int {
    var set : Set<Int> = Set()
    for (i,num) in A.enumerated(){
        if set.contains(num){
            return num
        }else{
            set.insert(num)
        }
    }
    return 0
}


/*
 977. Squares of a Sorted Array
 Look at this problem again..
 
 */

func sortedSquares(_ A: [Int]) -> [Int] {
    // put in thought process in repo, cheated
    var arr = Array(repeating:0, count:A.count)
    var head = 0
    var tail = A.count-1
    var pos = A.count-1
    
    while (pos >= 0){
        if (abs(A[head]) >= abs(A[tail])){
            arr[pos] = A[head] * A[head]
            head+=1
        }else{
            arr[pos] = A[tail] * A[tail]
            tail-=1
        }
        pos-=1
    }
    
    return arr
}
