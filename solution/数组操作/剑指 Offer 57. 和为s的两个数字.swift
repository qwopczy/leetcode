class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var lo = 0,hi = nums.count-1
        while lo<hi {
            let sum = nums[lo] + nums[hi]
            if sum < target {
                    lo += 1
            }else if sum > target{
                    hi -= 1
                
            }else {
                               
//                let indexLo :Int = nums.firstIndex(of: numbers[lo])!
//                let indexHi :Int = nums.lastIndex(of: numbers[hi])!
                return [nums[lo],nums[hi]]
            }
        }
        
        return []

    }
}
