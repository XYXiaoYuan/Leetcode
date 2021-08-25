//
//  BST.swift
//  DataStruct
//
//  Created by Shangen Zhang on 2020/7/26.
//

import Foundation

/// 比较
public typealias BSTElementCompare<E> = (_ e1: E, _ e2: E) -> ComparisonResult


/// 二叉搜索树
public protocol BST: BinaryTree {

    /// 比较器
    var cmp: BSTElementCompare<Element> { get }
    
    /// 构建节点
    /// - Parameter val: 元素值
    func createNode(with val: Element, parent: BTNode<Element>?) -> BTNode<Element>
    
    /// 插入元素
    /// - Parameter element: 插入的新元素
    /// - Returns: 之前存在相同的值,返回之前存在的值
    @discardableResult
    mutating func insert(_ element: Element) -> Element?
    
    /// 移除元素
    /// - Parameter element: 要移除的元素
    /// - Returns: 若存在该值则返回之前存储的值
    @discardableResult
    mutating func remove(_ element: Element) -> Element?
}


/// insert remove
public extension BST {

    /// 插入元素
    /// - Parameter element: 插入的新元素
    /// - Returns: 之前存在相同的值,返回之前存在的值
    @discardableResult
    mutating func insert(_ element: Element) -> Element? {
        guard var node = root else {
            /// 插入根节点
            let newNode = createNode(with: element, parent: nil)
            root = newNode
            return nil
        }
        
        while true {
            switch cmp(element, node.val) {
            case .orderedSame:
                /// 存在相同的元素 替换掉
                let origin = node.val
                node.val = element
                return origin
            case .orderedAscending:
                if let next = node.left {
                    node = next
                } else {
                    /// 插入该节点的左边
                    let newNode = createNode(with: element, parent: node)
                    node.left = newNode
                    //check()
                    return nil
                }
            case .orderedDescending:
                if let next = node.right {
                    node = next
                } else {
                    /// 插入该节点的右边
                    let newNode = createNode(with: element, parent: node)
                    node.right = newNode
                    /// 这里维持平衡的代码交给实体类解决
                    //check()
                    return nil
                }
            }
        }
    }
    
    /// 移除元素
    /// - Parameter element: 要移除的元素
    /// - Returns: 若存在该值则返回之前存储的值
    @discardableResult
    mutating func remove(_ element: Element) -> Element? {
        guard var node = root else {
            return nil
        }
        
        while true {
            switch cmp(element, node.val) {
            case .orderedSame:
                let origin = node.val
//                defer {
//                    check()
//                }
                /// 寻找非叶子节点的实际删除节点位置
                guard let replaceNode = node.getBSTReplaceNode() else {
                    // 删除的是叶子节点  实际要删除的就是本身
                    if node.removeFromParent() == nil {
                        // 没有替换的节点几位根节点
                        root = nil
                    }
                    return origin
                }
                
                /// 1. 替换要删除的节点
                node.val = replaceNode.node.val
                
                /// 这里检验实际删除的节点是否还有子节点
                if let child = replaceNode.isLeft ? replaceNode.node.right : replaceNode.node.left {
                    // 如果存在则将它的子节点先替换自己 实际删除的是子节点
                    replaceNode.node.val = child.val
                    if replaceNode.isLeft {
                        replaceNode.node.right = nil
                    } else {
                         replaceNode.node.left = nil
                    }
                }
                return origin
            case .orderedAscending:
                guard let next = node.left else { return nil }
                 node = next
            case .orderedDescending:
                guard let next = node.right else { return nil }
                 node = next
            }
        }
    }
    
    
    /// 查找元素
    /// - Parameter element: 元素
    /// - Returns: 树里面的原始元素
    func find(_ element: Element) -> Element? {
        guard var node = root else {
            return nil
        }
        while true {
            switch cmp(element, node.val) {
            case .orderedSame:
                return node.val
            case .orderedAscending:
                guard let next = node.left else { return nil }
                 node = next
            case .orderedDescending:
                guard let next = node.right else { return nil }
                node = next
            }
        }
    }
}

extension BST {

    /// 检验搜索树的合法性
    @discardableResult
    public func check() -> Int {
        guard let node = root else { return 0}
        var nodes = [node]
        var count = 0

        while !nodes.isEmpty {
            let n = nodes.removeFirst()
            count += 1
            if let left = n.left {
                nodes.append(left)
                /// 左节点小于父节点
                assert(cmp(n.val, left.val) == .orderedDescending)
                assert((left.parent === n))
            }
            if let right = n.right {
                nodes.append(right)
                /// 右节点大于父节点
                assert(cmp(n.val, right.val) == .orderedAscending)
                assert((right.parent === n))
            }

        }
        return count
    }
}


/// 旋转操作
extension BST {
    /// 即将旋转
    private mutating func prepareMakeRotate(_ node: BTNode<Element>, child: BTNode<Element>) {
        if let parent = node.parent {
            if (parent.left === node) {
                parent.left = child
            } else {
                parent.right = child
            }
            child.parent = parent
        } else {
            root = child
            child.parent = nil
        }
        //
        node.parent = child
    }
    
    
    /// 右旋转
    /// - Parameters:
    ///   - node: 需要旋转的节点
    ///   - lChild: 旋转节点的左子节点
    mutating func makeRightRotate(_ node: BTNode<Element>, lChild: BTNode<Element>) {
 
       prepareMakeRotate(node, child: lChild)
        
        let orginRight = lChild.right
        lChild.right = node
        node.left = orginRight
        orginRight?.parent = node
    }
    
    
    /// 左旋转
    /// - Parameters:
    ///   - node: 需要旋转的节点
    ///   - rChild: 旋转节点的右子节点
    mutating func makeLeftRotate(_ node: BTNode<Element>, rChild: BTNode<Element>) {
    
        prepareMakeRotate(node, child: rChild)
       
        let orginRight = rChild.left
        rChild.left = node
        node.right = orginRight
        orginRight?.parent = node
    }

}
