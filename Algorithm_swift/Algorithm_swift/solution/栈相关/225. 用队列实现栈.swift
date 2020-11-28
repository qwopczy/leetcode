class MyStack {
    var queue :[Int]
    
    init() {
        queue = [Int]()
    }
    func push(_ x: Int) {
        queue.append(x)
        //每次有新元素入队列，将原队列队首元素依次弹出并从队尾加回到队列中，直到新元素成为队首
        for _ in 1..<queue.count {
            queue.append(queue.removeFirst())
        }
    }
    func pop() -> Int {
        guard !queue.isEmpty else{
            fatalError()
        }
        //因为在每次push的时候就同时完成了队列的再整序工作，所以直接弹出队首即可

        return queue.removeFirst()
    }
    func top() -> Int {
        guard !queue.isEmpty else{
            fatalError()
        }
        return queue.first!
    }
    func empty() -> Bool {
        return queue.isEmpty
    }
}

/**
 * Your MyStack object will be instantiated and called as such:
 * let obj = MyStack()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Bool = obj.empty()
 */
