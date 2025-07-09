import UIKit
/*
1768. Merge Strings Alternately

Approach: Create a empty string ("") character/string array and overwrite the values so we have the complete merged string that is alternating. 
Iterate through the values in a while loop.
Initially I used a single counter, which was wrong and skipped some iterations. Took a little hint from solutions to use two pointers, and I was able to get it easily.

Mini cheating:
Looked up:
- String to String array = map function
- String array to string = joined()

Time Complexity: O(n + m) where n and m are lengths of each word
Space Complexity: O(n + m) which is the space of the String array


*/
    func mergeAlternately(_ word1: String, _ word2: String) -> String {
        let chars1 = word1.map { String($0) }
        let chars2 = word2.map { String($0) }


        let limit1 = chars1.count
        let limit2 = chars2.count

        var answer = Array(repeating:"", count: limit1 + limit2)
        let max = limit1 + limit2
        var i = 0
        var j = 0
        while (i + j < max) {
            if i < limit1 {
                answer[i+j] = chars1[i]
                i += 1
            }
            if j < limit2 {
                answer[i+j] = chars2[j]
                j += 1
            }
        }
        let answerString = answer.joined()
        return answerString
    }
