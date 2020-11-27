class Solution {
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        if nums.count<1 {
            return 0
        }
        var ans = 0, preNums = 0
        //前缀和 -> 该前缀和出现的次数
        var preSumMap = [0:1]
        for i in 0..<nums.count {
            preNums += nums[i]
            if (preSumMap[preNums - k] != nil) {
            
                ans = preSumMap[preNums - k]! + ans//目前 num 为 i 的数 加上之前 ans 累计的数
            }
            if preSumMap[preNums]  != nil{
                preSumMap[preNums]! += 1
            } else {
                preSumMap[preNums] = 1;
            }
        }
        return ans

    }
}
