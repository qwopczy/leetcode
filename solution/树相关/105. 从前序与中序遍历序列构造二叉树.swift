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
/**
 *根据一棵树的前序遍历与中序遍历构造二叉树。
 前序遍历 preorder = [3,9,20,15,7]
 中序遍历 inorder = [9,3,15,20,7]
  返回二叉树

 */
class Solution {
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        return build(preorder, 0, preorder.count - 1, inorder, 0,inorder.count - 1)
    }
    func build
    (_ preorder: [Int],_ preStart: Int,_ preEnd: Int,
     _ inorder: [Int], _ inStart: Int ,_ inEnd: Int ) -> TreeNode? {
        if preStart > preEnd  {
            return nil;
        }
        let rootVal =  preorder[preStart];

        var inRootIndex = 0;
        for i in inStart...inEnd {
            if inorder[i] == rootVal {
                inRootIndex = i;
                break
            }
        }
        var leftSize = inRootIndex - inStart;


        var treeNode : TreeNode = TreeNode(rootVal);

        treeNode.left = build(preorder, preStart + 1,preStart+leftSize, inorder,inStart,inRootIndex-1);

        treeNode.right = build(preorder,preStart+leftSize+1,preEnd, inorder,inRootIndex + 1,inEnd)

        return treeNode;


    
    }
}
