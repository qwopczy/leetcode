//给你一个数组 nums 和一个值 val，你需要 原地 移除所有数值等于 val 的元素，并返回移除后数组的新长度。 #快慢指针

class Solution27 {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        
        //
        
        
        if nums.count == 0 {
            return 0
        }
        var slow = 0,fast = 0
        while fast<nums.count {
            if nums[fast] != val {
                nums[slow] = nums[fast]
                slow += 1
            }
            fast += 1
        }
        
        return slow
        
        // if nums.count == 0{
        //     return 0
        // }
        // var left = 0
        // var right = nums.count
        // while left < right {
        //     if nums[left] == val {
        //         right -= 1
        //         nums[left] = nums[right]
                
        //     } else {
        //         left += 1
        //     }
        // }
        // return left

    }
}
