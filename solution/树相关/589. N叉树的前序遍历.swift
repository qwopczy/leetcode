/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var children: [Node]
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.children = []
 *     }
 * }
 */

class Solution {
     //递归
    var duplicateArr:[ Int ] = []
    func preorder(_ root: Node?) -> [Int] {
        helper(root)
        return duplicateArr

    }
    func helper(_ root: Node?) {
        if root == nil {
            return
        }
        duplicateArr.append(root!.val )
        for node in root!.children {
            helper(node)
        }
    }
// 非递归
/*
    var duplicateArr:[Int] = []
    func preorder(_ root: Node?) -> [Int] {
        if root == nil {
            return []
        }
        var resultList:[Int] = []
        var queue : [Node] = [root!]
        while queue.count != 0 {
            let node = queue.removeFirst()//FIFO
            resultList.append(node.val)
            for nodechild in node.children {
                queue.append(nodechild)
            }
            
        }
        return resultList

    }
    */
}
