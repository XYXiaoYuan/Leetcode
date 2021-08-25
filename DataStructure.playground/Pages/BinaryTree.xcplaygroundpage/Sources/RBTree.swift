//
//  RBTree.swift
//  DataStruct
//
//  Created by apple on 2020/7/27.
//

import Foundation

/// 颜色
typealias Color = Bool
let red: Color = true
let black: Color = false

/// 红黑树 节点
final class RBNode<E>: BTNode<E> {
    ///左子节点
    var lChild: RBNode<E>? {
        get {
            left as? RBNode<E>
        }
        set {
            left = newValue
        }
    }
    
    // 右子节点
    var rChild: RBNode<E>? {
        get {
            right as? RBNode<E>
        }
        set {
            right = newValue
        }
    }
    
    // 父节点
    var fater: RBNode<E>? {
        get {
            parent as? RBNode<E>
        }
        set {
            parent = newValue
        }
    }
    
    /// 颜色 默认为红色
    private(set) var color: Color = red
    
    /// 染色
    func render(color: Color) {
        /// 根节点需要染成黑色
        self.color = (parent == nil && color == red) ? black : color
    }
    
    /// 堂兄弟
    var brother: (node: RBNode<E>, isLeft: Bool)? {
        if let node = parent?.right as? RBNode<E>, !(node === self) {
            return (node: node, isLeft: false)
        }
        if let node = parent?.left as? RBNode<E>, !(node === self) {
            return (node: node, isLeft: true)
        }
        return nil
    }

    /// 叔节点
    var uncle: RBNode<E>? {
        fater?.brother?.node
    }
    
    override var nodeDesc: String {
        return "\(color == red ? "❤️" : "♠️") \(val) "
    }
}

/// 红黑树
public struct RBTree<E>: BST {
    
    public typealias Element = E
    /// 跟节点
    private var _root: RBNode<E>?
    public var root: BTNode<E>? {
        set {
            _root = newValue as? RBNode<E>
        }
        get {
            _root
        }
        
    }
    /// 元素个数
    public private(set) var count: Int = 0
    /// 比较器
    public let cmp: BSTElementCompare<E>
    
    /// 构造方法 自定义比较
    public init(cmp: @escaping BSTElementCompare<E>) {
        self.cmp = cmp
    }
    
    
    /// 创建红黑树节点
    public func createNode(with val: E, parent: BTNode<E>?) -> BTNode<E> {
        RBNode(val: val, parent: parent)
    }
}

/// 元素具备可比性
extension RBTree where E: Comparable {
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
extension RBTree: BBST {
    /// 插入了元素 实现自平衡
    mutating public func didInsert(node: BTNode<E>, parent: BTNode<E>?) {
        count += 1
        
        guard let node = node as? RBNode<E> else { return }
        /// 插入元素实现自平衡
        guard let parent = parent as? RBNode<E> else {
            // 插入的是根节点 需要染黑
            node.render(color: black)
            return
        }
        /// 插入的父节点是否为红色   是黑色不需要处理
        guard parent.color == red else {  return }
        /// 自平衡
        balanceOverflow(node: node, parent: parent)
        
    }
    
    /// 移除了元素 实现自平衡
    mutating public func didRemove(node: BTNode<E>, parent: BTNode<E>?) {
        count -= 1
        /// 只需处理删除的实际上节点是黑色的就行了
        guard let node = node as? RBNode<E>, node.color == black else { return }
        /// 插入元素实现自平衡
        guard let parent = parent as? RBNode<E> else {
            return
        }

        /// 处理下溢
        balanceUnderFlow(node: node, parent: parent)
    }
    
