//
//  BBST.swift
//  DataStruct
//
//  Created by Shangen Zhang on 2020/8/1.
//

import Foundation

/// 自平衡二叉搜索树
public protocol BBST: BST {
    /// 插入了新的元素 交给实体对象自我维持平衡
    /// - Parameters:
    ///   - node: 新元素的节点
    ///   - parent: 插入的新元素父节点
    mutating func didInsert(node: BTNode<Element>, parent: BTNode<Element>?)
    
    
    /// 移除了新的元素 交给实体对象自我维持平衡
    /// - Parameters:
    ///   - node: 被移除元素的节点
    ///   - parent: 被移除元素的父节点
    mutating func didRemove(node: BTNode<Element>, parent: BTNode<Element>?)
}

/// insert remove
public extension BBST {

    /// 插入元素
    /// - Parameter element: 插入的新元素
    /// - Returns: 之前存在相同的值,返回之前存在的值
    @discardableResult
    mutating func insert(_ element: Element) -> Element? {
        guard var node = root else {
            /// 插入根节点
            let newNode = createNode(with: element, parent: nil)
            root = newNode
            didInsert(node: newNode, parent: nil)
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
                    /// 这里维持平衡的代码交给实体类解决
                    didInsert(node: newNode, parent: node)
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
                    didInsert(node: newNode, parent: node)
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
                    if let parent = node.removeFromParent() {
                        /// 删除了叶子节点  实际类处理删除后的平衡逻辑
                        didRemove(node: node, parent: parent)
                    } else {
                        // 没有替换的节点几位根节点
                        root = nil
                        didRemove(node: node, parent: nil)
                    }
                    return origin
                }
                
                /// 1. 替换要删除的节点
                node.val = replaceNode.node.val
                
                // 2. 再实际删除实际的叶子节点
                let realRMNode: BTNode<Element>
                let removeParent: BTNode<Element>?
                /// 这里检验实际删除的节点是否还有子节点
                if let child = replaceNode.isLeft ? replaceNode.node.right : replaceNode.node.left {
                    // 如果存在则将它的子节点先替换自己 实际删除的是子节点
                    replaceNode.node.val = child.val
                    
                    if replaceNode.isLeft {
                        replaceNode.node.right = nil
                    } else {
                         replaceNode.node.left = nil
                    }
                    realRMNode = child
                    removeParent = replaceNode.node
                } else {
                    /// 不存在 实际要删除的节点是叶子节点  直接删除自己
                    realRMNode = replaceNode.node
                    removeParent = replaceNode.node.removeFromParent()
                }
                
                /// 3. 高度发生了变化 实体类自平衡调节
                didRemove(node: realRMNode, parent: removeParent)
                
                // 删除元素
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
}
