import UIKit

/*
347. Top K Frequent Elements
*/
var dict : [Int : Int] = Dictionary()


func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
    var ans = [0]
    var freq = frequencyDict(nums)
    var freqArr = Array(freq.keys)
    print(freqArr)
    partition(&freqArr, left: 0, right: 1, pivot: 2)
    return ans
}

func partition(_ freqs : inout [Int], left : Int, right : Int, pivot : Int) -> Void{
    
    
}

func swap(_ arr : inout [Int], i : Int, j : Int){
    let temp = arr[i]
    arr[i] = arr[j]
    arr[j] = temp
}

func frequencyDict(_ nums : [Int]) -> [Int : Int]{
    
    for num in nums{
        if let val = dict[num]{
            dict[num] = val + 1
        }else{
            dict[num] = 1
        }
    }
    print(dict)
    return dict
}


topKFrequent([1,1,1,2,2,3], 2)

