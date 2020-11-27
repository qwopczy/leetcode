//给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。 #快慢指针
class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        if nums.count < 1 {
            return
        }
        let numIndex = removeElement(&nums, 0)
        for i in numIndex..<nums.count {
            nums[i] = 0
        }
    }
    // 移除元素
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {

        var slow = 0,fast = 0
        while fast<nums.count {
            if nums[fast] != val {
                nums[slow] = nums[fast]
                slow += 1
            }
            fast += 1
        }
        
        return slow
    }
}
