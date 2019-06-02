import UIKit

var arr1 = ["A","D","G","I"]
var arr2 = ["B","E"]
var arr3 = ["C","F","H","J","K"]

var full = [arr1,arr2,arr3]
var arr = full.flatMap {
    return $0
}

let count = full.count

var ans : [String] = Array()



func distributeBrute(arr1 : [String],arr2 : [String], arr3 : [String]) -> [String]{
    var greatest = 0
    var full = [arr1,arr2,arr3]
    var arr = full.flatMap {
        return $0
    }
    
    full.map { arr in
        if arr.count > greatest {
            greatest = arr.count
        }
    }
    var iteration = 0
    for x in 0..<greatest{
        for y in 0..<full.count{
            print(iteration)
            iteration += 1
            
            if x < full[y].count {
                ans.append(full[y][x])
            }
            
        }
    }
    return ans
}

distributeBrute(arr1: arr2, arr2: arr2, arr3: arr3)
