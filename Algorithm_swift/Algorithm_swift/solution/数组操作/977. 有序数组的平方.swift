//给定一个按非递减顺序排序的整数数组 A，返回每个数字的平方组成的新数组，要求也按非递减顺序排序 输入：[-4,-1,0,3,10] 输出：[0,1,9,16,100]
class Solution977 {
    func sortedSquares(_ A: [Int]) -> [Int] {
        if A.count == 0 {
            return A;
        }
        var newArr = [Int]();
        var left = 0,right = A.count - 1
        while left<=right {
           if A[left]*A[left] > A[right]*A[right]{//有负数和整数  中间的数肯定是比两边的数的平方要小
                newArr.append(A[left]*A[left])//两边的数平方较大所以newArr先拼接两边的数 newArr 会成倒序
                left += 1
            }else{
                newArr.append(A[right]*A[right])
                right -= 1
            }
        }
        
        return newArr.reversed()
    }
}
