//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

func bstAVLTest() {
    var avl = AVLTree<Int>()
    func printBST() {
        /// 中序遍历
        print("\n中序遍历:")
        avl.inoderTranersal {
            print($0)
        }
        print("\n前序遍历:")
        avl.preoderTranersal {
            print($0)
        }
        print("\n后序遍历:")
        avl.postoderTranersal {
            print($0)
        }
        print("\n层序遍历:")
        avl.leveloderTranersal {
            print($0)
        }
    }
//        avl.insert(10)
//        avl.insert(5)
//        avl.insert(8)
//        //printBST()
//        avl.insert(15)
//        //printBST()
//        avl.insert(20)
//        //printBST()
//        avl.insert(17)
    
    (1...20).forEach {
        avl.insert($0)
    }
    //printBST()
    //avl.check()
    assert(avl.count == 20)
    (1...3).forEach {
        avl.remove($0 * 3)
    }
    assert(avl.count == 20 - 3)
    printBST()
    avl.remove(8)
    //assert(avl.check() == 20 - 3 - 1)
    avl.remove(1)
    avl.remove(5)
    assert(avl.count == 20 - 3  - 1 - 2)
    avl.insert(10)
    //assert(avl.check() == avl.count && avl.count == 20 - 3  - 1 - 2)
    
    print("\n----------------------------------\n")
     printBST()
    print("\n\n\n-----------------------\n\n\n \(avl.root?.printTreeNode() ?? "nil")")
}


func bstRBTest() {
    var rb = RBTree<Int>()
    func printBST() {
        /// 中序遍历
        print("\n中序遍历:")
        rb.inoderTranersal {
            print($0)
        }
        print("\n前序遍历:")
        rb.preoderTranersal {
            print($0)
        }
        print("\n后序遍历:")
        rb.postoderTranersal {
            print($0)
        }
        print("\n层序遍历:")
        rb.leveloderTranersal {
            print($0)
        }
    }
    
//        (1...10).forEach {
//            rb.insert($0)
//        }
    
    var intArr = [Int]()
    /*
     count == 10_000_000
     /// MAXLevel == 16

     
     count == 1_000_000
     insert RBTree Time = 4.865534067153931
     insert AVLTree Time = 5.968713998794556
     insert SkipLisk Time = 8.422984957695007
     remove RBTree Time = 0.0035889148712158203
     remove AVLTree Time = 0.003564000129699707
     remove SkipLisk Time = 0.005926012992858887
     
     count == 10_000_000
     insert RBTree Time = 57.797886967659
     insert AVLTree Time = 70.54109191894531
     insert SkipLisk Time = 108.27153599262238
     remove RBTree Time = 0.004436969757080078
     remove AVLTree Time = 0.004297971725463867
     remove SkipLisk Time = 0.008522987365722656
     
     insert RBTree Time = 56.743963956832886
     insert AVLTree Time = 67.94215095043182
     insert SkipLisk Time = 104.19555997848511
     remove RBTree Time = 0.004591941833496094
     remove AVLTree Time = 0.004559040069580078
     remove SkipLisk Time = 0.007779955863952637
     */
    for _ in 0..<1_000_000 {
        let number = Int.random(in: 0..<1000000000)
        intArr.append(number)
        
    }
//        // 81.1420670747757
    printTime(prefix: "insert RBTree Time = ") {
        intArr.forEach {rb.insert($0)}
    }
    var avl = AVLTree<Int>()
    // 248.5733379125595
    printTime(prefix: "insert AVLTree Time = ") {
        intArr.forEach {avl.insert($0)}
    }
    
    var skipList = SkipList<Int, Int>()
    // 412.76885199546814
    printTime(prefix: "insert SkipLisk Time = ") {
        intArr.forEach { skipList.setValue($0, for: $0) }
    }
    
//        //print(skipList.printSkipNodes())
//
//        var values = [Int]()
//        for _ in 0..<1000 {
//            values.append(Int.random(in: 0..<100000000))
//        }
//        // 0.008895039558410645
//        printTime(prefix: "remove RBTree Time = ") {
//
//            values.forEach{_ = rb.find($0)}
//        }
//
//        // 0.007248997688293457
//        printTime(prefix: "remove AVLTree Time = ") {
//            values.forEach{_ = avl.find($0)}
//        }
//
//        // 0.023012995719909668
//        printTime(prefix: "remove SkipLisk Time = ") {
//            values.forEach{_ = skipList.valueFor($0)}
//        }
//
//        var last = Int.min
//        rb.inoderTranersal {
//            assert($0 > last)
//            last = $0
//        }
//
//        var last1 = Int.min
//        avl.inoderTranersal {
//            assert($0 > last1)
//            last1 = $0
//        }
//
//        var last2 = Int.min
//        skipList.forEach { (key, _) in
//            assert(key > last2)
//            last2 = key
//        }
//
//        avl.check()
    //printBST()
    /*
     [14, 80, 55, 59, 29, 19, 75, 56, 47, 52, 47, 84, 37, 73, 23, 12, 49, 81, 96, 90]
     [12, 40, 65, 56, 50, 20, 63, 16, 81, 94, 55, 63, 20, 18, 84, 82, 50, 41, 42, 38]
     [69, 73, 16, 12, 55, 33, 47, 41, 58, 50, 67, 65, 30, 91, 48, 49, 99, 53, 62, 31, 56, 64, 68, 33, 67]
     */
//        let arr = [69, 73, 16, 12, 55, 33, 47, 41, 58, 50, 67, 65, 30, 91, 48, 49, 99, 53, 62, 31, 56, 64, 68]
//
//        arr.forEach {
//            rb.insert($0)
//
//        }
//        print("\n\n\n-----------------------\n\n\n \(rb.root?.printTreeNode() ?? "nil")")
//        print("remove ++++++++++++++++++++++++++ remove")
//        let rmArr = [69, 73, 16, 12, 55, 33, 47, 41, 58, 50, 67, 65]
//        rmArr.forEach {
//            rb.remove($0)
//        }
//        print("\n\n\n-----------------------\n\n\n \(rb.root?.printTreeNode() ?? "nil")")
}

func printTime(prefix: String = "", block: () -> Void) {
    let t = CFAbsoluteTimeGetCurrent()
    block()
    print(prefix + "\(CFAbsoluteTimeGetCurrent() - t)")
}


bstAVLTest()
bstRBTest()
