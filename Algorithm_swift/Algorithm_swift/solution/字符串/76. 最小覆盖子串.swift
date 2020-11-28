/**
 给你一个字符串 s 、一个字符串 t 。返回 s 中涵盖 t 所有字符的最小子串。如果 s 中不存在涵盖 t 所有字符的子串，则返回空字符串 "" 。

 注意：如果 s 中存在这样的子串，我们保证它是唯一的答案。
 输入：s = "ADOBECODEBANC", t = "ABC"
 输出："BANC"
 */
//滑动窗口
class Solution76 {
    func minWindow(_ s: String, _ t: String) -> String {
        let sArr = [Character](s)
        var window = [Character:Int]()
        var need = [Character:Int]()
        var left = 0, right = 0, start = 0, minLength = Int.max;
        var valid = 0
        
        for char in t {
            need[char, default: 0] += 1
        }
        while right < sArr.count {
            let addChar = sArr[right];
            right += 1
            if need[addChar] == nil {
                continue
            }
            window[addChar , default:0] += 1
            if window[addChar] == need[addChar] {
                valid += 1
            }
            while valid == need.count {
                if right - left < minLength {
                    minLength = right - left
                    start = left
                }
                
                let subChar = sArr[left]
                left += 1
                if need[subChar] == nil {
                    continue
                }
                //                // 如果当前左端字符的窗口中数量和所需数量相等，则后续移动就不满足匹配了，匹配数-1

                if need[subChar] == window[subChar] {
                    valid -= 1
                }
                window[subChar]! -= 1
            }
            
            
        }
        return minLength == Int.max ? "": String(sArr[start..<minLength+start])
    }
}
