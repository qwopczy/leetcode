class Solution678 {
    func checkValidString(_ s: String) -> Bool {
        if s.isEmpty {
            return true
        }
        var leftArr = [Int]()
        var starArr = [Int]()
        let strArr = Array(s)
        for i in 0..<strArr.count {
            let char = strArr[i]
            if char == "(" {
                leftArr.append(i)
            }else if char == "*"{
                starArr.append(i)
            }else{
                if !leftArr.isEmpty {
                    leftArr.removeLast()
                }else if !starArr.isEmpty{
                    starArr.removeLast()
                }else{
                    return false
                }
            }
            
        }
        //最后来判断"("是否合法，如果left的数量大于star，一定不合法，return false
                
        if leftArr.count > starArr.count  {return false}

        while !leftArr.isEmpty && !starArr.isEmpty{
            if leftArr.last! > starArr.last! {
                return false
            }
            leftArr.removeLast()
            starArr.removeLast()
        }
        return leftArr.isEmpty
    }
}
