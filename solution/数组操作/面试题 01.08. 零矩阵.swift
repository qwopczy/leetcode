//编写一种算法，若M × N矩阵中某个元素为0，则将其所在的行与列清零。

class Solution {
    func setZeroes(_ matrix: inout [[Int]]) {
        if matrix.count < 1 {
            return
        }
        var firstRow = false
        var firstCol = false
        for i in 0..<matrix.count {
            if matrix[i][0] == 0{
                firstCol = true
            }
        }
        
        for j in 0..<matrix[0].count {
            if matrix[0][j] == 0 {
                firstRow = true
            }
        }
        for i in 1..<matrix.count {
            for j in 1..<matrix[i].count {
                if matrix[i][j] == 0{
                    matrix[i][0] = 0
                    matrix[0][j] = 0
                }
            }
        }
        for i in 1..<matrix.count {
            for j in 1..<matrix[i].count {
                if matrix[0][j] == 0 || matrix[i][0] == 0 {
                    matrix[i][j] = 0
                }
            }
        }
        for i in 0..<matrix.count {
            if firstCol{
                matrix[i][0] = 0;
            }
        }
        
        for j in 0..<matrix[0].count {
            if firstRow {
                matrix[0][j] = 0
            }
        }


    }
}
