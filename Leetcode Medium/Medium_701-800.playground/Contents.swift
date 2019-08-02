import UIKit

// 791. Custom Sort String

// First attempt
func customSortString(_ S: String, _ T: String) -> String {
    var dict : [Character : Int] = Dictionary()
    
    var count = 0
    for letter in S{
        if dict[letter] == nil{
            dict[letter] = count
            count += 1
        }
    }
    let head = T.filter { (c) -> Bool in
        dict[c] != nil
        }.sorted { (a, b) -> Bool in
            return dict[a]! < dict[b]!
    }
    let tail = T.filter { (c) -> Bool in
        dict[c] == nil
    }
    
    
    return String(head+tail)
}

// Second attempt using bucket sort
func customSortStringBucket(_ S: String, _ T: String) -> String {
    var bucket : [Character : Int] = Dictionary()
    var tail = ""
    for char in S{
        if bucket[char] == nil {
            bucket[char] = 0
        }
    }
    for char in T{
        if(bucket[char] == nil){
            tail.append(char)
        }else{
            bucket[char] = bucket[char]! + 1
        }
    }
    var head = ""
    for char in S{
        for count in 0..<bucket[char]!{
            head.append(char)
        }
    }
    return head + tail
}


customSortString("cbaed", "wabcdebcdecdeadedceabbaw")
customSortStringBucket("cbaed", "wabcdebcdecdeadedceabbaw")
