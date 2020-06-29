import UIKit

// Typically used for finding pairs in a sorted array. Here for example, we are searching for a target sum of two numbers, which is a pair of numbers.
func twoPointers(_ arr : [Int], target : Int) -> (Int,Int){
    var i = 0
    var j = arr.count-1
    
    while i < j{
        let sum = arr[i] + arr[j]
        if sum == target{
            return (i,j)
        }else if(sum > target){
            j-=1
        }else if(sum < target){
            i+=1
        }
        
    }
    return (0,0)
}



// Partition a list given a value, with elements less than value on left, and greater than value on right



func partitionArray(_ arr : [Int], topK : Int)->[Int]{
    var a = arr
    let count = a.count
    let rank = rankOfRandomElement(arr)
    
    for i in 0..<count{
        if i < rank{
            
        }else if i > rank{
            
        }else{
            
        }
        print(rank)
    }
    
    return a
}

func rankOfElement(_ arr : [Int], val : Int) -> Int{
    var rank = -1
    if !arr.contains(val){
        return rank
    }
    
    for num in arr{
        if num <= val{
            rank += 1
        }
        
    }
    return rank
}


func rankOfRandomElement(_ arr : [Int]) -> Int{
    var rank = 0
    let randomK = arr[Int.random(in: 0..<arr.count)]

    for num in arr{
        if num < randomK{
            rank+=1
        }    }
    print("\(arr) \ncount : \(arr.count)")
    print("The rank of \(randomK) is : \(rank)")
    return rank
}

func swapVals(_ arr : inout [Int], i : Int, j : Int){
    let temp = arr[i]
    arr[i] = arr[j]
    arr[j] = temp
}
var arr1 = [3,55,12,200,43]

//rankOfElement(arr1, val: 200)
partitionArray(arr1, topK: 5)
