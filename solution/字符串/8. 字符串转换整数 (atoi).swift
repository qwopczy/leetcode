/**
 请你来实现一个 atoi 函数，使其能将字符串转换成整数。

 首先，该函数会根据需要丢弃无用的开头空格字符，直到寻找到第一个非空格的字符为止。接下来的转化规则如下：

 如果第一个非空字符为正或者负号时，则将该符号与之后面尽可能多的连续数字字符组合起来，形成一个有符号整数。
 假如第一个非空字符是数字，则直接将其与之后连续的数字字符组合起来，形成一个整数。
 该字符串在有效的整数部分之后也可能会存在多余的字符，那么这些字符可以被忽略，它们对函数不应该造成影响。
 注意：假如该字符串中的第一个非空格字符不是一个有效整数字符、字符串为空或字符串仅包含空白字符时，则你的函数不需要进行转换，即无法进行有效转换。

 在任何情况下，若函数不能进行有效的转换时，请返回 0

 */
class Solution {
    func myAtoi(_ s: String) -> Int {
        if s.count<1 {
            return 0
        }
        let arrNum = Array(s)
        var index = 0
        var preNum = 1
        
        while index < arrNum.count && arrNum[index] == " " {
            index += 1
        }
        if index == arrNum.count{
            return 0
        }
        if arrNum[index] == "-" {
            preNum = -1
            index += 1
        }else if arrNum[index] == "+"{
            index += 1
        }
        
        var res : Int = 0
        while index<arrNum.count {
            let curChar = arrNum[index]
            if curChar > "9" || curChar < "0" {
                break
            }
            //题目中说：环境只能存储 32 位大小的有符号整数，因此，需要提前判：断乘以 10 以后是否越界
            let maxTmp = Int32.max/10
            let minTmp = Int32.min/10
            
            if maxTmp < res {
                return Int(Int32.max)
            }
            if minTmp > res {
                return Int(Int32.min)
            }
            let tmpInt = Int(String(curChar))!
            
            res = res*10 + preNum * tmpInt
            index += 1
        }

        if Int32.max < res {
            return Int(Int32.max)
        }
        if Int32.min > res {
            return Int(Int32.min)
        }
        return  res
    }
}
