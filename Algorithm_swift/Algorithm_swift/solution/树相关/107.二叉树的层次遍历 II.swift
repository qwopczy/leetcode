/**
 * Definition for a binary tree node.
 *
 */
class Solution107 {
    class TreeNode {
        public var val: Int
        public var left: TreeNode?
        public var right: TreeNode?
        public init(_ val: Int) {
            self.val = val
            self.left = nil
            self.right = nil
        }
    }
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        var res = [[Int]]()
        if root == nil {
            return res
        }
        var queue = [TreeNode]()
        queue.append(root!)
        while !queue.isEmpty {
            var leverArr = [Int]()
            var size = queue.count
            while size > 0 {
                let node = queue.removeFirst()
                leverArr.append(node.val)
                
                if node.left != nil {
                    queue.append(node.left!)
                }
                if node.right != nil {
                    queue.append(node.right!)
                }
                size -= 1
            }
            res.append(leverArr)
        }
        
        
        return res.reversed()
    }
}
