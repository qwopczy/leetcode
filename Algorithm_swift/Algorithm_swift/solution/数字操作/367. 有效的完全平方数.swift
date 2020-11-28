
class Solution367 {
    func isPerfectSquare(_ num: Int) -> Bool {
        if num == 0 || num == 1 {
            return true
        }
        var left = 1, right = num
        while left <= right {
            let mid = left + (right-left)/2
            if mid*mid == num {
                return true
            }else if mid*mid > num{
                right =  mid - 1
            }else{
                left =  mid + 1
            }
             
        }
        return false
    
    }
}
