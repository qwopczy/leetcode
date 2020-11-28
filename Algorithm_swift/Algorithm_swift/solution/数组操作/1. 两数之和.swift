class Solution1 {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        /* 双指针法
        let numbers = nums.sorted(by: <)
        var lo = 0,hi = numbers.count-1
        while lo<hi {
            var sum = numbers[lo] + numbers[hi]
//            var left = numbers[lo],right = nums[hi]
            if sum < target {
//                while lo<hi && nums[lo] == left{
                    lo += 1
//                }
            }else if sum > target{
//                while lo<hi && nums[hi] == right{
                    hi -= 1
//                }
                
            }else {
                let indexLo :Int = nums.firstIndex(of: numbers[lo])!
                let indexHi :Int = nums.lastIndex(of: numbers[hi])!



                return [indexLo,indexHi]
            }
        }
        
        return []
        */
        var dict = Dictionary<Int,Int>()
        var i = 0;
        for n in nums {//遍历数组将每一项数组值作为key，对应的数组下标作为value添加到字典里
            dict[n] = i
            i = i+1
        }
        var arr = [-1,-1]
        
        var j = 0;
        for n in nums {//遍历数组，直接在上述字典中依次查找key为（target - n）的value,找到此value且与j值不同，即为答案
            if dict.keys.contains(target - n) && j != dict[target - n]
            {
                arr[0] = j
                arr[1] = dict[target - n] ?? -1
                return arr
            }
            j = j+1
        }
        return arr

    
    }
}
