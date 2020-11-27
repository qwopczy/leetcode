//给定一个二叉树和一个目标和，找到所有从根节点到叶子节点路径总和等于给定目标和的路径。

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
    
    //113 路径总和 II
    func pathSum(_ root: TreeNode?, _ sum: Int) -> [[Int]] {

        guard root != nil else {
            return []
        }

        pathSumDfs(root, sum)
        
        return resPath
    }
    func pathSumDfs(_ root: TreeNode?, _ sum: Int)  {
        if root == nil {
            return
        }
        path.append(root!.val)
        let target = sum - root!.val
        if root?.left == nil && root?.right == nil {
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
