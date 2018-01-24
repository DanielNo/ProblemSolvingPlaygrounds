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
}
