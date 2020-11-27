/**
 给你一个整数数组 nums 和一个整数 k。

 如果某个 连续 子数组中恰好有 k 个奇数数字，我们就认为这个子数组是「优美子数组」。

 请返回这个数组中「优美子数组」的数目。

 */

//运用滑动窗口
class Solution {
    func numberOfSubarrays(_ nums: [Int], _ k: Int) -> Int {
        if nums.count < 1{
            return 0
        }
        var res = 0,left = 0,right = 0,oldCnt = 0;
        while right < nums.count {
            // 右指针先走，每遇到一个奇数则 oddCnt++。
            if nums[right] & 1 == 1 {
                oldCnt += 1
            }
            right += 1
            if oldCnt == k {//若当前滑动窗口 [left, right) 中有 k 个奇数了，进入此分支统计当前滑动窗口中的优美子数组个数
                
                // rightEvenCnt 即为第 k 个奇数右边的偶数的个数
                let tmp = right
                while right < nums.count && nums[right] & 1 == 0  {
                    right += 1
                }
                let rightEventCnt = right - tmp
                
                var leftEventCnt = 0
                
                while nums[left] & 1 == 0 {
                    leftEventCnt += 1
                    left += 1
                }
                
                /*
                 // 第 1 个奇数左边的 leftEvenCnt 个偶数都可以作为优美子数组的起点
                                 // (因为第1个奇数左边可以1个偶数都不取，所以起点的选择有 leftEvenCnt + 1 种）
                                 // 第 k 个奇数右边的 rightEvenCnt 个偶数都可以作为优美子数组的终点
                                 // (因为第k个奇数右边可以1个偶数都不取，所以终点的选择有 rightEvenCnt + 1 种）
                                 // 所以该滑动窗口中，优美子数组左右起点的选择组合数为 (leftEvenCnt + 1) * (rightEvenCnt + 1)

                 */
                res += (rightEventCnt+1) * (leftEventCnt+1)
                
                left += 1
                oldCnt -= 1
                
            }
            
        }
        return res;
        
    }
}
