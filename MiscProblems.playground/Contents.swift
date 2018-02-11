//: Playground - noun: a place where people can play

import UIKit

//Fibonacci Sequence with memoization xD
var memo = {
    return [0 : 0, 1 : 1]
}()

func fibonacci(num : Int) -> Int{
    if num < 0 {
        return memo[0]!
    }
    if memo[num] == nil{
        memo[num] = fibonacci(num: num - 1) + fibonacci(num: num - 2)
    }
    
    return memo[num]!
}

fibonacci(num: 40)
