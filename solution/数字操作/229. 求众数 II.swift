//给定一个大小为 n 的整数数组，找出其中所有出现超过 ⌊ n/3 ⌋ 次的元素。
class Solution {
    func majorityElement(_ nums: [Int]) -> [Int] {
        var  dic : [Int:Int] = [:]
        var  dicMaxAll : [Int] = []
        for num in nums {
            if dic[num]  == nil{
                dic[num] = 1
            }else{
                dic[num]! += 1
            }
        }
        let length =  nums.count/3
        for (key, count) in dic {
            if count > length {
                dicMaxAll.append(key)
            }
        }
        return dicMaxAll
    }
}
