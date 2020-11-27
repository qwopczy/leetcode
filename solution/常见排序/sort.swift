
import Foundation

class Algorithm {
    //冒泡
    func BubbleSort(_ sourceArray : [Int]) -> [Int] {
        var resArr = sourceArray
        let len = resArr.count
        for i in 0..<len-1 {
            // 设定一个标记，若为true，则表示此次循环没有进行交换，也就是待排序列已经有序，排序已经完成。 最大的一个一个被排在后面所以 0..<len-1-i
            var flag = true;
            for j in 0..<len-1-i {
                if resArr[j] > resArr[j+1]{
//                    let tmp  = resArr[j]
//                    resArr[j] = resArr[j+1]
//                    resArr[j+1] = tmp
                    resArr.swapAt(j, j+1)
                    flag = false
                }
                
            }
            if flag {
                break
            }
 
        }
        
      
        return resArr
    }
    func SelectSort(_ sourceArray :inout [Int]) -> [Int] {
           
           
        let len = sourceArray.count
           
        for i in 0..<len-1 {
            var minIndex = i
            ////找"[i+1]..[len]"之间最小元素，并赋给min
            for j in i..<len {
                if sourceArray[j] < sourceArray[minIndex] {
                    minIndex = j
                }
            }
            if minIndex != i {
                sourceArray.swapAt(minIndex, i)
            }
        }
             
        return sourceArray
      
    }
    
    
    func QuickSort(_ sourceArray :inout [Int]) -> Void {
           
        //递归法
         quick_sort_recursive(&sourceArray, 0, sourceArray.count-1)
      
    }
    //快速排序就是个二叉树的前序遍历
    func quick_sort_recursive(_ sourceArr :inout [Int],_ start:Int,_ end :Int) -> Void {
        if start>=end {
            return ;
        }
        /****** 前序遍历位置 ******/
           // 通过交换元素构建分界点 mid
        let mid = sourceArr[end]//选最右边进行快速排序
        var left = start,right = end - 1
        while left<right {
            while sourceArr[left]<mid && left < right{//试图在左侧找到一个比枢纽元更大的元素
                left += 1;
            }
            while sourceArr[right]>=mid && left < right{ //试图在右侧找到一个比枢纽元更小的元素
                right -= 1;
            }
            sourceArr.swapAt(left, right)
        }
        
        if sourceArr[left] >= sourceArr[end] {
            sourceArr.swapAt(left, end)
        }else{
            left += 1
        }
        quick_sort_recursive(&sourceArr, start, left - 1)
        quick_sort_recursive(&sourceArr, left+1, end)
        
             
      
    }
    
    //归并排序 归并排序就是个二叉树的后续遍历
    func MergeSort(_ sourceArr :inout [Int]) -> [Int] {
        if sourceArr.count<2 {
            return sourceArr
        }
        let mid:Int =  (sourceArr.count)/2
        let startLeft = 0,endLeft = mid-1;
        let startRight = mid,endRight = sourceArr.count-1;
        
        
        var leftArr=[Int](),rightArr=[Int]()
        for j in startLeft...endLeft {
            leftArr.append(sourceArr[j])
        }
        for j in startRight...endRight {
            rightArr.append(sourceArr[j])
        }
        var tmpLeft = MergeSort(&leftArr)
        var tmpRight = MergeSort(&rightArr)
        /****** 后序遍历位置 ******/
           // 合并两个排好序的子数组
        return merge_sort_recursive(&tmpLeft, &tmpRight)
    }
    //归并排序 递归法 合并
    func merge_sort_recursive(_ leftArr :inout [Int],_ rightArr :inout [Int]) -> [Int] {
        var result = [Int]()
        while leftArr.count>0 && rightArr.count>0 {
            
            if leftArr[0] < rightArr[0] {
                result.append(leftArr[0])
                leftArr.remove(at: 0)
            }else{
                result.append(rightArr[0])
                rightArr.remove(at: 0)
            }
        }
        while  leftArr.count>0{
            result.append(leftArr[0])
            leftArr.remove(at: 0)
        }
        while rightArr.count>0 {
            result.append(rightArr[0])
            rightArr.remove(at: 0)
        }
        return result
                
    }
    
