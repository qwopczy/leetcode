/**
 给定一个由表示变量之间关系的字符串方程组成的数组，每个字符串方程 equations[i] 的长度为 4，并采用两种不同的形式之一："a==b" 或 "a!=b"。在这里，a 和 b 是小写字母（不一定不同），表示单字母变量名。

 只有当可以将整数分配给变量名，以便满足所有给定的方程时才返回 true，否则返回 false。

 */
class Solution990 {
    let aAsciiValue = Int(Character("a").asciiValue ?? 97)
    func equationsPossible(_ equations: [String]) -> Bool {//并查集实际应用
        let uf = UnionFind(26)
        // 先让相等的字母形成连通分量
        for eqStr in equations {
            if eqStr.count < 4 {
                continue
            }
            let eqArr = Array(eqStr)
            let xChar : Character = eqArr[0]
            let yChar : Character = eqArr[3]
            
            if eqArr[1] == "=" {
                uf.union( Int(xChar.asciiValue!)-aAsciiValue, Int(yChar.asciiValue!)-aAsciiValue)
            }
        }
        // 检查不等关系是否打破相等关系的连通性
        for eqStr in equations {
            if eqStr.count < 4 {
                continue
            }
            let eqArr = Array(eqStr)
            let xChar : Character = eqArr[0]
            let yChar : Character = eqArr[3]
            if eqArr[1] == "!" {
                let bConnected = uf.connected( Int(xChar.asciiValue!)-aAsciiValue, Int(yChar.asciiValue!)-aAsciiValue)
                // 如果相等关系成立，就是逻辑冲突
                if bConnected {
                    return false
                }
            }
        }
        return true
    }
    //并查集结构
    class UnionFind {
    // 记录连通分量个数
    private var count: Int
    // 存储若干棵树
    private var parent: [Int]
    // 记录树的“重量”
    private var size: [Int]
    init(_ n : Int) {
        self.count = n
        parent = Array(0...n)
        size = Array(0...n)
        for i in 0..<n {
            parent.append(i)
            size.append(1)
        }
    }
    
    
    /* 将 p 和 q 连通 */
    func union(_ p:Int, _ q:Int) {
        let rootP = find(p);
        let rootQ = find(q);
        if (rootP == rootQ){
            return;
        }

        // 小树接到大树下面，较平衡
        if (size[rootP] > size[rootQ]) {
            parent[rootQ] = rootP;
            size[rootP] += size[rootQ];
        } else {
            parent[rootP] = rootQ;
            size[rootQ] += size[rootP];
        }
        count -= 1;
    }

    /* 判断 p 和 q 是否互相连通 */
    func  connected(_ p:Int, _ q:Int) -> Bool {
        let rootP = find(p);
        let rootQ = find(q);
        // 处于同一棵树上的节点，相互连通
        return rootP == rootQ;
    }

    /* 返回节点 x 的根节点 */
    func  find(_ x:Int) -> Int{
        var x = x
        
        while (parent[x] != x) {//根节点parent 等于他自己
            // 进行路径压缩
            parent[x] = parent[parent[x]];
            x = parent[x];
        }
        return x;
    }

    
}
}
