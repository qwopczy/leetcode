/**
 Definition for a Node.
 public
 
 */

class Solution117 {
    class Node {
        public var val: Int
        public var left: Node?
        public var right: Node?
          public var next: Node?
        public init(_ val: Int) {
            self.val = val
            self.left = nil
            self.right = nil
            self.next = nil
        }
    }

    
    func connect(_ root: Node?) -> Node? {
        guard let root = root else {
            return nil
        }
        var queue = [Node]()
        queue.append(root)
        while !queue.isEmpty {
            //每一层的数量
            var size = queue.count
            //记录前一个节点
            var pre:Node? = nil
            
            while size>0 {
                 //出队
                let node = queue.removeFirst()
                //如果pre为空就表示node节点是这一行的第一个，
                //没有前一个节点指向他，否则就让前一个节点指向他
                if pre != nil {
                    pre?.next = node
                }
                //然后再让当前节点成为前一个节点
                pre = node
                if node.left != nil {
                    queue.append(node.left!)
                }
                if node.right != nil {
                    queue.append(node.right!)
                }
                size -= 1
            }
            
        }
        
        return root
    }
}
