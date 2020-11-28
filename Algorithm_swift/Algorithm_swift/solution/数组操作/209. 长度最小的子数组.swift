//滑动窗口
class Solution209 {
    func minSubArrayLen(_ s: Int, _ nums: [Int]) -> Int {
        var low = 0,high = 0,min = Int.max,sum = 0;
        while high < nums.count {
            
            sum += nums[high]
            high += 1
           
            while sum >= s{
                min = min<high-low ? min:high-low
                sum -= nums[low]
                low += 1

                
            }
        }
        return min == Int.max ? 0 : min;

    }
}
