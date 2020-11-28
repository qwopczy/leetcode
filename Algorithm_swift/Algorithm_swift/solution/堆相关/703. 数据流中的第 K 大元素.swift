/**
 设计一个找到数据流中第 k 大元素的类（class）。注意是排序后的第 k 大元素，不是第 k 个不同的元素。

 请实现 KthLargest 类：
 */
class KthLargest703 {
    var queue: [Int]
    var k = 1
    
    init(_ k: Int, _ nums: [Int]) {
        self.queue = [Int]()
        for num in nums {
            if self.queue.count < k {
                queue.append(num)
                heapifyUp(from: queue)
            }else if num > peek(){
                
                self.queue[0] = num
                      
                     
                self.heapifyDown()
                
            }
        }
        self.k = k

    }
    
    func add(_ val: Int) -> Int {
        if queue.count < k {
            queue.append(val)
            heapifyUp(from: queue)
        }else if val > peek(){
            
            self.queue[0] = val
                  
                 
            self.heapifyDown()
            
            
            
        }
        return peek()
    }
    
    public func peek() -> Int {
        return self.queue.first!
    }
   
    /**
      通过将元素移向队头的方式恢复最大堆排序。
      - 参数 index: 要移动的元素的索引值。
      */
     
    private func heapifyUp(from array: [Int]) {
        var child = array.count - 1
        var parent = child.parent
        
        while parent >= 0 && self.queue[child] < self.queue[parent] {
            queue.swapAt(parent,  child)
            child = parent
            parent = child.parent
        }
     
    }
     
     /**
      通过将根元素移向队尾的方式恢复队列的最大堆排序。
      */
     
    private func heapifyDown() {
        var parent = 0
        var leftChild = parent.leftChild
        while leftChild < self.queue.count
        {
            
            let rightChild = parent.rightChild
            
            // 如果有右孩子，且右孩子大于左孩子的值，则定位到右孩子
            if rightChild < self.queue.count && self.queue[rightChild] < self.queue[leftChild] {
                leftChild = rightChild
            }
            
            // 如果父节点大于等于任何一个孩子的值，直接跳出(节点比孩子都大就不必下沉了)
            
            
            if self.queue[parent] <= self.queue[leftChild] {
                break
            }
            
            queue.swapAt(parent, leftChild)
            parent = leftChild
            leftChild = leftChild.leftChild
        }
     }
}
private extension Int {
  var leftChild: Int {
    return (2 * self) + 1
  }
  
  var rightChild: Int {
    return (2 * self) + 2
  }
  
  var parent: Int {
    return (self - 1) / 2
  }
}
/**
 * Your KthLargest object will be instantiated and called as such:
 * let obj = KthLargest(k, nums)
 * let ret_1: Int = obj.add(val)
 */
