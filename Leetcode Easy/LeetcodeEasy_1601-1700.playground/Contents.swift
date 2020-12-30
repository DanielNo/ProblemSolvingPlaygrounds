import UIKit

/*
1603. Design Parking System

 Approach : Create a dictionary that will store counts of free parking spots for each type. Array can be used also but rarely if ever see arrays used like that in production code.
 
 Time : O(1)
 Space : O(n)

*/
class ParkingSystem {
    var spots : [Int : Int] = [:]
    init(_ big: Int, _ medium: Int, _ small: Int) {
        spots[1] = big
        spots[2] = medium
        spots[3] = small
    }
    
    func addCar(_ carType: Int) -> Bool {
        if let val = spots[carType], val > 0{
            spots[carType] = val-1
            return true
        }
        return false
    }
}
