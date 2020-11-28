/**
 Definition for a binary tree node.
 public
  */
/**
 *给定一棵二叉树，返回所有重复的子树。对于同一类的重复子树，你只需要返回其中任意一棵的根结点即可。

 两棵树重复是指它们具有相同的结构以及相同的结点值。
 */
class Solution652 {
    class TreeNode {
        public var val: Int
        public var left: TreeNode?
        public var right: TreeNode?
        public init() { self.val = 0; self.left = nil; self.right = nil; }
        public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
        public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
            self.val = val
            self.left = left
            self.right = right
        }
    }

    
    // var map : Dictionary<String, Int> ;
    
    var map:Dictionary<String,Int> = [:]
    
    var duplicateArr:[ TreeNode ] = []
    
    func findDuplicateSubtrees(_ root: TreeNode?) -> [TreeNode?] {
        traverse(root);
        return duplicateArr;
    }

    func traverse(_ root : TreeNode?) -> String {
        if root == nil {
            return "#";
        }
        let leftStr = traverse(root?.left )
        let rightStr = traverse(root?.right)
        let subTree = leftStr + "," + rightStr + "," + String(root?.val ?? 0);
        

        var  freq = 0;
        
        if let stateCode = map[subTree] {
            freq = stateCode ;
        }
        
         
        
        

        if freq == 1 {
            duplicateArr.append(root!)
        }
         map[subTree] = freq + 1;
        
        return subTree;

    }
}
