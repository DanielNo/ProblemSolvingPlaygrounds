import Foundation

public class Node : CustomStringConvertible{
    public var description: String
    
    public var value : Int
    public var next : Node?
    
    public init() {
        self.value = 0
        self.next = nil
        self.description = String(value)
    }
    
    public init(num : Int) {
        self.value = num
        self.description = String(value)
    }
    
    public func add(node : Node){
        self.next = node
    }
    
    public func printNode(){
        print(self.description)
    }
    
    static public func printAllValues(node : Node?){
        var curr = node
        var desc = ""
        while curr != nil {
            if desc == ""{
                desc = curr!.description
            }else{
                desc += ", \(curr!.description)"
            }
            curr = curr?.next
        }
        print("\(desc)")
    }
}
