/**
 给定一个已按照升序排列 的有序数组，找到两个数使得它们相加之和等于目标数。

 函数应该返回这两个下标值 index1 和 index2，其中 index1 必须小于 index2。

 */
class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {

        //快慢指针
        
        var low = 0 ,high = numbers.count - 1
        while low < high {
            if numbers[low] + numbers[high] > target {
                high -= 1
            } else if numbers[low] + numbers[high] < target{
                low += 1
            }else{
                return [low + 1, high + 1]
            }
        }
        return []
        

        /*
        for i in 0 ..< numbers.count {
            var low = i + 1 ,high = numbers.count - 1
            while low <= high {
                let mid = (high - low)/2 + low
                if numbers[mid] + numbers[i] > target {
                    high -= 1
                } else if numbers[mid] + numbers[i] < target{
                    low += 1
                }else{
                    return [i + 1 ,mid + 1]
                }
            }
        }*/
        // return []
    }
}
