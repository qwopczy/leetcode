//滑动窗口
class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var res = 0
        var window = [Character:Int]()
        var left = 0, right = 0
        let sArr = Array(s)//[Character](s);
        while right < sArr.count{
            let addC = sArr[right];
            right += 1
            window[addC,default:0] += 1
            while window[addC] ?? 0 > 1 {
                let subC = sArr[left]
                left += 1
                window[subC]! -= 1
            }
            res = res > right - left ? res:right - left
        }
        
        return res;
    }
}
