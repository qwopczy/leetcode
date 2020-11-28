/**
 * Definition for singly-linked list.
 *
 */
class Solution876 {
    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init(_ val: Int) {
            self.val = val
            self.next = nil
        }
    }
    func middleNode(_ head: ListNode?) -> ListNode? {
        var fast = head,slow = head
        while fast?.next != nil && fast?.next?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
        }
        if fast?.next != nil {
            slow = slow?.next
        }
        return slow
    }
}
