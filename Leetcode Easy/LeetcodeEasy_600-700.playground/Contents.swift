//: Playground - noun: a place where people can play

import UIKit

/* 682. Baseball Game

 
 */

// TODO : Solve this
let input1 = ["5","2","C","D","+"]
let input2 = ["36","28","70","65","C","+","33","-46","84","C"]
let input3 = ["5","-2","4","C","D","9","+","+"]
let answer1 = 30
let answer2 = 219
let answer3 = 27
func calPoints(_ ops: [String]) -> Int {
    let count = ops.count
    var first = 0
    var second = 0
    var third = 0
    var total = 0
    
    
    for i in 0..<count{
        let move = ops[i]
        third = second
        if let score = Int(move){
            second = first
            first = score
            total += first
            print("\(score) - \(total), first : \(first), second : \(second))")
        }else{
            if(move == "D"){
                second = first
                first = first * 2
                total += first
                print("D - \(total), first : \(first), second : \(second))")
                
            }else if(move == "C"){
                total -= first
                first = second
                print("C - \(total), first : \(first), second : \(second))")
                
            }else if(move == "+"){
                let temp = first
                first = first + second
                second = temp
                total += first
                print("+ - \(total), first : \(first), second : \(second))")
            }
            
            
            
            
        }
    }
    
    return total
}
