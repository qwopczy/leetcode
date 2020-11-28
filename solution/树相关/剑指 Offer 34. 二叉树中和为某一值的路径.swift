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
    var resPath = [[Int]]()
    var path = [Int]()
    

    func pathSum(_ root: TreeNode?, _ sum: Int) -> [[Int]] {

        guard root != nil else {
            return []
        }

        pathSumDfs(root, sum)
        
        return resPath
    }
    //时间复杂度：O(N) ，这里 N 为二叉树的结点个数
    func pathSumDfs(_ root: TreeNode?, _ sum: Int)  {
        // 递归终止条件 1
        if root == nil {
            return
        }
        path.append(root!.val)
        let target = sum - root!.val
        if root?.left == nil && root?.right == nil {// 递归终止条件 2
            if target == 0 {
                resPath.append(path)
            }
        } else {
            pathSumDfs(root?.left, target)
            pathSumDfs(root?.right, target)
        }
        path.removeLast()
    }
}
