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
    //dfs
    // func maxDepth(_ root: TreeNode?) -> Int { //递归
    //     if root == nil {
    //         return 0
    //     }
    //     var leftInt : Int = maxDepth(root?.left) + 1
    //     var rightInt :Int = maxDepth(root?.right) + 1
    //     return leftInt > rightInt ? leftInt :rightInt

    // }
    //bfs
    func maxDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        var queue = [TreeNode]()
        queue.append(root!)
        var ans = 0
        while !queue.isEmpty{
            var size = queue.count
            while size > 0{
                let node = queue.removeFirst()
                if node.left != nil{
                    queue.append(node.left!)

                }
                if node.right != nil{
                    queue.append(node.right!)

                }
                size -= 1;

            }
            ans += 1

        }
        return ans

    
    }


}
