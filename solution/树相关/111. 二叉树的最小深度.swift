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
    func minDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        var queue = [TreeNode]()
        queue.append(root!)
        var ans = 0
        while !queue.isEmpty {
            var size = queue.count
            ans += 1
            while size > 0 {
                let node = queue.removeFirst()
                if node.left == nil && node.right == nil {
                    return ans
                }
                if node.left != nil {
                    queue.append(node.left!)
                }
                if node.right != nil {
                    queue.append(node.right!)
                }
                size -= 1
            }
            
            
        }
        
        return ans
        // if root == nil {
        //     return 0
        // }
        // if root?.left == nil {
        //     return 1 + minDepth(root?.right)
        // }
        // if root?.right == nil {
        //     return 1 + minDepth(root?.left)
        // }
        // let leftMin = minDepth(root?.left)
        // let rightMin = minDepth(root?.right)
        // return leftMin<rightMin ? leftMin+1 : rightMin+1

    }
}
