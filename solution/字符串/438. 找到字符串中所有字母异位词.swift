/**
 给定一个字符串 s 和一个非空字符串 p，找到 s 中所有是 p 的字母异位词的子串，返回这些子串的起始索引。

 */

//滑动窗口
class Solution {
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        var res = [Int]()
        let sArr = [Character](s);
        var left = 0, right = 0,valid = 0
        var need = [Character:Int]()
        var window = [Character:Int]()
        
        for char in p {
            need[char,default:0] += 1
        }
        while right < sArr.count {
            let addC = sArr[right]
            right += 1
            if need[addC] ?? 0 >= 1  {
                window[addC,default: 0] += 1;
                if need[addC] == window[addC] {
                    valid += 1
                }
            }else{//优化 由于字母异位词中一定只包含p中出现过的字母，所以可以适当“剪枝”。如果遇到了p中没出现过的字母，那么可以立即把left置为right+1，这样就省得left++了
                left = right
                valid = 0
                window.removeAll()
            }
            while right - left >= p.count {
                if valid == need.count {
                    res.append(left)
                }
                
                let subC = sArr[left]
                left += 1
                if need[subC] ?? 0 >= 1 {
                    if need[subC] == window[subC]{
                        valid -= 1;
                    }
                    window[subC]! -= 1
                }
            }
        }
        
        
        return res
    }
}
