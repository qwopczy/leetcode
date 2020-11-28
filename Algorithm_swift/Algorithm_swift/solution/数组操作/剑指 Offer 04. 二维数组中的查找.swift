/**
 在一个 n * m 的二维数组中，每一行都按照从左到右递增的顺序排序，每一列都按照从上到下递增的顺序排序。 ，判断数组中是否含有目标整数。
 */
class SolutionOffer04 {
    func findNumberIn2DArray(_ matrix: [[Int]], _ target: Int) -> Bool {
        var row = matrix.count-1 ,col = 0
        while row >= 0 && col <= matrix[0].count-1 {
            if matrix[row][col] > target {
                row -= 1
            }else if matrix[row][col] < target{
                col += 1
            }else{
                return true
            }
        }
        
        return false

    }
}
