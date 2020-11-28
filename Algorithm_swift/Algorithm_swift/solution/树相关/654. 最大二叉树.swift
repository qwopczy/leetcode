/**
 * Definition for a binary tree node.
 * public  */
class Solution654 {
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

    func constructMaximumBinaryTree(_ nums: [Int]) -> TreeNode? {
        return build(nums,0,nums.count-1);
    }
    func build(_ nums: [Int],_ low :Int,_ hi : Int ) -> TreeNode?{
        guard low <= hi else{
            return nil
        }

        var index = -1;
        var max = Int.min;

        for i in low...hi {
            if max < nums[i]{
                max = nums[i]
                index = i
            }
        }

        var tree = TreeNode.init(max);
        tree.left = build(nums,low,index - 1);
        tree.right = build(nums,index+1,hi);
        return tree




    }
}
