//
//  BinaryTree.swift
//  DataStruct
//
//  Created by Shangen Zhang on 2020/8/1.
//

import Foundation

/// 遍历
public typealias BTElementEnumer<E> = (_ e: E) -> Void

/// 二叉树
public protocol BinaryTree {
    /// 泛型类型
    associatedtype Element
    
    /// 根节点
    var root: BTNode<Element>? { get set }
}

/// 遍历操作
public extension BinaryTree {
    
    /// 前序遍历
    /// - Parameters:
    ///   - leftFirst: 是否先遍历左边
    ///   - block: 遍历回调block
    func preoderTranersal(leftFirst: Bool = true, using block: BTElementEnumer<Element>) {
        func tranersalLeftFirst(node: BTNode<Element>?) {
            guard let node = node else { return }
            block(node.val)
            tranersalLeftFirst(node: node.left)
            tranersalLeftFirst(node: node.right)
        }
        func tranersalRightFirst(node: BTNode<Element>?) {
            guard let node = node else { return }
            block(node.val)
            tranersalRightFirst(node: node.right)
            tranersalRightFirst(node: node.left)
        }
        
        leftFirst ? tranersalLeftFirst(node: root) : tranersalRightFirst(node: root)
    }
    
    /// 后续遍历
    /// - Parameters:
    ///   - leftFirst: 是否先遍历左边
    ///   - block: 遍历回调block
    func postoderTranersal(leftFirst: Bool = true, using block: BTElementEnumer<Element>) {
        func tranersalLeftFirst(node: BTNode<Element>?) {
            guard let node = node else { return }
            tranersalLeftFirst(node: node.left)
            tranersalLeftFirst(node: node.right)
            block(node.val)
        }
        func tranersalRightFirst(node: BTNode<Element>?) {
            guard let node = node else { return }
            tranersalRightFirst(node: node.right)
            tranersalRightFirst(node: node.left)
            block(node.val)
        }
        
        leftFirst ? tranersalLeftFirst(node: root) : tranersalRightFirst(node: root)
    }
    
    /// 中序遍历
    /// - Parameters:
    ///   - leftFirst: 是否先遍历左边
    ///   - block: 遍历回调block
    func inoderTranersal(leftFirst: Bool = true, using block: BTElementEnumer<Element>) {
        func tranersalLeftFirst(node: BTNode<Element>?) {
            guard let node = node else { return }
            tranersalLeftFirst(node: node.left)
            block(node.val)
            tranersalLeftFirst(node: node.right)
        }
        func tranersalRightFirst(node: BTNode<Element>?) {
            guard let node = node else { return }
            tranersalRightFirst(node: node.right)
            block(node.val)
            tranersalRightFirst(node: node.left)
        }
        
        leftFirst ? tranersalLeftFirst(node: root) : tranersalRightFirst(node: root)
    }
    
    /// 层序遍历
    /// - Parameters:
    ///   - leftFirst: 是否先遍历左边
    ///   - block: 遍历回调block
    func leveloderTranersal(leftFirst: Bool = true, using block: BTElementEnumer<Element>) {
        guard let node = root else { return }
        
        var nodes = [node]
        
        if leftFirst {
            while !nodes.isEmpty {
                let n = nodes.removeFirst()
                if let left = n.left {
                    nodes.append(left)
                }
                if let right = n.right {
                    nodes.append(right)
                }
                block(n.val)
            }
        } else {
            while !nodes.isEmpty {
                let n = nodes.removeFirst()
                if let right = n.right {
                    nodes.append(right)
                }
                if let left = n.left {
                    nodes.append(left)
                }
                block(n.val)
            }
        }
    }
}
