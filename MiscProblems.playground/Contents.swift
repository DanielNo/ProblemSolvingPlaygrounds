//: Playground - noun: a place where people can play

import UIKit

//Fibonacci Sequence with memoization xD
var memo = {
    return [0 : 0, 1 : 1]
}()

func fibonacci(num : Int) -> Int{
    if num <= 0 {
        return memo[0]!
    }
    if memo[num] == nil{
        memo[num] = fibonacci(num: num - 1) + fibonacci(num: num - 2)
    }
    
    return memo[num]!
}

// Fibonacci with pattern matching
func swiftyFib(num : Int) -> Int{
    switch num {
    case _ where num <= 0:
        return memo[0]!
    case 1:
        return memo[1]!
    default:
        if memo[num] == nil{
            memo[num] = swiftyFib(num: num - 1) + swiftyFib(num: num - 2)
        }
        return memo[num]!
    }
}

//fibonacci(num: 90)
swiftyFib(num: 90)
