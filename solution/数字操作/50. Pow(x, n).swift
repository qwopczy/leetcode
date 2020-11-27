class Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        //递归必须终止条件
        if n == 0 {
            return 1.0
        }
        if n == -1 {
            return 1/x
        }
        if n == 1 {
            return x
        }
        let rest : Double = myPow(x, n%2)
        let half : Double = myPow(x, n/2)
        return rest * half * half
    }
}
