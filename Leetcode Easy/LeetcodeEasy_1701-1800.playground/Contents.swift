import UIKit
/*



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