    /**
     插入排序在对几乎已经排好序的数据操作时，效率高，即可以达到线性排序的效率；
     但插入排序一般来说是低效的，因为插入排序每次只能将数据移动一位；
     希尔排序的基本思想是：先将整个待排序的记录序列分割成为若干子序列分别进行直接插入排序，待整个序列中的记录“基本有序”时，再对全体记录进行依次直接插入排序。
     */
    //（注：为方便记忆算法，我习惯将其记作“三层循环+if” ------ for（for（for（if））））

    func shellSort(_ sourceArray :inout [Int]) -> Void {
        var step = 1
        while step < sourceArray.count/3 {
            step = step*3+1
        }
        while step>=1 {
            for i in step..<sourceArray.count {
                var j = i
                
                while j>=step && sourceArray[j] < sourceArray[j-step] {
                    sourceArray.swapAt(j, j-step)
                    j -= step
                }
                
            }
            step = step/3
        }
        
      
    }
    func InsertSort(_ sourceArray :inout [Int]) -> [Int] {
               
               
            // 从下标为1的元素开始选择合适的位置插入，因为下标为0的只有一个元素，默认是有序的
            for i in 1..<sourceArray.count{
                var pre = i
                let tmp = sourceArray[i]
                while pre>0 && sourceArray[pre-1] > tmp {
                    sourceArray.swapAt(pre, pre-1)
    //                sourceArray[pre] = sourceArray[pre - 1]
                    pre -= 1
                }
    //            if pre != i {
    //                sourceArray[pre] = tmp
    //            }
                
            }
                 
            return sourceArray
          
        
    }
    //计数排序 需要知道最大元素 和 最小  n 个min...max   之间的整数
    func countingSort(_ sourceArr :inout [Int],_ max :Int,_ min :Int) -> [Int] {
        let bucketLen = max - min + 1
        var bucket:[Int]  = Array(repeating: -1, count: bucketLen)
        
        for i in sourceArr {
            if bucket[i-min] < 0 {
                bucket[i-min] = 1
            }else{
                bucket[i-min] += 1
            }
        }
        var sortedIndex = 0
        
        for j in 0..<bucket.count { // min - 0
            while bucket[j] > 0 {
                bucket[j] -= 1
                sourceArr[sortedIndex] = j+min
                sortedIndex += 1
            }
        }
        
        return sourceArr
    }
    
    

    //:桶排序
    //bucketCount是桶的大小
    func bucketSort(_ arr: inout [Int], bucketCount:Int) -> [Int]{
     
        if arr.count <= 1 || bucketCount <= 0 {
            return arr
        }
        //找出最大值和最小值
        var max = arr[0]
        var min = arr[0]
        for num in arr {
            if num >= max {
                max = num
            }
            
            if min >= num {
                min = num
            }
        }
        //每个桶的数值范围
        let bucketsLen = (max - min ) / (bucketCount) + 1
        var buckets = Array(repeating: [Int](), count: bucketCount)
        //将数值放到对应范围的桶中
        for value in arr {
            ///数值对应的桶
            let index = Int((value - min) / bucketsLen)
            buckets[index].append(value)
            
            
        }
        var result = [Int]()
        
        ///排序所有的桶
        
        for var valueArr in buckets {
            if valueArr.count > 0 {
                let newArr = MergeSort(&valueArr)
                for value in newArr{
                    result.append(value)
                }
            }
        }
        
        return result
        
    }
    
    
    
    
    
    
    //MARK:基数排序LSD (目前不支持对负数处理)
    func radixSort(_ arr:inout [Int]) -> Void {
        if arr.count == 0 {
            return
        }
        var list:[[Int]] = [[Int]](repeating:[Int](),count:10)

        let maxDigit:Int = maxlength(arr)
        var tempArr:[Int] = arr
        for i in 0..<maxDigit {
            for j in 0..<arr.count {
                let index:Int = highDigit(tempArr[j], i)
                list[index].append(tempArr[j])
            }
            saveBucketData(&list, &tempArr)
        }
        arr = tempArr
    }
    
