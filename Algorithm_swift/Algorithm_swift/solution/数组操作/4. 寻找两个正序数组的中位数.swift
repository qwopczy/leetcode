class Solution4 {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        if nums1.count == 0 && nums2.count == 0 {
            return 0
        }
        var nums1 = nums1,nums2 = nums2
        var resNum :Double = 0
        
        let res = merge_sort_recursive(&nums1, &nums2)
        if res.count%2 == 0 {
            resNum = Double((res[res.count/2] + res[res.count/2-1]))/2.0
        }else{
            resNum = Double(res[res.count/2])
        }
        return resNum
    }
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
}
