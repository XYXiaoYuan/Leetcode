import Foundation

do {
    let s = _02_01_移除重复节点()
    let node = ListNode.arrayToNode([1, 2, 3, 3, 2, 1])
    let result = s.removeDuplicateNodes(node)
    let answer = ListNode.arrayToNode([1, 2, 3])
    if let result = result {
        print("\(s) --- \(result)")
    }

    assert(result == answer)
    
    _02_01_移除重复节点.Test.defaultTestSuite.run()
}

do {
    let s = _17_06_2出现的次数()
    let result = s.numberOf2sInRange(25)
    print("\(s) --- \(result)")

    assert(s.numberOf2sInRange(25) == 9)
    assert(s.numberOf2sInRange(2) == 1)
    assert(s.numberOf2sInRange(1) == 0)
}
