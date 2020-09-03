//: Playground - noun: a place where people can play

import UIKit

/*
 811. Subdomain Visit Count
 
 Example 2:
 Input:
 ["900 google.mail.com", "50 yahoo.com", "1 intel.mail.com", "5 wiki.org"]
 Output:
 ["901 mail.com","50 yahoo.com","900 google.mail.com","5 wiki.org","5 org","1 intel.mail.com","951 com"]
 Explanation:
 We will visit "google.mail.com" 900 times, "yahoo.com" 50 times, "intel.mail.com" once and "wiki.org" 5 times. For the subdomains, we will visit "mail.com" 900 + 1 = 901 times, "com" 900 + 50 + 1 = 951 times, and "org" 5 times.
 
 Approach : Split the question into subproblems. First subproblem is to split the count and domain strings. Second subsproblem is to split the domain into subdomains and store the counts in a dictionary. Third subproblem is to create a string array from keys and values in the dictionary storing the counts and domains.
 
 Time Complexity : O(n)
 Space Complexity : O(n)
 
 */

let input1 = ["9001 discuss.leetcode.com"]
let input2 = ["900 google.mail.com", "50 yahoo.com", "1 intel.mail.com", "5 wiki.org"]
let domain1 = "google.mail.com"

func subdomainVisits(_ cpdomains: [String]) -> [String] {
    var domainVisits = [String : Int]()
    var answer = [String]()
    for domain in cpdomains{
        
        findSubDomains(domain: domain, domainVisits: &domainVisits)
    }
    
    for key in domainVisits.keys{
        answer.append(String(domainVisits[key]!) + " " + key)
    }
    return answer
}

func findSubDomains(domain : String, domainVisits : inout [String : Int]){
    var domainComponents = domain.components(separatedBy: " ")
    var domainCount = Int(domainComponents[0])!
    let fullDomain = domainComponents[1]
    var subdomainCount = 0
    for char in domainComponents[1]{
        if char == "." {
            subdomainCount += 1
        }
    }
    
    let components = fullDomain.components(separatedBy: ".")
    var allDomains : [String] = []
    allDomains.append(fullDomain)
    if subdomainCount == 2 {
        allDomains.append(components[1]+"."+components[2])
        allDomains.append(components[2])
        
    }
    if subdomainCount == 1 {
        allDomains.append(components[1])
    }
    
    for aDomain in allDomains{
        if domainVisits[aDomain] == 0 || domainVisits[aDomain] == nil {
            domainVisits[aDomain] = domainCount
        }else{
            domainVisits[aDomain] = domainVisits[aDomain]! + domainCount
        }
    }
    
}
subdomainVisits(input2)

/*
819. Most Common Word

Approach : Create a frequency dictionary and a banned word set. Lowercase and strip all non letter and space characters in the string to create a word array that we can process.
Use a set to improve performance while checking if word is in banned word list.
Create two greatest variables, one for greatest occurrences and one for the most frequent word. Do this to avoid another linear scan of the frequency dictionary.

*/

func mostCommonWord(_ paragraph: String, _ banned: [String]) -> String {
        let words = paragraph.split{ !$0.isLetter }.map{
            return $0.lowercased()
        }
        
        var bannedSet = Set(banned)
        var freqDict : [String : Int] = Dictionary()
        var greatest = 0
        var ans = ""
        
        for word in words{
            if bannedSet.contains(word){
                continue
            }else{
                if let val = freqDict[word]{
                    let newVal = val+1
                    freqDict[word] = newVal
                    if newVal > greatest{
                        greatest = newVal
                        ans = word
                    }
                }else{
                    freqDict[word] = 1
                    if greatest == 0{
                        greatest = 1
                        ans = word
                    }
                }
            }
        }
        
        return ans
    }


/* 830. Positions of Large Groups
 
 Time Complexity : O(n)
 Space Complexity : O(1)
 */

func largeGroupPositions(_ S: String) -> [[Int]] {
    let count = S.count
    var ans = [[Int]]()
    if count < 3{
        return ans
    }
    var current = String(S.first!)
    var currentCount = 0
    var currentIndex = 0
    for (index,char) in S.enumerated(){
        let c = String(char)
        if c == current{
            currentCount += 1
        }else{
            if currentCount >= 3 {
                ans.append([currentIndex,index-1])
            }
            currentCount = 1
            currentIndex = index
            current = c
        }
        
        if index == count-1{
            if currentCount >= 3 {
                ans.append([currentIndex,index])
            }
        }
        //        print("\(current) : \(currentCount)")
    }
    return ans
}
let large0 = "aaa"
let large1 = "abbxxxxzzy"
let large2 = "abc"
let large3 = "abcdddeeeeaabbbcd"
//largeGroupPositions(large0)
largeGroupPositions(large1)
//largeGroupPositions(large2)
//largeGroupPositions(large3)

/* 832. Flipping an Image
 Approach : Reverse each array, then run a for loop on each number and perform a bitwise XOR ^ to flip 0 into 1 and 1 into 0
 1 ^ 1 = 0
 0 ^ 1 = 1
 
 Time Complexity : O(n) Although we have nested for loops, execution will be O(n) because we are only iterating through all elements of the array.
 Space Complexity : O(1), using an extra array pointer here because function parameters in swift are immutable unless marked inout.
 
 */

func flipAndInvertImage(_ A: [[Int]]) -> [[Int]] {
    var nums = A
    for (i,arr) in nums.enumerated(){
        for (j,num) in arr.reversed().enumerated(){
            nums[i][j] = num ^ 1
        }
    }
    return nums
}
let case1 = [[1,1,0],[1,0,1],[0,0,0]]
let case2 = [[1,1,0,0],[1,0,0,1],[0,1,1,1],[1,0,1,0]]

flipAndInvertImage(case1)

/*
 867. Transpose Matrix
 
 Approach : A transpose is a matrix with it's columns placed as rows
 Iterate through the matrix, and write the values into a new matrix.
 
 Time : O(n * m) Nested for loop, but we are iterating through every element in the matrix. Where n is number of rows, and m is number of columns
 Space : O(n * m)
 
 */
func transpose(_ A: [[Int]]) -> [[Int]] {
    guard let x = A.first?.count else{
        return []
    }
    let y = A.count
    
    var ans : [[Int]] = Array()
    for i in 0..<x{
        var arr : [Int] = Array()
        for j in 0..<y{
            arr.append(A[j][i])
        }
        ans.append(arr)
    }
    
    return ans
}

/*
 876. Middle of the Linked List
 
 Approach (non optimal): iterate through the linked list to get the count of nodes. Iterate again until counter reaches half, do some math on whether the middle is even or not to return the correct node.
 
 Approach (optimal) : Iterate through the linked list with two pointers. One slow and one fast. When fast is nil, we know that slow is at the middle of the linked list.
 
 Note: I initially thought of this approach but remembered that linked list problems can be solved with two pointers.
 Was able to code optimal approach in first compile and submission!
 
 Time : O(n)
 Space : The space required for two pointers on the linked list. Should be constant space or linear, not sure.
 */

func middleNode(_ head: ListNode?) -> ListNode? {
    var slow = head
    var fast = head?.next
    
    while (fast != nil){
        slow = slow?.next
        fast = fast?.next?.next
    }
    return slow
}
