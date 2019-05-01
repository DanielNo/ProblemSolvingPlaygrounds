//: Playground - noun: a place where people can play

import UIKit

func generateRandomChar() -> Character{
    let letters = Array("abcdefghijklmnopqrstuvwxyz")
    let count = letters.count
    let numbers = "0123456789"
    let letterOrNumber = Int(arc4random_uniform(2))
    if letterOrNumber == 0 {
        return Character(String(arc4random_uniform(9)))
    }else{
        let rand = Int(arc4random_uniform(26))
        return letters[rand]
    }
    
}

func generateNumbersNoDupes(num : Int, max : Int) -> [Int]{
    var arr = [Int]()
    arr.reserveCapacity(max)
    var size = max
    var count = 0
    
    for i in 0..<max{
     arr.append(i)
    }
    
    while size != num {
        let num = UInt32(size)
        let x = random(num: num)
        print(x)
        arr[size-1] = 0
        
        size -= 1
    }
    

    return arr
}

func random(num : UInt32) -> Int{
let rand = Int(arc4random_uniform(num))
return rand
}


generateNumbersNoDupes(num: 50, max: 100)
