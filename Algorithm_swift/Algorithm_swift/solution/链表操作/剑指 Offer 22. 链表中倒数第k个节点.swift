/**
 * Definition for singly-linked list.
 *
 */
class SolutionOffer22 {
    class ListNode {
        public var val: Int
        public var next: ListNode?
        public init(_ val: Int) {
            self.val = val
            self.next = nil
        }
    }
    func getKthFromEnd(_ head: ListNode?, _ k: Int) -> ListNode? {
        var fast = head,slow = head
        for _ in 0..<k {
            fast = fast?.next
        }
        
        if fast == nil {
            // 如果此时快指针走到头了，
            // 说明倒数第 n 个节点就是第一个节点
            return head;
        
        }
        while fast != nil && fast?.next != nil {
            fast = fast?.next
            slow = slow?.next
        }
        
        // slow.next 就是倒数第 n 个节点
        return slow!.next!

    }
}
