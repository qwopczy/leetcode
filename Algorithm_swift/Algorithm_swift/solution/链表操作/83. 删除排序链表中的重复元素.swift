
//  Definition for singly-linked list.
  
 
class Solution83 {
    class ListNode {
        public var val: Int
        public var next: ListNode?
        public init(_ val: Int) {
            self.val = val
            self.next = nil
        }
    }
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return nil
        }
        var slow = head,fast = head
        while fast != nil {
            if slow?.val != fast?.val {
                slow?.next = fast
                //slow ++
                slow = slow?.next
            }
            // fast++
            fast = fast?.next
        }
        slow?.next = nil
        return head
    }
}
