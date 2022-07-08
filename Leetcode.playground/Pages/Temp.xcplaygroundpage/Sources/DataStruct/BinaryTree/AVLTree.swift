//
//  AVLTree.swift
//  DataStruct
//
//  Created by apple on 2020/7/27.
//

import Foundation

/// AVL 树 节点
final class AVLNode<E>: BTNode<E> {
    var lChild: AVLNode<E>? {
        get {
            left as? AVLNode<E>
        }
        set {
            left = newValue
        }
    }
    
    var rChild: AVLNode<E>? {
        get {
            right as? AVLNode<E>
        }
        set {
            right = newValue
        }
    }
    
    var fater: AVLNode<E>? {
        get {
            parent as? AVLNode<E>
        }
        set {
            parent = newValue
        }
    }
    
    /// 高度 默认为一层 左右子树为空
    var height = 1
    
    /// 平衡因子
    var factor: Int {
        (lChild?.height ?? 0) - (rChild?.height ?? 0)
    }
    
    /// 更新高度
    func updateHight() {
        height = max(lChild?.height ?? 0, rChild?.height ?? 0) + 1
    }
    
    override init(val: E, parent: BTNode<E>? = nil, left: BTNode<E>? = nil, right: BTNode<E>? = nil) {
        super.init(val: val, parent: parent, left: left, right: right)
        updateHight()
    }
}


/// AVL树 
public struct AVLTree<E>: BST {
    public typealias Element = E
    /// 根节点
    private var _root: AVLNode<E>?
    public var root: BTNode<E>? {
        set {
            _root = newValue as? AVLNode<E>
        }
        get {
            _root
        }
        
    }
    public private(set) var count: Int = 0
    /// 比较器
    public let cmp: BSTElementCompare<E>
    
    /// 构造方法
    public init(cmp: @escaping BSTElementCompare<E>) {
        self.cmp = cmp
    }
    
    /// 创建AVL节点
    public func createNode(with val: E, parent: BTNode<E>?) -> BTNode<E> {
        AVLNode(val: val, parent: parent)
    }
}

/// 元素具备可比性
extension AVLTree where E: Comparable {
    public init() {
        self.cmp = { (e1, e2) -> ComparisonResult in
            if e1 == e2 {
                return .orderedSame
            }
            return e1 < e2 ? .orderedAscending : .orderedDescending
        }
    }
}

/// 自平衡树
extension AVLTree: BBST {
    /// 插入了新的元素 实现自平衡
    /// - Parameters:
    ///   - node: 插入的新节点
    ///   - parent: 插入的新节点的父节点
    mutating public func didInsert(node: BTNode<E>, parent: BTNode<E>?) {
        count += 1
        guard var node = node as? AVLNode<E>, var parent = parent as? AVLNode<E> else { return }
        node.updateHight()
        parent.updateHight()
        addjustUnbaclance(node: &node, parent: &parent)
    }
    
    /// 移除元素发生了变化 实现自平衡
    /// - Parameters:
    ///   - parent: 被移除元素的父节点
    ///   - grand: 被移除元素的祖父节点
    mutating public func didRemove(node: BTNode<E>, parent: BTNode<E>?) {
        count -= 1
        guard let grand = parent as? AVLNode<E> else {
            return
        }
        
        grand.updateHight()
        let factor = grand.factor
        if -1...1 ~= factor {
            if let p = grand.fater {
                if var node = (p.lChild === grand) ? p.rChild : p.lChild, var child = node.lChild ?? node.rChild {
                    addjustUnbaclance(node: &child, parent: &node)
                }
            }
            return
        }
        if factor > 0 {
            if var parent = grand.lChild, var node = parent.lChild ?? parent.rChild {
                addjustUnbaclance(node: &node, parent: &parent)
            }
        } else {
            if var parent = grand.rChild, var node = parent.rChild ?? parent.lChild {
                addjustUnbaclance(node: &node, parent: &parent)
            }
        }
    }
    
    
    /// 调节失衡节点
    /// - Parameters:
    ///   - node: 失衡节点的孙子节点
    ///   - parent: 失衡节点的子节点
    mutating func addjustUnbaclance(node: inout AVLNode<E>, parent: inout AVLNode<E>) {
        while true {
            
            guard let grand = parent.fater else { return }
            let isAddLeft = (parent.left === node)
            let factor = grand.factor
            if -1...1 ~= factor {
                node = parent
                parent = grand
                let h = grand.height
                grand.updateHight()
                if grand.height == h {
                    return
                }
                continue
            }
            
            if factor > 1 {
                
                if isAddLeft {
                    /// LL 型
                    /// 进行一个右旋转
                    makeRightRotate(grand, lChild: parent)
                    node = parent
                } else {
                    /// RL 型
                    /// p 进行右旋转 然后 g 进行左旋转
                    makeLeftRotate(parent, rChild: node)
                    makeRightRotate(grand, lChild: node)
                }
                
            } else {
                if isAddLeft {
                    /// LR 型
                    makeRightRotate(parent, lChild: node)
                    makeLeftRotate(grand, rChild: node)
                } else {
                    /// RR 型
                    makeLeftRotate(grand, rChild: parent)
                    node = parent
                }
            }
            
            parent.updateHight()
            grand.updateHight()
            node.updateHight()
            guard let p = node.fater else {
                return
            }
            parent = p
        }
    }
}
