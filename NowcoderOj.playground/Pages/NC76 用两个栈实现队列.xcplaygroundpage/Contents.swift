/**
 
 */


class Solution {
    private lazy var inStack: Stack<Int> = Stack<Int>()
    private lazy var outStack: Stack<Int> = Stack<Int>()

    init() {

    }
    
    func push(_ value: Int) {
        inStack.push(value)
    }
    
    func pop() -> Int {
        checkOutStack()
        return outStack.pop() ?? 0
    }
    
    private func checkOutStack() {
        if outStack.isEmpty {
            while !inStack.isEmpty {
                outStack.push(inStack.pop() ?? 0)
            }
        }
    }
}
