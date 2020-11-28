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
//利用哨兵对象
class Solution203 {
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        
        
        //非递归 有哨兵
        
        let dummyHead = ListNode(0);
        dummyHead.next = head;
        var cur  = dummyHead
        while cur.next != nil {
            if cur.next?.val == val {
                var tmpDelect = cur.next
                cur.next = cur.next?.next
                tmpDelect = nil
            } else {
                cur = cur.next!
            }
        }
        return dummyHead.next;



    }
}
