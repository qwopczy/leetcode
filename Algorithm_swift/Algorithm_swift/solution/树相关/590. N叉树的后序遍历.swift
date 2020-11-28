/**
 * Definition for a Node.
 * public
 */
//bfs
class Solution590 {
    class Node {
        public var val: Int
        public var children: [Node]
        public init(_ val: Int) {
            self.val = val
            self.children = []
        }
    }

    func postorder(_ root: Node?) -> [Int] {
        if root == nil {
            return [Int]()
        }

        var resultList: [Int] = [Int]()
        
        var stack: [Node] = [root!]
        while stack.count != 0 {
            let rootNode: Node = stack.removeLast()//LIFO性质。最后翻转
            resultList.append(rootNode.val)
            /// 添加所有子节点
            for node in rootNode.children {
                stack.append(node)
            }
         }
        
        return resultList.reversed()
    }

    
}
