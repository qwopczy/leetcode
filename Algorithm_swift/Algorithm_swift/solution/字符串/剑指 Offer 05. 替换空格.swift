class SolutionOffer05 {
    func replaceSpace(_ s: String) -> String {
        //普通遍历
        var res = ""
        for char in s{
            if char == " " {
                res.append("%20")
            } else {
                res.append(char)
            }
        }
        return res
        //双指针法
        // var oldSize = s.count;
        // var sArr = Array(s);
        // var sOldArr = Array(s);
        // for char in s {
        //     if char == " "{
        //         sArr.append(contentsOf: "  ");
        //     }
        // }
        // var newSize = sArr.count
        // var o = oldSize - 1;
        // var n = newSize - 1;
        
        // while o < n {
        //     if sOldArr[o] == " " {//%20
        //         sArr[n] = "0"
        //         sArr[n-1] = "2"
        //         sArr[n-2] = "%"
        //         n = n - 2
        //     }else{
        //        sArr[n] = sOldArr[o]
        //     }
        //     o -= 1
        //     n -= 1
        // }
        // return String(sArr)

    }
}
