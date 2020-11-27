class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        // if nums.count == 0 {
        //     return 0
        // }
        // var slow = 0;
        // for fast in 1..<nums.count {
        //     if nums[slow] != nums[fast] {
            
        //         slow += 1
        //         nums[slow] = nums[fast];
        //     }
        // }
        // return slow + 1
        if nums.count == 0 {
            return 0
        }
        var slow = 0,fast = 0
        while fast<nums.count {
            if nums[slow] != nums[fast] {
                slow += 1
                nums[slow] = nums[fast]
            }
            fast += 1
        }
        
        return slow + 1

    }
}
