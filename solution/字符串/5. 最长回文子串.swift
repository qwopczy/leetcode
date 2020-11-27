//左右指针
class Solution {
    func longestPalindromeHelp(_ sArr: [Character],_ left : Int,_ right: Int) -> String {
        var left = left,right = right
        
        while  sArr.count>right && left >= 0 && sArr[left] == sArr[right] {
            //向两边展开
            left -= 1
            right += 1
        }
        var res = ""
        for i in left+1 ..< right {
            res.append(sArr[i])
        }
        return res
    }
    //最长回文子串
    func longestPalindrome(_ s: String) -> String {
        var res = ""
        let sArr = Array(s)
        for  i in 0..<sArr.count {
            let s1 :String = longestPalindromeHelp(sArr, i, i)
            
            let s2 :String = longestPalindromeHelp(sArr, i, i+1)
            res = res.count < s1.count ? s1:res
            res = res.count < s2.count ? s2:res
            
        }
        return res
    }
}
