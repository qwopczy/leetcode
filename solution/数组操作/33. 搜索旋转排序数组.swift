//给你一个整数数组 nums ，和一个整数 target 。

//该整数数组原本是按升序排列，但输入时在预先未知的某个点上进行了旋转。（例如，数组 [0,1,2,4,5,6,7] 可能变为 [4,5,6,7,0,1,2] ）。

//# 左右指针
class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int{
        var left = 0,right = nums.count-1
        while left <= right {
            let mid = (right-left)/2+left
            if nums[mid] == target {
                return mid
            }
            if nums[left] <= nums[mid] {
                if target >= nums[left] && target < nums[mid]{
                    right = mid - 1
                } else {
                    left = mid + 1
                }
            }else{
                if target > nums[mid] && target <= nums[right] {
                    left = mid + 1
                } else {
                    right = mid - 1
                }
            }
            
        }
        return -1
        
    }
}
