/**
 * Definition for a binary tree node.
 * public
 */
//递归
class Solution101 {
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

    func isSymmetric(_ root: TreeNode?) -> Bool {
        return DFS(root?.left,root?.right)
      }

      
    func DFS(_ left:TreeNode?,_ right:TreeNode?) -> Bool {
        if left == nil && right == nil {
          return true
        }
       
        if left == nil ||  right == nil {
          return false
        }
        if left?.val != right?.val {
            return false
        }
        return  DFS(left?.left, right?.right) && DFS(left?.right, right?.left)
     }

    
    
}
