/**
 编写一个函数来查找字符串数组中的最长公共前缀。

 如果不存在公共前缀，返回空字符串 ""。


 示例 1:

 输入: ["flower","flow","flight"]
 输出: "fl"
 */
class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.count < 1 {
            return ""
        }
        var ans :String = strs[0];
        for i in 1..<strs.count {
            var index = 0
            let size = ans.count < strs[i].count ? ans.count:strs[i].count;
            if size == 0 {
                return ""
            }
            for j in 0...size{
                
                if ans.prefix(j) != strs[i].prefix(j){

                    break
                }
                index = j
            }
            ans = String(ans.prefix(index))
            if ans == "" {
                return ans
            }
            
        }
        
        return ans;
        
    }
}
