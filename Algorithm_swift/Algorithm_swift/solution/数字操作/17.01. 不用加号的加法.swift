class Solution17_01 {
    func add(_ a: Int, _ b: Int) -> Int {
        //无进位和 与 异或运算 规律相同，进位 和 与运算 规律相同（并需左移一位）。因此，无进位和 nn 与进位 cc 的计算公式如下；
        var a = a, b = b
        while b != 0{
            let tmp = (a&b) << 1
            a = a ^ b
            b = tmp
        }
        return a

    }
}
