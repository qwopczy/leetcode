/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */
class Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        // var result = [[Int]]()
        // if root == nil {
        //     return result
        // }
        // var queue = [TreeNode]()
        // queue.append(root!)
        
        // while !queue.isEmpty {
        //     var size = queue.count
        //     var levelArr = [Int]()
            
        //     while size > 0 {
        //         let node = queue.removeFirst()
        //         levelArr.append(node.val)
        //         if node.left != nil {
        //             queue.append(node.left!)
        //         }
        //         if node.right != nil {
        //             queue.append(node.right!)
        //         }
        //         size -= 1
        //     }
        //     result.append(levelArr)
            
        // }
        // return result
        var result = [[Int]]()
        if root == nil {
            return result
        }
        var queue = [TreeNode]()
        queue.append(root!)
        while !queue.isEmpty {
            var level = [Int]()
            var size = queue.count
            while size>0 {
                let node = queue.removeFirst()
                level.append(node.val)
                if node.left != nil {
                    queue.append(node.left!)
                }
                if node.right != nil {
                    queue.append(node.right!)
                }
                
                size -= 1
            }
            result.append(level)
            
        }
        
        return result
    }
}
