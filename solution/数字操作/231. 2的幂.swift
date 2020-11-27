class Solution {
    func isPowerOfTwo(_ n: Int) -> Bool {
        if n <= 0 {//负数肯定不止一个 1
            return false
        }
        //2 的幂次方 有且仅有有个 1
        return (n&(n-1) == 0)
    }
}
