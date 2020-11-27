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
class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        //双指针法
        
        if head == nil || head?.next == nil{
                return head
            }
        var cur = head, pre : ListNode? = nil
            
        while cur != nil {
            let tmpNext = cur?.next
            cur?.next = pre
            pre = cur
            cur = tmpNext
                
        }
        return pre

        //递归 2
        // if head == nil || head?.next == nil {
        //     return head
        // }
        // ////! 前面反转好的
        // let res = reverseList(head?.next)
        // //! 当前结点的下一个结点指向自己
        // head?.next?.next = head
        // //! 自己的 next 置为nil
        // head?.next = nil
        // return res
        

    }
    //递归 1
    // func reverse(_ pre : ListNode?,_ cur: ListNode?) -> ListNode? {
    //     if cur == nil {
    //        return nil;
    //     }
    //     var tmp = cur?.next
    //     cur?.next = pre
    
    //     return reverse(cur, tmp)
    

    // }
}
