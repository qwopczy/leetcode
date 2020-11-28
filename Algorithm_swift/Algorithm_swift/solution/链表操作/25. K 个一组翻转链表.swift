/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution25 {
    class ListNode {
        public var val: Int
        public var next: ListNode?
        public init() { self.val = 0; self.next = nil; }
        public init(_ val: Int) { self.val = val; self.next = nil; }
        public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    }
    func reverseNode(_ a: ListNode?,_ b: ListNode?) -> ListNode? {
        var cur = a;
        var pre:ListNode? = nil
        while cur !== b {
            let next = cur?.next
            cur?.next = pre
            pre = cur
            cur = next
            
        }
        return pre
        
    }
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        if head == nil {
            return nil
        }
        var a = head,b = head
        for _ in 0..<k {
            if b == nil {
                return head
            }
            b = b?.next
        }
        
        let newHead = reverseNode(a, b)
        a?.next = reverseKGroup(b, k)
        
        return newHead
        
    }
}
