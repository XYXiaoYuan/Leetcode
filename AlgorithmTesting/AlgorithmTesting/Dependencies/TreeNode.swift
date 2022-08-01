import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public var nodeDesc: String { val == Int.max ? "" : "\(val)" }
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

public extension TreeNode {
    /// 数组转树,通过一个数组生成一棵树结点
    /// - Parameter list: 列表
    /// - Returns: 树结点
    static func arrayToNode(_ tree: [Int?]) -> TreeNode? {
        if tree.count == 0 {
            return nil
        }
        
        var newTree = tree
        //add first
        var que:[TreeNode?] = [TreeNode]()
        let head = TreeNode(newTree.removeFirst() ?? 0)
        que.append(head);
        while newTree.count > 0 {
            let temp = newTree.first ?? 0
            let headNode = que.first ?? nil

            var newNode: TreeNode
            if let temp = temp {
                newNode = TreeNode(temp)
            } else {
                newNode = TreeNode(Int.max)
            }
            
            //sth wrong
            assert(headNode != nil, "sth wrong with your array")
           
            if headNode?.left == nil {
                headNode?.left = newNode
            } else if headNode?.right == nil {
                headNode?.right = newNode
            } else {
                //cannot add
                que.removeFirst()
                continue
            }
            //add que
            que.append(newNode)
            //remove first
            newTree.removeFirst()
          
        }
        
        return head;
    }
    
//    /// 把树结点转换成数组
//    func toArray() -> [Int] {
//        var array = [Int]()
//        var node: ListNode? = self
//        while node != nil {
//            array.append(node?.val ?? 0)
//            node = node?.next
//        }
//        return array
//    }
}

extension TreeNode {
    func levelNodes() -> [[TreeNode?]] {
        var nodes = [[TreeNode?]]()
        var tempNodes: [TreeNode?] = []
        tempNodes.append(self)
        var hasNext = true
        while hasNext {
            nodes.append(tempNodes)
            var nextNodes: [TreeNode?] = []
            hasNext = false
            func appendNext(node: TreeNode?) {
                if node != nil {
                    hasNext = true
                }
                nextNodes.append(node)
            }
            while !tempNodes.isEmpty {
                let node = tempNodes.removeFirst()
                appendNext(node: node?.left)
                appendNext(node: node?.right)
            }
            
            tempNodes = nextNodes
        }
        return nodes
    }
}

extension TreeNode: CustomStringConvertible {
    public var description: String {
        let nodes = levelNodes()
        var maxCount = 0
        func toSting(reversed level: Int) -> String {
            if maxCount == 0 {
                var str = ""
                for n in nodes[level] {
                    str += "  " + (n?.nodeDesc ?? "  ")
                }
                maxCount = str.count
                return str
            }
            
            var nsstring = String(repeating: " ", count: maxCount) as NSString
            
            let count = nodes[level].count
            let offset = maxCount / count
            let halfIndex = offset >> 1
            for i in 0..<count {
                guard let node = nodes[level][i] else { continue }
                let centerIdnex = halfIndex + i * offset
                let nodeDesc = node.nodeDesc
                let beginIndex = centerIdnex - (nodeDesc.count >> 1)
                nsstring = nsstring.replacingCharacters(in: NSRange(location: beginIndex, length: nodeDesc.count), with: nodeDesc) as NSString
            }
            
            return nsstring as String
        }
        
        var str = ""
        
        for item in (0...(nodes.count - 1)).reversed() {
            str = toSting(reversed: item) + "\n\n" + str
        }
        
        return str

    }
}

extension TreeNode: CustomPlaygroundDisplayConvertible {
    public var playgroundDescription: Any {
        return self.description
    }
}
