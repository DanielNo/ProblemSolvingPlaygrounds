import UIKit

/*
1119. Remove vowels from a string

Approach : Create a string buffer that contains only non vowels. Iterate input string, if its not a vowel, append it to the string buffer.

Time: O(n)
Space : O(n) worst case if all not vowels.

*/


func removeVowels(_ S: String) -> String {
        var ans = ""
        for(i,c) in S.enumerated(){
            if (c == "a" || c == "e" || c == "i" || c == "o" || c == "u"){
                continue
            }else{
                ans.append(c)
            }
        }
        return ans
    }
