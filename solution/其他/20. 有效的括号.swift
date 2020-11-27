class Solution {
    func isValidHelp(_ s: String) -> Bool {
        if s == "()" || s == "[]" || s == "{}"  {
            return true
        }
        return false
    }
    func isValid(_ s: String) -> Bool {
        if s.isEmpty {
            return true
        }
        var arr = [Character]()
        for char in s {
            if arr.count > 0 {
                var tmpChar = ""
                tmpChar.append(arr.last!)
                tmpChar.append(char)
                
                if isValidHelp(tmpChar){
                    arr.removeLast()
                }else{
                   arr.append(char)
                }
            }else{
                if char == ")" || char == "]" || char == "}" {
                    return false
                }
                arr.append(char)
            }
            
        }
        return arr.count < 1 ? true:false
        
    }
}
