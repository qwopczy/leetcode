//字典记录
class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        var dictS : [Character:Int] = [:]
        var dictT : [Character:Int] = [:]
        for char in s {
            dictS[char] = dictS[char] == nil ? 1 : dictS[char]!+1
        }
        for char in t {
            dictT[char] = dictT[char] == nil ? 1 : dictT[char]!+1
        }
        return dictS==dictT

    }
}
