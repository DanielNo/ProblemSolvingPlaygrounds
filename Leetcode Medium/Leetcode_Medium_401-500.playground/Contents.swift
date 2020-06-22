import UIKit

/*
 495. Teemo Attacking
Approach : Find the time overlap between values in the array. Add the full duration if the difference is greater than the duration, or add the difference if the difference is less than the duration

Time : O(n)
Space :  O(1)
*/
   
func findPoisonedDuration(_ timeSeries: [Int], _ duration: Int) -> Int {
    let count = timeSeries.count
    var sum = duration
    if count == 1{
        return duration
    }
    if count == 0{
        return 0
    }
    
    for i in 0..<count-1{
        let time = timeSeries[i]
        let next = timeSeries[i+1]
        let diff = next-time
        
        let m = min(duration,diff)
        sum += m
    }
    return sum
}
