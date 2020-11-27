class MyHashMap {

    struct Item {
        var key: Int
        var value: Int
    }
    
    //  链表
    struct Bucket {
        var bucket = [Item]()
        func get(key: Int) -> Int {
            for item in bucket {
                if item.key == key {
                    return item.value
                }
            }
            return -1
        }

        mutating func update(key: Int, value: Int) {
            var found = false
            for (index, item) in bucket.enumerated() {
                if item.key == key {
                    var newItem = item
                    newItem.value = value
                    bucket[index] = newItem
                    found = true
                    break
                }
            }
            if !found {
                bucket.append(Item(key: key, value: value))
            }
        }
        
        mutating func remove(key: Int) {
            for (index, item) in bucket.enumerated() {
                if item.key == key {
                    bucket.remove(at: index)
                    break
                }
            }
        }
    }
    
    private let keySpace = 2069
    //  数组加链表
    private var hashTable: [Bucket]
    
    init() {
        hashTable = [Bucket]()
        for _ in 0..<keySpace {
            hashTable.append(Bucket())
        }
    }
    
    func put(_ key: Int, _ value: Int) {
        let hashKey = key % keySpace
        hashTable[hashKey].update(key: key, value: value)
    }
    
    func get(_ key: Int) -> Int {
        let hashKey = key % keySpace
        return hashTable[hashKey].get(key: key)
    }
    
    func remove(_ key: Int) {
        let hashKey = key % keySpace
        hashTable[hashKey].remove(key: key)
    }
}



/**
 * Your MyHashMap object will be instantiated and called as such:
 * let obj = MyHashMap()
 * obj.put(key, value)
 * let ret_2: Int = obj.get(key)
 * obj.remove(key)
 */
