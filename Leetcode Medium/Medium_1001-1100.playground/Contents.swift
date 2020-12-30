import UIKit

/*
 1100. Find K-Length Substrings With No Repeated Characters

 Approach : Create a sliding window and keep a record of seen characters. Increase the size until the window is of length K. Decrease the window from the left by incrementing the left pointer when the current character is a duplicate in our set.
 Ex :
 arr = A B C A D E
 Window = A > A B > A B C > A B C A > B C A > B C A D > B C A D E
 
 Note: had to take a peek at solutions, should try to solve again after some time.
 Time: O(n)
 Space: O(k)
 */

func numKLenSubstrNoRepeats(_ S: String, _ K: Int) -> Int {
    var set : Set<Character> = Set()
    var chars = Array(S)
    var j = 0
    var ans = 0
    for (i,c) in chars.enumerated(){
        while (set.contains(c)){
            set.remove(chars[j])
            j+=1
        }
        set.insert(c)
        if i-j+1 == K{
            ans += 1
            set.remove(chars[j])
            j+=1
        }
        
    }
    return ans
}
