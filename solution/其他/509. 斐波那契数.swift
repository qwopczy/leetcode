class Solution {
    func fib(_ N: Int) -> Int {
        if N == 0 {
            return 0
        }
        if N == 1 || N == 2 {
            return 1
        }
        var prev = 1,cur = 1

        for i in 3...N{
            var sum = prev + cur
            prev = cur
            cur = sum
            
        }
        return cur
    }
    
}
