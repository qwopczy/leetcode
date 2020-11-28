/*
 给定一个排序数组和一个目标值，在数组中找到目标值，并返回其索引。如果目标值不存在于数组中，返回它将会被按顺序插入的位置。

 假设数组中无重复元素。
 */
class Solution35 {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var left = 0, right = nums.count - 1;
    
     while left <= right {
        let middle = left + (right - left)/2
        if nums[middle] > target {
            right = middle - 1
        } else if nums[middle] < target {
            left = middle + 1
        }else{
            return middle;
        }
    }
    return left;
    }
}
