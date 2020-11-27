
class Solution {
    func mySqrt(_ x: Int) -> Int {
        if x == 0 || x == 1 {
            return x
        }
        var left = 1,right = x, res = 0
        while left<=right  {
            let mid = left + (right-left)/2
            
            if mid == x/mid {
                return mid
            }else if mid > x/mid
            {
                right = mid-1
            }else{
                left = mid+1
                res = mid
            }
        }
        return res
        
        
    }
}
