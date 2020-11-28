/**
 中位数是有序列表中间的数。如果列表长度是偶数，中位数则是中间两个数的平均值。

 例如，

 [2,3,4] 的中位数是 3

 [2,3] 的中位数是 (2 + 3) / 2 = 2.5


 */
//小顶堆 大顶堆
class MedianFinder {
    
     
    var  bigTopQueue: [Int]
    var smallTopQueue: [Int]
    
    
    init() {//数组一分为二 一个倒三角 一个梯形
        //小顶堆
        self.smallTopQueue = [Int]() // 梯形部分 对顶最小
        //大顶堆
        self.bigTopQueue = [Int]() //倒三角  最大数小于等于小顶堆 堆顶
    }
    //不仅要维护big和small的元素个数之差不超过 1，还要维护小顶堆的堆顶元素要大于等于大顶堆的堆顶元素。
     func addNum(_ num: Int) {
        if self.bigTopQueue.count >= self.smallTopQueue.count {
            if addBig(num) {
                let max :Int = dequeueBig()!
                 
                
                     
                 addSmall(max)
            }
            
            
            
        } else {
            if addSmall(num) {
                let min :Int = dequeueSmall()!
                addBig(min)
            }
            
            
        }
       
     }
    public func addBig(_ item: Int) -> Bool {
      self.bigTopQueue.append(item)
        self.heapifyUpBig(from: &self.bigTopQueue)
      return true
    }
    //插入 上浮
    private func heapifyUpBig(from queue:inout [Int]) {
        var child = queue.count - 1
        var parent = child.parent
        
        while parent >= 0 && queue[child] > queue[parent] {
          queue.swapAt(parent, child)
            child = parent
            parent = child.parent
        }
     
    }
    public func addSmall(_ item: Int) -> Bool {
      self.smallTopQueue.append(item)
        self.heapifyUpSmall(from: &self.smallTopQueue)
      return true
    }
    private func heapifyUpSmall(from queue:inout [Int]) {
        var child = queue.count - 1
        var parent = child.parent
        
        while parent >= 0 && queue[child] < queue[parent] {
          queue.swapAt(parent, child)
            child = parent
            parent = child.parent
        }
     
    }
    public func dequeueBig() -> Int? {
      guard self.bigTopQueue.count > 0 else {
        return nil
      }
      return self.popAndHeapifyDownBig()
    }
    private func popAndHeapifyDownBig() -> Int {
      let firstItem = self.bigTopQueue[0]
      
      if self.bigTopQueue.count == 1 {
        self.bigTopQueue.remove(at: 0)
        return firstItem
      }
      
       self.bigTopQueue[0] = self.bigTopQueue[self.bigTopQueue.count - 1]
       self.bigTopQueue.remove(at: self.bigTopQueue.count - 1)
        self.heapifyDownBig(from: &bigTopQueue)
      
      return firstItem
    }
    private func heapifyDownBig(from queue:inout [Int]) {
             var parent = 0
             var leftChild = parent.leftChild
             while leftChild < queue.count
             {
                 
                 let rightChild = parent.rightChild
                 
                 // 如果有右孩子，且右孩子大于左孩子的值，则定位到右孩子
                 if rightChild < queue.count && queue[rightChild] > queue[leftChild] {
                     leftChild = rightChild
                 }
                 
                 // 如果父节点大于等于任何一个孩子的值，直接跳出(节点比孩子都大就不必下沉了)
                 
                 
                 if queue[parent] >= queue[leftChild] {
                     break
                 }
                 
               queue.swapAt(parent, leftChild)
                 parent = leftChild
                 leftChild = leftChild.leftChild
             }
          
    }
    public func dequeueSmall() -> Int? {
         guard self.smallTopQueue.count > 0 else {
           return nil
         }
         return self.popAndHeapifyDownSmall()
       }
    private func popAndHeapifyDownSmall() -> Int {
         let firstItem = self.smallTopQueue[0]
         
         if self.smallTopQueue.count == 1 {
           self.smallTopQueue.remove(at: 0)
           return firstItem
         }
         
          self.smallTopQueue[0] = self.smallTopQueue[self.smallTopQueue.count - 1]
          self.smallTopQueue.remove(at: self.smallTopQueue.count - 1)
           self.heapifyDownSmall(from: &smallTopQueue)
         
         return firstItem
       
    }
    //小顶堆
   private func heapifyDownSmall(from queue:inout [Int]) {
            var parent = 0
            var leftChild = parent.leftChild
            while leftChild < queue.count
            {
                
                let rightChild = parent.rightChild
                
                // 如果有右孩子，且右孩子大于左孩子的值，则定位到右孩子
                if rightChild < queue.count && queue[rightChild] < queue[leftChild] {
                    leftChild = rightChild
                }
                
                
                
                if queue[parent] <= queue[leftChild] {
                    break
                }
                
              queue.swapAt(parent, leftChild)
                parent = leftChild
                leftChild = leftChild.leftChild
            }
         
   }
    func findMedian() -> Double {
           // 如果元素不一样多，多的那个堆的堆顶元素就是中位数
           if (smallTopQueue.count < bigTopQueue.count) {
            return Double(bigTopQueue.max()!);
           } else if (smallTopQueue.count > bigTopQueue.count) {
            return Double(smallTopQueue.min()!)
           }
           // 如果元素一样多，两个堆堆顶元素的平均数是中位数
        return Double(smallTopQueue.min()! + bigTopQueue.max()!) / 2.0;
       
    }
    
    /**
    获取队列中的首个元素，但不将它移出队列。
    - 返回值：一个包含队列中首个元素的可选值。
    */
    
//    public func peek(_ queue:inout [Int]) -> Int? {
//      return queue.first
//    }
//
     
    
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
 * Your MedianFinder object will be instantiated and called as such:
 * let obj = MedianFinder()
 * obj.addNum(num)
 * let ret_2: Double = obj.findMedian()
 */
