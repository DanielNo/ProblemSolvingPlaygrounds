import Foundation

public class ListNode {
  
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
  
  public func desc() -> String{
      var str = String(self.val)
      var node = self
      while node.next != nil {
          node = node.next!
          str+="->\(String(node.val))"
      }
      return str
  }
    
}
