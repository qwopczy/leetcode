class Solution {
    
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
      
    //   var nums = nums.sorted()
        var nums = nums
        nums = MergeSort(&nums)
        // QuickSort(&nums)
        return nums[nums.count-k]

    }
    //归并排序 归并排序就是个二叉树的后续遍历
    func MergeSort(_ sourceArr :inout [Int]) -> [Int] {
        if sourceArr.count<2 {
            return sourceArr
        }
        let mid:Int =  (sourceArr.count)/2
        let startLeft = 0,endLeft = mid-1;
        let startRight = mid,endRight = sourceArr.count-1;
        
        
        var leftArr=[Int](),rightArr=[Int]()
        for j in startLeft...endLeft {
            leftArr.append(sourceArr[j])
        }
        for j in startRight...endRight {
            rightArr.append(sourceArr[j])
        }
        var tmpLeft = MergeSort(&leftArr)
        var tmpRight = MergeSort(&rightArr)
        /****** 后序遍历位置 ******/
           // 合并两个排好序的子数组
        return merge_sort_recursive(&tmpLeft, &tmpRight)
    }
    //归并排序 递归法
    func merge_sort_recursive(_ leftArr :inout [Int],_ rightArr :inout [Int]) -> [Int] {
        var result = [Int]()
        while leftArr.count>0 && rightArr.count>0 {
            
            if leftArr[0] < rightArr[0] {
                result.append(leftArr[0])
                leftArr.remove(at: 0)
            }else{
                result.append(rightArr[0])
                rightArr.remove(at: 0)
            }
        }
        while  leftArr.count>0{
            result.append(leftArr[0])
            leftArr.remove(at: 0)
        }
        while rightArr.count>0 {
            result.append(rightArr[0])
            rightArr.remove(at: 0)
        }
        return result
                
    }



    func QuickSort(_ sourceArray :inout [Int]) -> Void {
           
        //递归法
         quick_sort_recursive(&sourceArray, 0, sourceArray.count-1)
      
    }
    //快速排序就是个二叉树的前序遍历
    func quick_sort_recursive(_ sourceArr :inout [Int],_ start:Int,_ end :Int) -> Void {
        if start>=end {
            return ;
        }
        /****** 前序遍历位置 ******/
           // 通过交换元素构建分界点 mid
        let mid = sourceArr[end]//选最右边进行快速排序
        var left = start,right = end - 1
        while left<right {
            while sourceArr[left]<mid && left < right{//试图在左侧找到一个比枢纽元更大的元素
                left += 1;
            }
            while sourceArr[right]>=mid && left < right{ //试图在右侧找到一个比枢纽元更小的元素
                right -= 1;
            }
            sourceArr.swapAt(left, right)
        }
        
        if sourceArr[left] >= sourceArr[end] {
            sourceArr.swapAt(left, end)
        }else{
            left += 1
        }
        quick_sort_recursive(&sourceArr, start, left - 1)
        quick_sort_recursive(&sourceArr, left+1, end)
        
             
      
    }
}
