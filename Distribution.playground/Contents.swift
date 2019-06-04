import UIKit
func distributeContent(arr1 : [String],arr2 : [String], arr3 : [String],size : Int) -> [String]{
    if size <= 0{
        return [String]()
    }
    var full = [arr1,arr2,arr3]
    full.sort { (a, b) -> Bool in
        return a.count > b.count
    }
    let greatest = full.first?.count ?? 0
    
    var topStories : [String] = Array()
    var iteration = 0
    for x in 0..<greatest{
        for y in 0..<full.count{
            if x < full[y].count {
                iteration += 1
                topStories.append(full[y][x])
                if iteration == size{
                    print("iterations : \(iteration)")
                 return topStories
                }
            }
        }
    }
    return topStories
}


var case1 = ["A","D","G","I"]
var case2 = ["B","E"]
var case3 = ["C","F","H","J","K"]
let distributed1 = distributeContent(arr1: case1, arr2: case2, arr3: case3, size: 10)


var case4 = ["A","D","G","J","M","P","S","V","Y","AB"]
var case5 = ["B","E","H","K","N","Q","T","W"]
var case6 = ["C","F","I","L","O","R","U","X","AA","AD","AE","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A"]
let distributed2 = distributeContent(arr1: case4, arr2: case5, arr3: case6,size: 10)



let edge1 = ["a"]
let edge2 = ["b"]
let edge3 = ["c"]
let edgeCase1 = distributeContent(arr1: edge1, arr2: edge2, arr3: edge3, size: -1)


let edge4 : [String] = Array()
let edgeCase2 = distributeContent(arr1: edge4, arr2: edge4, arr3: edge4, size: 10)
let edgeCase5 = distributeContent(arr1: edge4, arr2: edge4, arr3: case1, size: 10)


let edge5 = ["a"]
let edge6 = ["b","d"]
let edge7 = ["c","e","f"]
let edgeCase3 = distributeContent(arr1: edge5, arr2: edge6, arr3: edge7, size: 10)
let edgeCase4 = distributeContent(arr1: edge7, arr2: edge6, arr3: edge5, size: 10)

