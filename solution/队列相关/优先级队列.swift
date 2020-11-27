import Foundation
//优先级队列
class MaxPriorityQueue {
    
    var queue: [Int]
    
    var size : Int {
        return self.queue.count
    
    }
    
    init() {
        self.queue = [Int]()
    }
    
     public func add(_ item: Int) -> Bool {
       self.queue.append(item)
       self.heapifyUp(from: self.queue)
       return true
     }
     

    /**
     删除首个元素。
     - 返回值：被移除的元素。
     -
     */
     public func remove() -> Int {
       guard self.queue.count > 0 else {
         return -4040404
       }
       return self.popAndHeapifyDown()
     }
     /**
     获取到队列中的首个元素，并将其移出队列。
     - 返回值：一个包含队列中首个元素的可选值。
     */
     public func dequeue() -> Int? {
       guard self.queue.count > 0 else {
         return nil
       }
       return self.popAndHeapifyDown()
     }
     /**
     获取队列中的首个元素，但不将它移出队列。
     - 返回值：一个包含队列中首个元素的可选值。
     */
     public func peek() -> Int? {
       return self.queue.first
     }
     
     public func clear() {
       self.queue.removeAll()
     }
     
    
     /**
     弹出队列中的第一个元素，并通过将根元素移向队尾的方式恢复最大堆排序。
     - 返回值: 队列中的第一个元素。
     */
     private func popAndHeapifyDown() -> Int {
       let firstItem = self.queue[0]
       
       if self.queue.count == 1 {
         self.queue.remove(at: 0)
         return firstItem
       }
       
        self.queue[0] = self.queue[self.queue.count - 1]//self.queue.remove(at: self.queue.count - 1)
        self.queue.remove(at: self.queue.count - 1)
       self.heapifyDown()
       
       return firstItem
     }
     
     /**
      通过将元素移向队头的方式恢复最大堆排序。
      - 参数 index: 要移动的元素的索引值。
      */
     
    private func heapifyUp(from array: [Int]) {
        var child = array.count - 1
        var parent = child.parent
        
        while parent >= 0 && self.queue[child] > self.queue[parent] {
            swap(parent, with: child)
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
            if rightChild < self.queue.count && self.queue[rightChild] > self.queue[leftChild] {
                leftChild = rightChild
            }
            
            // 如果父节点大于等于任何一个孩子的值，直接跳出(节点比孩子都大就不必下沉了)
            
            
            if self.queue[parent] >= self.queue[leftChild] {
                break
            }
            
            self.swap(parent, with: leftChild)
            parent = leftChild
            leftChild = leftChild.leftChild
        }
     }
     
     /**
      交换存储中位于两处索引值位置的元素。
      - 参数 firstIndex：第一个要交换元素的索引。
      - 参数 secondIndex：第二个要交换元素的索引。
      */
     private func swap(_ firstIndex: Int, with secondIndex: Int) {
       let firstItem = self.queue[firstIndex]
       self.queue[firstIndex] = self.queue[secondIndex]
       self.queue[secondIndex] = firstItem
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
