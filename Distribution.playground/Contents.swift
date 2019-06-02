import UIKit

var arr1 = ["A","D","G","I"]
var arr2 = ["B","E"]
var arr3 = ["C","F","H","J","K"]

var arr4 = ["A","D","G","J","M","P","S","V","Y","AB"]
var arr5 = ["B","E","H","K","N","Q","T","W"]
var arr6 = ["C","F","I","L","O","R","U","X","AA","AD","AE","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A"]


var full = [arr1,arr2,arr3]
var arr = full.flatMap {
    return $0
}
print(arr)

let count = full.count




func distributeBrute(arr1 : [String],arr2 : [String], arr3 : [String],size : Int) -> [String]{
    var greatest = 0
    var full = [arr1,arr2,arr3]
    var ans : [String] = Array()

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
                if iteration == size{
                 return ans
                }
            }
        }
    }
    return ans
}

//distributeBrute(arr1: arr1, arr2: arr2, arr3: arr3)
let distributed = distributeBrute(arr1: arr4, arr2: arr5, arr3: arr6,size: 10)
print(distributed)

let edge1 = ["a"]
let edge2 = ["b"]
let edge3 = ["c"]
let edgeAnswer1 = distributeBrute(arr1: edge1, arr2: edge2, arr3: edge3, size: 10)
print(edgeAnswer1)

