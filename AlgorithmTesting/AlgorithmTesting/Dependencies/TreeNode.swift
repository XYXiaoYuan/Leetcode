import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
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
    static func arrayToNode(_ tree: [Int]) -> TreeNode? {
        if tree.count == 0 {
            return nil
        }
        
        var newTree = tree
        //add first
        var que:[TreeNode?] = [TreeNode]()
        let head = TreeNode(newTree.removeFirst())
        que.append(head);
        while newTree.count > 0 {
            
            let temp = newTree.first
            let headNode = que.first ?? nil

            var newNode:TreeNode
            if temp != nil {
                newNode = TreeNode(temp ?? 0)
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

extension TreeNode: CustomStringConvertible {
    public var description: String {
        var resStr = ""
        
        var queue:[TreeNode?] = [TreeNode]()
        let treeNode: TreeNode? = self
        queue.append(treeNode)
        var res:[String] = [String]()
        while !queue.isEmpty {
            //remove first leaf
            let leaf = queue.removeFirst();
            
            //print leaf
            if leaf == nil || leaf?.val == Int.max{
                res.append("null")
            }else{
                res.append(String(leaf!.val))
                 //leaf in the queue
                queue.append(leaf?.left)
                queue.append(leaf?.right)
            }
          
        }
        
        //remove last null
        while res.last == "null" {
            res.removeLast()
        }
        
        //print
        while !res.isEmpty {
            resStr += " " + res.removeFirst()
        }
        
        return resStr;
    }
}

extension TreeNode: CustomPlaygroundDisplayConvertible {
    public var playgroundDescription: Any {
        return self.description
    }
}
