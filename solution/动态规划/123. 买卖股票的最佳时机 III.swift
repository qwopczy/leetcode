/**
 给定一个数组，它的第 i 个元素是一支给定的股票在第 i 天的价格。

 设计一个算法来计算你所能获取的最大利润。你最多可以完成 两笔 交易。


 */
class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        return maxProfit_k_help(prices, 2)//你最多可以完成 两笔 交易  k 为最多为多少笔交易
    }
    func maxProfit_k_help( _ prices: [Int],_ k: Int) -> Int {

        let n = prices.count
        if k == 0 {
            return 0
        } else if  k > n / 2 {//k 值过大导致 dp 数组太大 出现一个超内存的错误 一次交易由买入和卖出构成，至少两天。所以限制次数k不超过 n/2
            return maxProfit_k_inf(prices)
        }

        let stateDP = [Int](repeating: 0, count: 2)
        let kDP = [[Int]](repeating: stateDP, count: k + 1)
        var dp = [[[Int]]](repeating: kDP, count: n)

        for i in 0..<n {

            for tmp_k in (1...k).reversed() {

                if i - 1 == -1 {// -1 时候排除 也就是 i=0
                    dp[i][tmp_k][0] = 0
                    dp[i][tmp_k][1] = -prices[i]
                    continue
                }

                dp[i][tmp_k][0] = max(dp[i - 1][tmp_k][0], dp[i - 1][tmp_k][1] + prices[i])
                dp[i][tmp_k][1] = max(dp[i - 1][tmp_k][1], dp[i - 1][tmp_k - 1][0] - prices[i])
            }
        }
        return dp[n - 1][k][0]
    }
    func maxProfit_k_inf(_ prices: [Int]) -> Int {

        let n = prices.count
        var dp_i_0 = 0
        var dp_i_1 = Int.min

        for i in 0..<n {

            let temp = dp_i_0
            dp_i_0 = max(dp_i_0, dp_i_1 + prices[i])
            dp_i_1 = max(dp_i_1, temp - prices[i])
        }
        return dp_i_0
    }
}
