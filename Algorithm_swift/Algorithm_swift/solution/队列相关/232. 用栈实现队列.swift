//两个栈实现先入先出队列。队列应当支持一般队列的支持的所有操作（push、pop、peek、empty）：
class MyQueue {
    private var pushStack : [Int]
    private var popStack : [Int]

    /** Initialize your data structure here. */
    init() {
        pushStack = [Int]()
        popStack = [Int]()
    }
    
    /** Push element x to the back of queue. */
    func push(_ x: Int) {
        // 在任何时候都可以向 pushStack 推入元素
        pushStack.append(x)
    }
    
    /** Removes the element from in front of queue and returns that element. */
    func pop() -> Int {
        // 从 popStack 取出元素
        if !popStack.isEmpty {
            return popStack.removeLast()//stack 结构只能先操作最外面的元素
        }
        if empty() {
            return -1
        }
        // 走到这里是因为 popStack 为空，此时需要将 pushStack 里的所有元素依次放入 popStack
        while !pushStack.isEmpty {
            popStack.append(pushStack.removeLast())
        }
        return popStack.removeLast()
    }
    
    /** Get the front element. */
    func peek() -> Int {
        if !popStack.isEmpty {
            return popStack.last!
        }
        if empty() {
            return -1
        }
        while !pushStack.isEmpty {
            popStack.append(pushStack.removeLast())
        }
        return popStack.last!
    }
    
    /** Returns whether the queue is empty. */
    func empty() -> Bool {
        // 两个栈都为空，才说明队列为空
        return pushStack.isEmpty && popStack.isEmpty
    }
}
/**
 * Your MyQueue object will be instantiated and called as such:
 * let obj = MyQueue()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.peek()
 * let ret_4: Bool = obj.empty()
 */
