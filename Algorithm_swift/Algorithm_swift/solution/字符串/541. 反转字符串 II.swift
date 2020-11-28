//左右指针
class Solution541 {
    func reverseStr(_ s: String, _ k: Int) -> String {
        var sArr = Array(s)
        var i = 0;
        
        while i<sArr.count {
            var left = i;
            var right = i+k-1
            right = right < sArr.count ? right:sArr.count-1;
            while left < right {
                sArr.swapAt(left, right)
                left += 1
                right -= 1
            }
            i += 2*k
        }
            
            
        return String(sArr)
    }
}
