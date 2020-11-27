public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
class MyLinkedList {
    var size : Int;
    var head :ListNode;
    

    /** Initialize your data structure here. */
    init() {
        head = ListNode(0)//哨兵对象 前哨节点为伪头
        size = 0;
    }
    
    /** Get the value of the index-th node in the linked list. If the index is invalid, return -1. */
    func get(_ index: Int) -> Int {
        if index >= size || index < 0{
            return -1
        }
        var cur = head;
        for _  in 0...index {
            cur = cur.next!
        }
        
        return cur.val
    }
    
    /** Add a node of value val before the first element of the linked list. After the insertion, the new node will be the first node of the linked list. */
    func addAtHead(_ val: Int) {
        addAtIndex(0, val)
    }
    
    /** Append a node of value val to the last element of the linked list. */
    func addAtTail(_ val: Int) {
        addAtIndex(size, val)
    }
    
    /** Add a node of value val before the index-th node in the linked list. If index equals to the length of linked list, the node will be appended to the end of linked list. If index is greater than the length, the node will not be inserted. */
    func addAtIndex(_ index: Int, _ val: Int) {
        if index > size || index < 0{
            return
        }
//        if index < 0 {
//
//        }
        size += 1
        var prev = head
        for _ in 0..<index{
            prev = prev.next!
        }
        let addNode = ListNode(val)
        addNode.next = prev.next
        prev.next = addNode
        
    }
    
    /** Delete the index-th node in the linked list, if the index is valid. */
    func deleteAtIndex(_ index: Int) {
        if index >= size || index < 0{
            return
        }
        size -= 1
        var prev = head
        for _ in 0..<index {
            prev = prev.next!
        }
        prev.next = prev.next?.next
        
    }
}

/*
//双向链表
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public var prev: ListNode?
    public init(_ val: Int) {
        self.val = val
    }
}
class MyLinkedList {
    var size : Int;
    var head :ListNode;
    var tail :ListNode;
    

    /** Initialize your data structure here. */
    init() {
        head = ListNode(0)//哨兵对象 前哨节点为伪头
        tail = ListNode(0)
        size = 0;
        head.next = tail
        tail.prev = head
    }
    
    /** Get the value of the index-th node in the linked list. If the index is invalid, return -1. */
    func get(_ index: Int) -> Int {
        if index >= size || index < 0{
            return -1
        }
        var cur = head;
        if index + 1 < size - index {
            for _  in 0...index {
                cur = cur.next!
            }
        } else {
            cur = tail;
            for _  in 0...(size - index) {
                cur = cur.prev!
            }
        }
        
        
        return cur.val
    }
    
    /** Add a node of value val before the first element of the linked list. After the insertion, the new node will be the first node of the linked list. */
    func addAtHead(_ val: Int) {
        let pred :ListNode = head
        let succ:ListNode = head.next!
        size += 1
        let toAdd = ListNode(val)
        toAdd.prev = pred
        toAdd.next = succ
        pred.next = toAdd
        succ.prev = toAdd

    }
    
    /** Append a node of value val to the last element of the linked list. */
    func addAtTail(_ val: Int) {
        let pred :ListNode = tail
        let succ:ListNode = tail.prev!
        
        size += 1
        let toAdd = ListNode(val)
        toAdd.prev = pred
        toAdd.next = succ
        pred.next = toAdd
        succ.prev = toAdd

    }
    
    /** Add a node of value val before the index-th node in the linked list. If index equals to the length of linked list, the node will be appended to the end of linked list. If index is greater than the length, the node will not be inserted. */
    func addAtIndex(_ index: Int, _ val: Int) {
        if index > size || index < 0{
            return
        }

        var pred :ListNode
        var succ:ListNode;
        if index < (size-index) {
            pred = head

            for _ in 0..<index {
                pred = pred.next!
            }
            succ = pred.next!
        } else {
            succ = tail
            
            for _ in 0..<(size-index) {
                succ = succ.prev!
            }
            pred = succ.prev!
        }
        
        
        size += 1
        let toAdd = ListNode(val)
        toAdd.prev = pred
        toAdd.next = succ
        pred.next = toAdd
        succ.prev = toAdd
        
        
        
    }
    //查找要删除的节点的前任和后继
    /** Delete the index-th node in the linked list, if the index is valid. */
    func deleteAtIndex(_ index: Int) {
        if index >= size || index < 0{
            return
        }
        
        
        var pred :ListNode
        var succ:ListNode;
        if index < (size-index) {
            pred = head

            for _ in 0..<index {
                pred = pred.next!
            }
            succ = pred.next!.next!
        } else {
            succ = tail
            
            for _ in 0..<(size-index-1) {
                succ = succ.prev!
            }
            pred = succ.prev!.prev!
        }
        
        size -= 1
        pred.next = succ
        succ.prev = pred
        
    }
}*/
/**
 * Your MyLinkedList object will be instantiated and called as such:
 * let obj = MyLinkedList()
 * let ret_1: Int = obj.get(index)
 * obj.addAtHead(val)
 * obj.addAtTail(val)
 * obj.addAtIndex(index, val)
 * obj.deleteAtIndex(index)
 */
