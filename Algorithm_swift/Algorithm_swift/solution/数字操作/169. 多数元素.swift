class Solution169 {
    func majorityElement(_ nums: [Int]) -> Int {
        /* 字典方式
        var  dic : [Int:Int] = [:]
        var max = 0
        var  dicMax : [Int:Int] = [:]
        for num in nums {
            if dic[num]  == nil{
                dic[num] = 1
            }else{
                dic[num]! += 1
            }
            if dic[num]! > max {
                max = dic[num]!
                dicMax[max] = num
            }
        }
        return dicMax[max]!
        */
        let tmp =  nums.sorted()
        return tmp[tmp.count/2]
    }
}
