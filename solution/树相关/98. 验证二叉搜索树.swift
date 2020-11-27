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
    func isValidBST(_ root: TreeNode?) -> Bool {
        if root == nil {return true}
        return isValidBSTHelp(root, nil, nil);
    }
    func isValidBSTHelp(_ root: TreeNode?,_ min :TreeNode?,_ max :TreeNode?) -> Bool {
        if root == nil {return true}
        if (min != nil)  && (root!.val <= min!.val) {
            return false
        }
        if (max != nil)  && (root!.val >= max!.val)  {
            return false
        }
        return isValidBSTHelp(root?.left, min, root) && isValidBSTHelp(root?.right, root, max)
    }
}
