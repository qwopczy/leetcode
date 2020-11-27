/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var left: Node?
 *     public var right: Node?
 *       public var next: Node?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *         self.next = nil
 *     }
 * }
 */
/**
 *给定一个完美二叉树，其所有叶子节点都在同一层，每个父节点都有两个子节点。二叉树定义如下：
 *struct Node {
   int val;
   Node *left;
   Node *right;
   Node *next;
 }
 填充它的每个 next 指针，让这个指针指向其下一个右侧节点。如果找不到下一个右侧节点，则将 next 指针设置为 NULL。

 初始状态下，所有 next 指针都被设置为 NULL。

 */
class Solution {
    func connect(_ root: Node?) -> Node? {
        
        dfs(root,nil);
        return root;
    }
    func  dfs(_ current: Node?, _ next : Node?){
        guard let current = current  else{
            return;
        }
        current.next = next;
        dfs(current.left,current.right);
        dfs(current.right, current.next == nil ? nil:current.next?.left);



    }
}
