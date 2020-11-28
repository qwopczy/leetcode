/**
 给出一个区间的集合，请合并所有重叠的区间。
 */
class Solution56 {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        if intervals.count <= 1 {
            return intervals
        }
        var list = intervals.sorted { (a, b) -> Bool in
            return a.first! < b.first!
        }

        
        

        var i : Int = 1
        while i < list.count {
            let last = list[i - 1]
            //delete list i
            if list[i].last! < last.last! {
                list.remove(at : i)
            //交错的，合并
            } else if list[i].first! <= last.last! {
                list[i - 1] = [last.first!, list[i].last!]
                list.remove(at : i)
            } else {
                i += 1
            }
        }
        return list

    }
}
