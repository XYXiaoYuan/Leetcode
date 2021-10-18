import Foundation

do {
    let s = _001_两数之和()
    let result = s.twoSum([2, 5, 11, 7], 9)
    print("\(s) --- \(result)")
}

do {
    let s = _054_螺旋矩阵()
    let input1 = [[1,2,3],[4,5,6],[7,8,9]]
    let input2 = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]
    let result = s.spiralOrder(input1)
    print("\(s) --- \(result)")

    assert(s.spiralOrder(input1) == [1,2,3,6,9,8,7,4,5])
    assert(s.spiralOrder(input2) == [1,2,3,4,8,12,11,10,9,5,6,7])
}

do {
    let s = _062_不同路径()
    let result = s.uniquePaths(3, 7)
    print("\(s) --- \(result)")

    assert(s.uniquePaths(3, 2) == 3)
    assert(s.uniquePaths(7, 3) == 28)
    assert(s.uniquePaths(3, 3) == 6)
}

do {
    let s = _064_最小路径和()
    let input1 = [
        [1,3,1],
        [1,5,1],
        [4,2,1]
    ]
    let input2 = [
        [1,2,3],
        [4,5,6]
    ]
    let result = s.minPathSum(input1)
    print(result)

    assert(s.minPathSum(input1) == 7)
    assert(s.minPathSum(input2) == 12)
}

//: [Next](@next)
