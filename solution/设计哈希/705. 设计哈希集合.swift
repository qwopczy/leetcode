class MyHashSet {
  private var bucketArray = [ListNode]()
  private var keyRange = 0
  
  init() {
    keyRange = 769
    for _ in 0..<keyRange {
      bucketArray.append(ListNode.init(-1))
    }
  }
  
  private func _hash(_ key:Int) -> Int {
    return key % keyRange
  }
     
  func add(_ key: Int) {
    let bucketIndex = _hash(key)
    var pre:ListNode? = nil
    var next:ListNode? = bucketArray[bucketIndex]
       
    while next != nil {
      if next!.val == key {
        return
      }
      pre = next
      next = next?.next
    }
    pre?.next = ListNode.init(key)
  }
          
  func remove(_ key: Int) {
    let bucketIndex = _hash(key)
    var pre:ListNode? = nil
    var next:ListNode? = bucketArray[bucketIndex]
       
    while next != nil {
      if next!.val == key {
        pre?.next = next?.next
        break
      }
      pre = next
      next = next?.next
    }
  }
          
  func contains(_ key: Int) -> Bool {
    let bucketIndex = _hash(key)
       
    var next:ListNode? = bucketArray[bucketIndex]
    while next != nil {
      if next!.val == key {
        return true
      }
      next = next!.next
    }
    return false
  }
}

class ListNode {
  var val: Int = 0
  var next: ListNode?
  init(_ val:Int) {
    self.val = val
    self.next = nil
  }
}


/**
 * Your MyHashSet object will be instantiated and called as such:
 * let obj = MyHashSet()
 * obj.add(key)
 * obj.remove(key)
 * let ret_3: Bool = obj.contains(key)
 */
