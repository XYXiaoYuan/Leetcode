//
//  BTNode.swift
//  DataStruct
//
//  Created by apple on 2020/7/27.
//

import Foundation

/// 二叉树节点 Abstract Class
public class BTNode<E> {
    /// 元素值
    var val: E
    /// 父节点
    var parent: BTNode<E>?
    /// 左子树
    var left: BTNode<E>?
    /// 右子树
    var right: BTNode<E>?
    
    /// 构造器方法
    public init(val: E, parent: BTNode<E>? = nil, left: BTNode<E>? = nil, right: BTNode<E>? = nil) {
        self.val = val
        self.parent = parent
        self.left = left
        self.right = right
    }
    
    /// 节点打印信息
    open var nodeDesc: String {
        "\(val)"
    }
    
    /// 是否为叶子节点
    var isLeafNode: Bool {
        left == nil && right == nil
    }
}

/// 打印二叉树
public extension BTNode {
    func printTreeNode() -> String {
        
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
    
    func levelNodes() -> [[BTNode<E>?]] {
        var nodes = [[BTNode<E>?]]()
        var tempNodes: [BTNode<E>?] = []
        tempNodes.append(self)
        var hasNext = true
        while hasNext {
            nodes.append(tempNodes)
            var nextNodes: [BTNode<E>?] = []
            hasNext = false
            func appendNext(node: BTNode<E>?) {
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

extension BTNode {
    
    /// 获取BST 实际删除的节点
    func getBSTReplaceNode() -> (node: BTNode<E>, isLeft: Bool)? {
        guard var node = left, let rightNode = node.right else {
            if var node = right {
               
                while node.left != nil {
                    node = node.left!
                }
                return (node: node, isLeft: !(right === node))
            }
            return nil
        }
        node = rightNode
        while node.right != nil {
            node = node.right!
        }
        return (node: node, isLeft: false)
    }
    
    /// 从父节点移除
    /// 返回值为父节点 本身是根节点则返回父节点为空
    @discardableResult
    func removeFromParent() -> BTNode<E>? {
        guard let parent = parent else { return nil }
        if parent.left === self {
            parent.left = nil
        } else {
            parent.right = nil
        }
        return parent
    }
}