    mutating func balanceUnderFlow(node: RBNode<E>, parent: RBNode<E>) {
        guard  parent.color == black else {
            /// 红父节点时候 需要将兄弟节点染红 将父节点染黑
            parent.render(color: black)
            if let brother = node.brother {
                if let child = brother.node.lChild {
                    if brother.isLeft {
                        // LL
                        makeRightRotate(parent, lChild: brother.node)
                        
                    } else {
                        // LR
                        makeRightRotate(brother.node, lChild: child)
                        makeLeftRotate(parent, rChild: child)
                    }
                    child.render(color: black)
                     brother.node.render(color: red)
                } else if let child = brother.node.rChild {
                    if brother.isLeft {
                        // RL
                        makeLeftRotate(brother.node, rChild: child)
                        makeRightRotate(parent, lChild: child)
                    } else {
                        // RR
                        makeLeftRotate(parent, rChild: brother.node)
                    }
                    child.render(color: black)
                     brother.node.render(color: red)
                } else {
                    /// 兄弟是叶子节点 直接染红
                    brother.node.render(color: red)
                }
                
            }
            return
        }
        
        /// 兄弟节点是红节点情况
        func makeRotate(red brother: RBNode<E>, isLeft: Bool) {
            if isLeft {
                if  brother.lChild != nil {
                    // LL型
                    makeRightRotate(parent, lChild: brother)
                    /// 父节点染红 兄弟节点染黑
                    brother.render(color: black)
                    //parent.render(color: red)
                    if let child = parent.lChild {
                        if child.color == black, !child.isLeafNode {
                            child.render(color: red)
                        } else {
                           parent.render(color: red)
                       }
                    } else {
                        parent.render(color: red)
                    }
                } else if let child = brother.rChild {
                    // RL
                    makeLeftRotate(brother, rChild: child)
                    makeRightRotate(parent, lChild: child)
                    /// 兄弟染黑
                    brother.render(color: black)
                    brother.lChild?.render(color: red)
                } else {
                   /// 不存在的情况...
                   fatalError("父节点是黑节点 子节点有一个黑节点情况下 必然有另一个节点")
                }
            } else {
                if brother.rChild != nil {
                    makeLeftRotate(parent, rChild: brother)
                    /// 父节点染红 兄弟节点染黑
                    brother.render(color: black)
                    /// parent.render(color: red)
                    if let child = parent.rChild {
                        if child.color == black, !child.isLeafNode {
                            child.render(color: red)
                        } else {
                          parent.render(color: red)
                        }
                    } else {
                        parent.render(color: red)
                    }
                } else if let child = brother.lChild {
                    /// RL
                    makeLeftRotate(brother, rChild: child)
                    makeRightRotate(parent, lChild: child)
                    /// 兄弟染黑
                    brother.render(color: black)
                    brother.lChild?.render(color: red)
                } else {
                   //不存在的情况...
                   fatalError("父节点是黑节点 子节点有一个黑节点情况下 必然有另一个节点")
               }
            }
        }
        
         /// 兄弟节点是黑节点情况
        func makeRotate(black brother: RBNode<E>, isLeft: Bool) {
            if let child = brother.lChild {
                if isLeft {
                    // LL型
                    makeRightRotate(parent, lChild: brother)
                    child.render(color: black)
                } else {
                    // LR
                    makeRightRotate(brother, lChild: child)
                    makeLeftRotate(parent, rChild: child)
                    child.render(color: black)
                }
            } else if let child = brother.rChild {
                if isLeft {
                    // RL
                    makeLeftRotate(brother, rChild: child)
                    makeRightRotate(parent, lChild: child)
                    /// 兄弟染黑
                    child.render(color: black)
                } else {
                    makeLeftRotate(parent, rChild: brother)
                    /// 父节点染红 兄弟节点染黑
                    child.render(color: black)
                }
            } else {
                // 兄弟节点不存在子节点
               // 将兄弟节点染红, 父节点产生下益 递归调用
                // 将
                brother.render(color: red)
                if let grandF = parent.fater {
                    balanceUnderFlow(node: parent, parent: grandF)
                }
            }
        }
        
        guard let brother = node.brother else {
            /// 不存在兄弟节点
            /// 这种情况不存在 父节点是黑色,子节点也是黑色必然有兄弟节点
            fatalError("父节点是黑节点 子节点有一个黑节点情况下 必然有另一个节点")
        }
        
        if brother.isLeft {
            if brother.node.color == red {
                makeRotate(red: brother.node, isLeft: true)
            } else {
               
                makeRotate(black: brother.node, isLeft: true)
            }
        } else {
            if brother.node.color == red {
                makeRotate(red: brother.node, isLeft: false)
            } else {
                makeRotate(black: brother.node, isLeft: false)
            }
        }
    }

    /// 插入的父节点是红色 出现了连续的红色需要平衡
    mutating func balanceOverflow(node: RBNode<E>, parent: RBNode<E>) {
        if let uncle = parent.brother?.node {
            /// 叔节点是红色
            if uncle.color == red {
                parent.render(color: black)
                uncle.render(color: black)
                if let grand = parent.fater {
                    grand.render(color: red)
                    if let grandF = grand.fater, grandF.color == red {
                        balanceOverflow(node: grand, parent: grandF)
                    }
                }
                return
            }
        }
        // 叔节点不存在
        
        // 是否存在祖父节点
        guard let grand = parent.fater else {
            // 不存在
            if parent.color == red {
                print("根节点变成了红节点")
            }
            guard let brother = node.brother?.node, brother.color == black else {
                parent.render(color: black)
                return
            }
            return
        }
        
        let isPleft = (grand.left === parent)
        let isLeft = (parent.left === node)
        var upNode = parent
        
        if isLeft {
            if isPleft {
                /// LL型 右旋转
                makeRightRotate(grand, lChild: parent)
                /// 父节点染黑
                upNode = parent
            } else {
                // LR型
                makeRightRotate(parent, lChild: node)
                makeLeftRotate(grand, rChild: node)
                /// 自己染黑
                upNode = node
            }
        } else {
            if isPleft {
                /// RL型 右旋转
                makeLeftRotate(parent, rChild: node)
                makeRightRotate(grand, lChild: node)
                /// 自己染黑
                upNode = node
            } else {
                // RR型
                makeLeftRotate(grand, rChild: parent)
                /// 父节点染黑
                upNode = parent
            }
        }
        /// 自己染黑
        upNode.render(color: black)
        upNode.lChild?.render(color: red)
        upNode.rChild?.render(color: red)
        if let newNode = upNode.fater, newNode.color == red, let newParent = newNode.fater, newParent.color == red {
            balanceOverflow(node: newNode, parent: newParent)
        }
    }
}
