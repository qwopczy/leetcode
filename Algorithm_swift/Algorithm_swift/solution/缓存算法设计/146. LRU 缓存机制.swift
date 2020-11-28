//双向链表
public class LRUNode {
    public var val: Int
    public var key: Int
    public var next: LRUNode?
    public var prev: LRUNode?
    public init(Key key: Int,Val val: Int) {
        self.key = key
        self.val = val
    }
}
class  DoubleList {
    private var head: LRUNode
    private var tail: LRUNode
    var size : Int;
    init() {
        head = LRUNode(Key: 0, Val: 0)//哨兵对象 前哨节点为伪头
        tail = LRUNode(Key: 0, Val: 0)
        size = 0;
        head.next = tail
        tail.prev = head
    }
    
    func addFirst(_ x: LRUNode) {
        x.next = head.next;
        x.prev = head;
        head.next?.prev = x;
        head.next = x;
        size += 1;
    }
    func remove(_ x: LRUNode) {
        x.prev?.next = x.next;
        x.next?.prev = x.prev;
        size -= 1;
    }
    
    func removeLast() -> LRUNode?{
        if tail.prev === head{
            return nil;
        }
        let last : LRUNode = tail.prev!;//必须存在prev
        remove(last);
        return last;
    }
    

    
}
class LRUCache {
    private var  maxSize : Int;
    private var map :[Int:LRUNode]
    
    private var cache : DoubleList;
    init(_ capacity : Int) {
        // 初始化 LRU cache 的数据
        self.maxSize = capacity;
        map = [:]
        cache = DoubleList();
    }
    
    
    public func  get(_ key : Int) -> Int {
        if map[key] == nil {
            return -1;
        }
        let val = map[key]!.val;
        put(key, val);
        return val;
    }
    
    public func put(_ key:Int, _ val:Int) {
        // 先把新节点 x 做出来
        let x = LRUNode(Key: key, Val: val)
        
        if (map[key] != nil) {
            // 删除旧的，新的插到头部
            cache.remove(map[key]!)
            cache.addFirst(x)
            // 更新 map 中对应的数据
            map[key] = x
        } else {
            if (self.maxSize == cache.size) {
                // 删除链表最后一个
                let last = cache.removeLast();
                map[last?.key ?? 0] = nil;
            }
            // 直接添加到头部即可
            cache.addFirst(x);
            map[key] = x
        }
    }
}
