//给定一个非负整数 c ，你要判断是否存在两个整数 a 和 b，使得 a2 + b2 = c 。
import Foundation

class Solution633 {
    func judgeSquareSum(_ c: Int) -> Bool {
        if c < 0 {return false}
        var a = 0, b:Int = Int(sqrt(Float(c)))
        while a<=b {
            if a*a+b*b == c {
                return true
            }else if a*a+b*b < c{
                a += 1
            }else{
                b -= 1
            }
        }
        return false
        
    }
}
