public class ListNode {
  public var val: Int
  public var next: ListNode?
  public init() { self.val = 0; self.next = nil; }
  public init(_ val: Int) { self.val = val; self.next = nil; }
  public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
    ListNode(from: Array(
            lists
            .compactMap { $0?.asArray() }
            .joined()
        ).sorted()
    )
}

extension ListNode {
    public func asArray() -> [Int] {
        var result = [self.val]
        var nextNode: ListNode? = self.next
        while let node = nextNode {
            result.append(node.val)
            nextNode = node.next
        }
        return result
    }

    public convenience init?(from array: [Int]) {
        guard let first = array.first else {
            print("cannot init from empty array")
            return nil
        }
        self.init(first)
        
        if array.count > 1 {
            var head = ListNode(array[1]) 
            self.next = head
            for value in array[2...] {
                head.next = ListNode(value)
                head = head.next!
            }
        }
    }
}

let node1 = ListNode(1)
let node2 = ListNode(4)
let node3 = ListNode(5)

node1.next = node2
node2.next = node3
