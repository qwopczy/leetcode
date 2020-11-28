class Solution15 {
    func nSumHelp(_ nums: [Int], _ n:Int, _ start:Int ,_ target:Int ) -> [[Int]] {
        var res = [[Int]]()
        let numSize = nums.count
        if n<2||numSize<n {
            return res
        }
        if n == 2 {
            var lo = start,hi = numSize - 1
            while lo<hi {
                let sum = nums[lo] + nums[hi]
                let leftNum = nums[lo],rightNum = nums[hi]
                if sum < target {
                    while lo<hi && nums[lo] == leftNum {//除去重复
                        lo += 1
                    }
                } else if sum > target{
                    while lo<hi && nums[hi] == rightNum{//除去重复
                        hi -= 1
                    }
                }else{
                    res.append([leftNum,rightNum])
                    while lo<hi && nums[lo] == leftNum {//除去重复
                        lo += 1
                    }
                    while lo<hi && nums[hi] == rightNum{//除去重复
                        hi -= 1
                    }
                    
                }
            }
            
        } else {// n > 2 时，递归计算 (n-1)Sum 的结果
            var i = start;
            while i < numSize {
                let sub :[[Int]] = nSumHelp(nums, n-1, i+1, target - nums[i])
                for var arr in sub {
                    arr.append(nums[i])
                    res.append(arr)
                }
                while i<numSize-1 &&  nums[i] == nums[i + 1]{
                    i += 1
                }
                i += 1
            }
        }
        return res
    }

    func threeSum(_ nums: [Int]) -> [[Int]] {
        let numsN = nums.sorted(by:<)
        return nSumHelp(numsN,3,0,0);
    }
}
