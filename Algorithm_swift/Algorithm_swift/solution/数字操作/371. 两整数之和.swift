//不使用运算符 + 和 - ​​​​​​​，计算两整数 ​​​​​​​a 、b ​​​​​​​之和。
class Solution371 {
    func getSum(_ a: Int, _ b: Int) -> Int {
        var a = a
        var b = b
        if a==0 {return b}
        if b==0 {return a}
        var lower:Int = 0;
        var carrier:Int;
        while true {
            lower = a^b;    // 计算低位
            carrier = a&b;  // 计算进位
            if carrier==0 {break}
            a = lower;
            b = carrier<<1;
        }
        return lower;
        
    }
}
