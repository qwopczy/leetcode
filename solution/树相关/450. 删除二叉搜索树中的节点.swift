/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func getMin(_ node: TreeNode) -> TreeNode {
//        bst 左边就是最小的
        var node = node
        
        while node.left != nil {
            node = node.left!
        }
        return node
    }
    func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {

        guard let root = root else { return nil }
        if root.val < key {
            root.right = deleteNode(root.right, key)
        }
        else if root.val > key {
            root.left = deleteNode(root.left, key)
        }else {
            //找到了要删除的节点。
            //如果左子树为空，我们只需要返回右子树即可
            if root.left == nil {
                return root.right
            }
            //如果右子树为空，我们只需要返回左子树即可
            if root.right == nil {
                return root.left
            }
            //说明两个子节点都不为空，我们可以找左子树的最大值，
            //也可以找右子树的最小值替换
           let minNode = getMin(root.right!)
          
            
            // var minNode = root.right!
            // // 一直向左找到最后一个左节点即可
            // while minNode.left != nil {
            //     minNode = minNode.left!
            // }
            root.val = minNode.val
            root.right = deleteNode(root.right, minNode.val)
            
            // 这个方式可能会导致一边太长
            /*
            var cur = root.right!
            // 一直向左找到最后一个左节点即可
            while cur.left != nil {
                cur = cur.left!
            }
            cur.left = root.left
            return root.right
            */
            //有两个子节点，麻烦了，为了不破坏 BST 的性质，A 必须找到左子树中最大的那个节点，或者右子树中最小的那个节点来接替自己。两种策略是类似的
            
            
        }
        return root
    }



}
