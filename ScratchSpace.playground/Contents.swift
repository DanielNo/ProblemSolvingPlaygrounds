import UIKit
import Foundation

let str = "abcdefghijklmnopqrstuvwxyz"
let arr = Array(str)

for (i,c) in arr.enumerated(){
    let val = c.asciiValue! - 97
    print(val)
}
let chars = Array(str)
