
class Solution34{
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {

        var leftBound = -1, rightBound = -1;
        var left = 0, right = nums.count - 1 ;
        while left <= right{
            
            var mid :Int = left + (right - left )/2;
            if nums[mid] < target {
                left = mid + 1;
                
                
            }else if nums[mid] > target{
                right = mid - 1;
                
            }else if nums[mid] == target{
                right = mid - 1;
            }
            
        }
        
        
        if (left >= nums.count) || (nums[left] != target){
            leftBound = -1;
        }else{
            leftBound = left;
               
        }
        
        left = 0;
        right = nums.count - 1 ;
        
        while left <= right{
            
            var mid: Int = left + (right - left )/2;
            if nums[mid] < target {
                left = mid + 1;
                
                
            }else if nums[mid] > target{
                right = mid - 1;
                
            }else if nums[mid] == target{
                left = mid + 1;
            }
            
        }
        if right < 0 || nums[right] != target{
            rightBound = -1;
        }else{
            rightBound = right;
        }
        return [leftBound,rightBound];
    
    }
}
