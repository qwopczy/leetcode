/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

class Solution237 {
    func deleteNode(_ node: ListNode?) {
        if node?.next == nil {
            return
        }
        node?.val = node!.next!.val
        node?.next = node?.next?.next
    }
}
