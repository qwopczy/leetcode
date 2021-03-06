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
    func invertTree(_ root: TreeNode?) -> TreeNode? {
       guard let root = root else {
           return nil;
       }
    
    let tmpRight = root.right;
    root.right = root.left;
    root.left = tmpRight;
    invertTree(root.left);
    invertTree(root.right);
    return root;

    }
}
