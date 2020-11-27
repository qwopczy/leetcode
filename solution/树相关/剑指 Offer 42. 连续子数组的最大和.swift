class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var dp_res = nums[0]
        var dp: [Int] = Array(repeating: 0, count: nums.count)
        dp[0] = nums[0]
        for i in 1..<nums.count {
            dp[i] = max(dp[i-1]+nums[i],nums[i])
            if dp[i] > dp_res {
                dp_res = dp[i]
            }
        }
        return dp_res

    }
}
