/**
 给定一个非负整数 num。对于 0 ≤ i ≤ num 范围中的每个数字 i ，计算其二进制数中的 1 的数目并将它们作为数组返回。
 */
class Solution338 {
    func countBits(_ num: Int) -> [Int] {
        var resArr = [Int]()
        for var value in 0...num {
            var count = 0
            
            while value != 0 {
                value = value&(value-1)
                count += 1
            }
            resArr.append(count)
        }
        return resArr
        
    }
}