    // 桶的数据插入数组
    private func saveBucketData(_ bucketlist:inout [[Int]],_ arr:inout [Int]) -> Void
    {
        var index:Int = 0
        for i in 0..<bucketlist.count {
            let bucket:[Int] = bucketlist[i]
            if bucket.count > 0 {
                for j in 0..<bucket.count {
                    arr[index] = bucket[j]
                    index += 1
                }
            }
            bucketlist[i].removeAll() // 注意清空桶数据
        }
    }

    private func highDigit(_ num : Int ,_ index : Int) -> Int {
        let base:Double = pow(10, Double(index))
        let high:Int = (num / Int(base)) % 10
        return high
    }
    
    // 最大数字的位数
   private  func maxlength(_ arr : [Int] ) -> Int {
        var max:Int = 0
        for i in 0..<arr.count {
            let count:Int = positionOfNum(arr[i])
            if count > max {
                max = count
            }
        }
        return max
    }
    // 统计数字的位数
    private func positionOfNum(_ number : Int) -> Int {
        var numberTmp = number
        
        var count:Int = 0
//        var num:Int = 1

        while( numberTmp >= 1 ) {

            numberTmp = numberTmp/10;
            count += 1;

//            num = num*10;

        }

        return count;
    }
    
    //堆排序。======
    func heapSort(_ souceArr :inout [Int]) -> Void {
        // 1.把无序数组构建成二叉堆。
//        buildHeapByUp(&souceArr)
        
        buildHeap(&souceArr)
        
        print("buildHeap \(souceArr)");
        

        // 2.循环删除堆顶元素，移到集合尾部，调节堆产生新的堆顶。
        var i = souceArr.count - 1
        while i > 0{
            
            // 最后一个元素和第一元素进行交换
            souceArr.swapAt(0, i)
            var first = 0
            
            downAdjust(&souceArr, &first, i)
            
            i -= 1
        }

    }
    func buildHeapByUp(_ souceArr :inout [Int]) -> Void {
        var tmp = [Int]()
        
        for value in souceArr {
            tmp.append(value)
            upAdjust(&tmp)
        }
        souceArr = tmp
        
    }
    func buildHeap(_ souceArr :inout [Int]) -> Void {
        var i = souceArr.count/2
        while i>=0 {
            downAdjust(&souceArr, &i, souceArr.count)
            i -= 1
        }
    }
    /**
    * 上浮调整 (一般插入新元素 ) 例子为大顶堆

    * @param array     待调整的堆
    */
    func upAdjust(_ souceArr :inout [Int]) -> Void {
     
        var childIndex = souceArr.count - 1
        var parentIndex = (childIndex-1)/2
        // temp保存插入的叶子节点值，用于最后的赋值
//        let temp = souceArr[childIndex]
        while childIndex > 0 && souceArr[childIndex] > souceArr[parentIndex] {
            souceArr.swapAt(parentIndex, childIndex)
            //无需真正交换，单向赋值即可 或者直接交换
//            souceArr[childIndex] = souceArr[parentIndex]
            childIndex = parentIndex
            parentIndex = (parentIndex-1)/2
        }
        //最后的赋值
//        souceArr[childIndex] = temp
        
    }
    /**
    * 下沉调整 (一般删除对顶操作 )

    * @param array     待调整的堆

    * @param parentIndex    要下沉的父节点

    * @param parentIndex    堆的有效大小
    */
    func downAdjust(_ souceArr :inout [Int],_ parentIndex :inout Int, _
        length :Int) -> Void {

        // temp保存父节点值，用于最后的赋值
        let temp = souceArr[parentIndex]
        var childIndex = parentIndex * 2 + 1
        while childIndex < length {
            // 如果有右孩子，且右孩子大于左孩子的值，则定位到右孩子
            if childIndex + 1 < length && souceArr[childIndex + 1] > souceArr[childIndex] {
                childIndex += 1
            }
//            大顶堆的操作
            // 如果父节点大于等于任何一个孩子的值，直接跳出(节点比孩子都大就不必下沉了)
            if temp >= souceArr[childIndex] {
                break
            }
            //交换 或者可以无需真正交换，单向赋值即可 后面再赋值
            souceArr.swapAt(parentIndex, childIndex)
//            souceArr[parentIndex] = souceArr[childIndex]
            parentIndex = childIndex
            childIndex = childIndex * 2 + 1
            
        }
//        souceArr[parentIndex] = temp
       
    }


    

    
    
}




class KthLargest {
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


