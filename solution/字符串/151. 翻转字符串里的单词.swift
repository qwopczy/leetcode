/**
 给定一个字符串，逐个翻转字符串中的每个单词。

 说明：

 无空格字符构成一个 单词 。
 输入字符串可以在前面或者后面包含多余的空格，但是反转后的字符不能包括。
 如果两个单词间有多余的空格，将反转后单词间的空格减少到只含一个。

 */
class Solution {
    func deleteExtraSpace(_ s: String) -> String {
        var res = ""
        var left = 0, right = s.count - 1;
        let sArr = Array(s)
        // 去掉字符串开头的空白字符
        while left <= right && sArr[left] == " "{
            left += 1;
        }
        while left <= right && sArr[right] == " "{
            right -= 1;
        }
        // 将字符串间多余的空白字符去除
        while left<=right {
            let leftChar = sArr[left];
            if leftChar != " " {
                res.append(leftChar)
            }else if res.last != " " {
                res.append(" ")
            }
            
            left += 1
            
        }
        
        return res
    }
    func reverseEachWord(_ res: String) -> String {
        let resCount = res.count
        var start = 0,end = 0
        var sArr = Array(res)
        
        while start < resCount {
            while end < resCount && sArr[end] != " " {
                end += 1
            }
            // 翻转字符串
            var startWord = start,endWord = end-1
            
            while startWord < endWord {
                sArr.swapAt(startWord, endWord)
                startWord += 1
                endWord -= 1
            }
            
            start = end + 1
            end += 1
        }
        
        return String(sArr)
    }
    func reverseWords(_ s: String) -> String {
        var res = deleteExtraSpace(s);
        
        var start = 0, end = res.count-1
        
        var sArr = Array(res)
        // 翻转字符串
        while start < end {
            sArr.swapAt(start, end)
            start += 1
            end -= 1
        }
        res = String(sArr)
        // 翻转每个单词
        res =  reverseEachWord(res);
        return res
    }

}
