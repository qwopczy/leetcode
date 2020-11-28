/**
 给定两个字符串 s1 和 s2，写一个函数来判断 s2 是否包含 s1 的排列。

 换句话说，第一个字符串的排列之一是第二个字符串的子串。
 
 输入: s1 = "ab" s2 = "eidbaooo"
 输出: True
 */
//滑动窗口
class Solution567 {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        var need = [Character:Int]()
        var window = [Character:Int]()
        let s2Arr = [Character](s2)
        var left = 0, right = 0,valid = 0;
        for char in s1 {
            need[char,default:0] += 1
        }
        while right<s2Arr.count {
            let addChar = s2Arr[right]
            right += 1
            if need[addChar] != nil {
                window[addChar,default: 0] += 1
                if window[addChar] == need[addChar] {
                    valid += 1
                }
            }
            
            while right - left >= s1.count {
                if valid == need.count {
                    return true
                }
                let subChar = s2Arr[left]
                left += 1
                
                if need[subChar] == nil{
                    continue
                }
                
                if window[subChar] == need[subChar] {
                    valid -= 1
                }
                window[subChar]! -= 1
                
            }
        }
        return false
    }
}
