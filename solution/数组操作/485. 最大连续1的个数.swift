class Solution {
    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        var count = 0,max = 0 ;
        for i in 0..<nums.count {
            if nums[i] == 1 {
                count += 1
            } else {
                max = count>max ? count:max
                count = 0
            }
        }
        return count>max ? count:max;
        /*
        var left = 0,right = 0 ,max = 0;
        while right < nums.count {
            
            if nums[right] == 0 {
                max = max > (right - left - 1) ? max:(right - left - 1)
                left = right;
            }
            right += 1;
            
        }//因为最后一次连续序列在循环中无法比较，所以在循环外进行比较
        return max > right-left ? max : right-left
        */
    }
}
