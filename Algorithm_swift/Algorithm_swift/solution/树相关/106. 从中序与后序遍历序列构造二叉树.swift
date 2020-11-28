/**
 Definition for a binary tree node.
 public
  例如，给出

 中序遍历 inorder = [9,3,15,20,7]
 后序遍历 postorder = [9,15,7,20,3]   树中没有重复的元素。

 返回对应的二叉树：
 */

class Solution106 {
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

    
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        return build(postorder, 0, postorder.count - 1, inorder, 0, inorder.count - 1)
    }
    
    func build
    (_ postorder: [Int],_ postStart: Int,_ postEnd: Int,
     _ inorder: [Int], _ inStart: Int ,_ inEnd: Int ) -> TreeNode? {
        if postStart > postEnd  {
            return nil;
        }
        let rootVal =  postorder[postEnd];
        var treeNode : TreeNode = TreeNode(rootVal);


        var inRootIndex = 0;
        for i in inStart...inEnd {
            if inorder[i] == rootVal {
                inRootIndex = i;
                break
            }
        }
        var leftSize = inRootIndex - inStart;


        

        treeNode.left = build(postorder, postStart ,postStart+leftSize-1, inorder,inStart,inRootIndex-1);

        treeNode.right = build(postorder,postStart+leftSize,postEnd-1, inorder,inRootIndex + 1,inEnd)

        return treeNode;


    
    }
}
