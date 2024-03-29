import Foundation
import XCTest

do {
    let s = _001_两数之和()
    let result = s.twoSum([2, 5, 11, 7], 9)
    print("\(s) --- \(result)")

    assert(s.twoSum([2, 7, 11, 15], 9) == [0,1])
    assert(s.twoSum([3,2,4], 6) == [1,2])
    assert(s.twoSum([3,3], 6) == [0,1])

//    s.runTestSuite()
}

do {
    let s = _002_两数相加()
    let node1 = ListNode.arrayToNode([2,4,3])
    let node2 = ListNode.arrayToNode([5,6,4])
    let result = s.addTwoNumbers(node1, node2)
    let answer = ListNode.arrayToNode([7,0,8])
    assert(result == answer)
    if let result = result {
        print("\(s) --- \(result)")
    }
    /// 单元测试
//    _002_两数相加.Test.defaultTestSuite.run()
    
    /// 对数器测试
    s.test()
}

do {
    let s = _008_字符串转换整数()
    let result = s.myAtoi("42")
    print("\(s) --- \(result)")

    assert(s.myAtoi("42") == 42)
    assert(s.myAtoi("   -42") == -42)
    assert(s.myAtoi("4193 with words") == 4193)
    assert(s.myAtoi("words and 987") == 0)
}

do {
    let s = _11_盛最多水的容器()
    let result = s.maxArea([1,8,6,2,5,4,8,3,7])
    print("\(s) --- \(result)")
    let answer = 49
    XCTAssertEqual(result, answer)

    /// 单元测试
    _11_盛最多水的容器.Test.defaultTestSuite.run()
    
    /// 对数器测试
    s.test()
}

do {
    let s = _018_四数之和()
    let result = s.fourSum([1,0,-1,0,-2,2], 0)
    print("\(s) --- \(result)")
}

do {
    let s = _020_有效的括号()

    let result1 = s.isValid("()")
    assert(result1 == true)
    print(result1)

    let result2 = s.isValid("()[]{}")
    assert(result2 == true)
    print(result2)
    
    let result3 = s.isValid("(]")
    assert(result3 == false)
    print(result3)

    /// 对数器测试
    s.test()
}

do {
    let s = _25_K个一组翻转链表()
    let head = ListNode.arrayToNode([1,2,3,4,5])
    let result = s.reverseKGroup(head, 2)
    if let result = result {
        print("\(s) --- \(result)")
    }
}

do {
    let s = _034_在排序数组中查找元素的第一个和最后一个位置()
    let input1: [Int] = [5,7,7,8,8,10]
    let input2: [Int] = []
    let result = s.searchRange(input1, 8)
    print("\(s) --- \(result)")

    assert(s.searchRange(input1, 8) == [3, 4])
    assert(s.searchRange(input2, 0) == [-1, -1])
}

do {
    let s = _42_接雨水()
    let result1 = s.trap([0,1,0,2,1,0,1,3,2,1,2,1])
    assert(result1 == 6)
    
    let result2 = s.trap([4,2,0,3,2,5])
    assert(result2 == 9)

    print("\(s) result1 = \(result1) ---- result2 = \(result2)")

    /// 对数器测试
    _42_接雨水.test()
}

do {
    let s = _043_字符串相乘()
    let result = s.multiply("123", "456")
    print("\(s) --- \(result)")
    
    assert(s.multiply("123", "456") == "56088")
}

do {
//    let s = _048_旋转图像()
//    var input1 = [
//        [1,2,3],
//        [4,5,6],
//        [7,8,9]
//      ]

//    let result = s.rotate(&input1)
//    print("\(s) --- \(result)")
}

do {
    let s = _051_N皇后()
    let result = s.solveNQueens(4)
    print("\(s) --- \(result)")

    assert(_051_N皇后().solveNQueens(1) == [["Q"]])
    assert(_051_N皇后().solveNQueens(2) == [])
    assert(_051_N皇后().solveNQueens(3) == [])
    assert(_051_N皇后().solveNQueens(4) == [["..Q.", "Q...", "...Q", ".Q.."], [".Q..", "...Q", "Q...", "..Q."]])
}

do {
    let s = _052_N皇后II()
    let result = s.totalNQueens(8)
    print("\(s) --- \(result)")

    assert(_052_N皇后II().totalNQueens(4) == 2)
    assert(_052_N皇后II().totalNQueens(8) == 92)
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
    let s = _055_跳跃游戏()
    let input1 = [2,3,1,1,4]
    let input2 = [3,2,1,0,4]
    let result = s.canJump(input1)
    print("\(s) --- \(result)")

    assert(s.canJump(input1) == true)
    assert(s.canJump(input2) == false)
}

do {
    let s = _61_旋转链表()
    let list = [1,2,3,4,5]
    let head = ListNode.arrayToNode(list)
    let result = s.rotateRight(head, 2)
    if let result = result {
        print("\(s) --- \(result)")
    }
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
    let s = _063_不同路径II()
    let input1 = [
        [0,0,0],
        [0,1,0],
        [0,0,0]
    ]
    let input2 = [
        [1]
    ]
    let input3 = [
        [1,0]
    ]
    let input4 = [
        [0,1],
        [0,0]
    ]
    let input5 = [
        [0,0],
        [1,1],
        [0,0]
    ]
    let input6 = [
        [0,1,0,0,0],
        [1,0,0,0,0],
        [0,0,0,0,0],
        [0,0,0,0,0]
    ]
   
    let result = s.uniquePathsWithObstacles(input5)
    print("\(s) --- \(result)")

    assert(s.uniquePathsWithObstacles(input1) == 2)
    assert(s.uniquePathsWithObstacles(input2) == 0)
    assert(s.uniquePathsWithObstacles(input3) == 0)
    assert(s.uniquePathsWithObstacles(input4) == 1)
    assert(s.uniquePathsWithObstacles(input5) == 0)
    assert(s.uniquePathsWithObstacles(input6) == 0)
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
    print("\(s) --- \(result)")

    assert(s.minPathSum(input1) == 7)
    assert(s.minPathSum(input2) == 12)
}

do {
    let s = _069_x_的平方根()
    let result = s.mySqrt(4)
    print("\(s) --- \(result)")

    assert(s.mySqrt(4) == 2)
    assert(s.mySqrt(8) == 2)
}

do {
    let s = _070_爬楼梯()
    let result = s.climbStairs(2)
    print("\(s) --- \(result)")
}

do {
//    let s = _075_颜色分类()
//    var nums: [Int] = [2,0,2,1,1,0]
//    let result = s.sortColors(&nums)
//    print("\(s) --- \(result)")
}

do {
    let s = _82_删除排序链表中的重复元素II()
    let list = [1,1,2,3,3,4,4,5]
    let head = ListNode.arrayToNode(list)
    let result = s.deleteDuplicates(head)
    if let result = result {
        print("\(s) --- \(result)")
    }
}

do {
    let s = _83_删除排序链表中的重复元素()
    let head = ListNode.arrayToNode([1,1,2,3,3])
    let result = s.deleteDuplicates(head)
    if let result = result {
        print("\(s) --- \(result)")
    }
}

do {
//    let s = _088_合并两个有序数组()
//    var nums1 = [1,2,3,0,0,0]
//    let nums2 = [2,5,6]
//    let result = s.merge(&nums1, 3, nums2, 3)
//    print("\(s) --- \(result)")
}

do {
    let s = _105_从前序与中序遍历序列构造二叉树()
    let result = s.buildTree1([3,9,20,15,7], [9,3,15,20,7])
    if let result = result {
        print("\(s) --- \(result)")
    }

    _105_从前序与中序遍历序列构造二叉树.Test.defaultTestSuite.run()
}

do {
    let s = _118_杨辉三角()
    let result = s.generate(5)
    print("\(s) --- \(result)")
}

do {
    let s = _119_杨辉三角II()
    let result = s.getRow(3)
    print("\(s) --- \(result)")
}

do {
    let s = _121_买卖股票的最佳时机()
    let input1 = [7,1,5,3,6,4]
    let input2 = [7,6,4,3,1]
    let result = s.maxProfit(input1)
    print("\(s) --- \(result)")

    assert(s.maxProfit(input1) == 5)
    assert(s.maxProfit(input2) == 0)
}

do {
    let s = _122_买卖股票的最佳时机II()
    let input1 = [7,1,5,3,6,4]
    let input2 = [1,2,3,4,5]
    let result = s.maxProfit(input1)
    print("\(s) --- \(result)")

    assert(s.maxProfit(input1) == 7)
    assert(s.maxProfit(input2) == 4)
}

do {
    let s = _125_验证回文串()
    let input1 = "A man, a plan, a canal: Panama"
    let input2 = "race a car"
    let result = s.isPalindrome(input1)
    print("\(s) --- \(result)")

    assert(s.isPalindrome(input1) == true)
    assert(s.isPalindrome(input2) == false)
}

do {
    let s = _136_只出现一次的数字()
    let input1 = [2,2,1]
    let input2 = [4,1,2,1,2]
    let result = s.singleNumber(input2)
    print("\(s) --- \(result)")

    assert(s.singleNumber(input1) == 1)
    assert(s.singleNumber(input2) == 4)
}

do {
    let s = _137_只出现一次的数字II()
    let result = s.singleNumber([2,2,3,2])
    print("\(s) --- \(result)")

    assert(s.singleNumber([2,2,3,2]) == 3)
    assert(s.singleNumber([0,1,0,1,0,1,99]) == 99)
}

do {
    let s = _152_爱生气的书店老板()
    let result = s.maxSatisfied([1,0,1,2,1,1,7,5], [0,1,0,1,0,1,0,1], 3)
    print("\(s) --- \(result)")
}

do {
    let s = _152_乘积最大子数组()
    let result = s.maxProduct([-2])
    print("\(s) --- \(result)")
}

do {
    let s = _163_缺失的区间()
    let result = s.findMissingRanges([0, 1, 3, 50, 75], 0, 99)
    print("\(s) --- \(result)")

    assert(s.findMissingRanges([0, 1, 3, 50, 75], 0, 99) == ["2", "4->49", "51->74", "76->99"])
}

do {
    let s = _164_最大间距()
    let result = s.maximumGap([3,6,9,1])
    print("\(s) --- \(result)")
}

do {
    let s = _167_两数之和_II_输入有序数组()
    let result = s.twoSum([2,7,11,15], 9)
    print("\(s) --- \(result)")

    assert(s.twoSum([2,7,11,15], 9) == [1, 2])
    assert(s.twoSum([2,3,4], 6) == [1, 3])
    assert(s.twoSum([-1,0], -1) == [1, 2])
}

do {
    let s = _168_Excel表列名称()
    let result = s.convertToTitle(52)
    print("\(s) --- \(result)")

    assert(s.convertToTitle(1) == "A")
    assert(s.convertToTitle(26) == "Z")
    assert(s.convertToTitle(28) == "AB")
    assert(s.convertToTitle(701) == "ZY")
    assert(s.convertToTitle(2147483647) == "FXSHRXW")
}

do {
    let s = _171_Excel表列序号()
    let result = s.titleToNumber("ABCD")
    print("\(s) --- \(result)")
}

do {
    let s = _179_最大数()
    let result = s.largestNumber([10,2])
    print("\(s) --- \(result)")

    assert(s.largestNumber([10,2]) == "210")
    assert(s.largestNumber([3,30,34,5,9]) == "9534330")
    assert(s.largestNumber([1]) == "1")
    assert(s.largestNumber([10]) == "10")
}

do {
    let s = _187_重复的DNA序列()
    let result = s.findRepeatedDnaSequences("AAAAACCCCCAAAAACCCCCCAAAAAGGGTTT")
    print("\(s) --- \(result)")

    assert(s.findRepeatedDnaSequences("AAAAACCCCCAAAAACCCCCCAAAAAGGGTTT") == ["AAAAACCCCC", "CCCCCAAAAA"])
//    assert(s.findRepeatedDnaSequences("AAAAAAAAAAAAA") == ["AAAAAAAAAAAAA"])
}

do {
    let s = _198_打家劫舍()
    let result1 = s.rob([1,2,3,1]) // 4
    print("\(s) --- \(result1)")

    let result2 = s.rob([2,7,9,3,1]) // 12
    print("\(s) --- \(result2)")
}

do {
    let s = _199_二叉树的右视图()
    let root = TreeNode(1,
                        TreeNode(2, nil, TreeNode(5, nil, nil)),
                        TreeNode(3, nil, TreeNode(4, nil, nil)))
    let result = s.rightSideView(root)
    print("\(s) --- \(result)")

    assert(s.rightSideView(root) == [1,3,4])
    let root1 = TreeNode(1, nil, TreeNode(3, nil, nil))
    assert(s.rightSideView(root1) == [1,3])
}

do {
//    let head = [1,2,6,3,4,5,6]
//    let val = 6
//    let s = _203_移除链表元素()
//    let result = s.removeElements(head, val)
//    print("\(s) --- \(result)")
}

do {
    let s = _209_长度最小的子数组()
    let result1 = s.minSubArrayLen(7, [2,3,1,2,4,3])
    assert(result1 == 2)
    let result2 = s.minSubArrayLen(4 ,[1,4,4])
    assert(result2 == 1)
    let result3 = s.minSubArrayLen(11 ,[1,1,1,1,1,1,1,1])
    assert(result3 == 0)

    print("\(s) result1 = \(result1) ---- result2 = \(result2) ---- result3 = \(result3)")

    /// 对数器测试
    s.test()
}

do {
    let s = _215_数组中的第K个最大元素()

    let result1 = s.findKthLargest([3,2,1,5,6,4], 2)
    assert(result1 == 5)
    print(result1)

    let result2 = s.findKthLargest([3,2,3,1,2,4,5,5,6], 4)
    assert(result2 == 4)
    print(result2)
}

do {
    let s = _217_存在重复元素()
    let result = s.containsDuplicate([1])
    print("\(s) --- \(result)")
}

do {
    let s = _224_基本计算器()
    let result = s.calculate("1+2")
    print("\(s) --- \(result)")
}

do {
    let s = _227_基本计算器II()
    let result = s.calculate("3+2*2")
    print("\(s) --- \(result)")
}

do {
    let s = _229_求众数II()
    let result = s.majorityElement([1,1,1,3,3,2,2,2])
    print("\(s) --- \(result)")

    assert(s.majorityElement([3,2,3]) == [3])
    assert(s.majorityElement([1]) == [1])
    assert(s.majorityElement([1,1,1,3,3,2,2,2]) == [1,2])
}

do {
    let s = _233_数字1的个数()
    let result = s.countDigitOne(13)
    print("\(s) --- \(result)")

    assert(s.countDigitOne(13) == 6)
    assert(s.countDigitOne(0) == 0)
}

do {
    let s = _234_回文链表()
    let head = ListNode.arrayToNode([1,2,2,1])
    let result = s.isPalindrome(head)
    print("\(s) --- \(result)")
    
    assert(s.isPalindrome(head) == true)
    /// 对数器测试
    s.test()
}

do {
    let s = _238_除自身以外数组的乘积()
    let result = s.productExceptSelf([1, 2, 3, 4])
    print("\(s) --- \(result)")
}

do {
    let s = _239_滑动窗口最大值()
    let result1 = s.maxSlidingWindow([1,3,-1,-3,5,3,6,7], 3)
    assert(result1 == [3,3,5,5,6,7])

    let result2 = s.maxSlidingWindow([1], 1)
    assert(result2 == [1])

    print("\(s) result1 = \(result1) ---- result2 = \(result2)")

    /// 对数器测试
    _239_滑动窗口最大值.test()
}

do {
    let s = _241_为运算表达式设计优先级()
    let result = s.diffWaysToCompute("2-1-1")
    print("\(s) --- \(result)")
}

do {
    let s = _257_二叉树的所有路径()
    let result = s.binaryTreePaths(TreeNode(1,TreeNode(2,nil,TreeNode(5, nil, nil)),TreeNode(3,nil, nil)))
    print("\(s) --- \(result)")
}

do {
    let s = _258_各位相加()
    let result = s.addDigits(38)
    print("\(s) --- \(result)")
}

do {
    let s = _260_只出现一次的数字III()
    let result = s.singleNumber([1,2,1,3,2,5])
    print("\(s) --- \(result)")

    assert(s.singleNumber([1,2,1,3,2,5]) == [3, 5])
    assert(s.singleNumber([-1,0]) == [-1,0])
    assert(s.singleNumber([0,1]) == [0,1])
}

do {
    let s = _264_丑数II()
    let result = s.nthUglyNumber(10)
    print("\(s) --- \(result)")
}

do {
    let s = _273_整数转换英文表示()
    let result = s.numberToWords(123)
    print(result)
    
    assert(s.numberToWords(123) == "One Hundred Twenty Three")
    assert(s.numberToWords(12345) == "Twelve Thousand Three Hundred Forty Five")
    assert(s.numberToWords(1234567) == "One Million Two Hundred Thirty Four Thousand Five Hundred Sixty Seven")
}

do {
    let s = _279_完全平方数()
    let result = s.numSquares(12)
    print("\(s) --- \(result)")

    assert(s.numSquares(12) == 3)
    assert(s.numSquares(13) == 2)
}

do {
    let s = _299_猜数字游戏()
    let result = s.getHint("1123", "0111")
    print("\(s) --- \(result)")

    assert(s.getHint("1807", "7810") == "1A3B")
    assert(s.getHint("1123", "0111") == "1A1B")
    assert(s.getHint("1", "0") == "0A0B")
    assert(s.getHint("1", "1") == "1A0B")
}

do {
    let s = _300_最长递增子序列()
    let result = s.lengthOfLIS([10,9,2,5,3,7,101,18])
    print("\(s) --- \(result)")
}

do {
//    let s = _344_反转字符串()
//    var origin: [Character] = ["h","e","l","l","o"]
//    let result = s.reverseString(&origin)
//    print("\(s) --- \(result)")
}

do {
    let s = _372_超级次方()
    let result = s.superPow(2, [3])
    print("\(s) --- \(result)")
    assert(s.superPow(2, [3]) == 8)
    assert(s.superPow(2, [1, 0]) == 1024)
    assert(s.superPow(1, [4,3,3,8,5,2]) == 1)
    assert(s.superPow(2147483647, [2, 0, 0]) == 1198)
}

do {
    let s = _378_有序矩阵中第K小的元素()
    let input1 =
    [
        [1,5,9],
        [10,11,13],
        [12,13,15]
    ]
    let input2 = [
        [-5]
    ]
    let input3 = [
        [1,2],
        [1,3]
    ]

    let result = s.kthSmallest(input1, 8)
    print("\(s) --- \(result)")

    assert(s.kthSmallest(input1, 8) == 13)
    assert(s.kthSmallest(input2, 1) == -5)
    assert(s.kthSmallest(input3, 2) == 1)
}

do {
    let s = _390_消除游戏()
    let result = s.lastRemaining(9)
    print("\(s) --- \(result)")
    
    assert(s.lastRemaining(9) == 6)
    assert(s.lastRemaining(1) == 1)
}

do {
    let s = _394_字符串解码()
    let result = s.decodeString("3[a]2[bc]")
    print("\(s) --- \(result)")
    
    assert(s.decodeString("3[a]2[bc]") == "aaabcbc")
    assert(s.decodeString("3[a2[c]]") == "accaccacc")
    assert(s.decodeString("2[abc]3[cd]ef") == "abcabccdcdcdef")
    assert(s.decodeString("abc3[cd]xyz") == "abccdcdcdxyz")
}

do {
    let s = _400_第N位数字()
    let result = s.findNthDigit(3)
    print("\(s) --- \(result)")

    assert(s.findNthDigit(3) == 3)
    assert(s.findNthDigit(11) == 0)
}

do {
    let s = _464_我能赢吗()
    let result = s.canIWin(10, 11)
    print("\(s) --- \(result)")

    /// 对数器测试
//    s.test()
}

do {
    let s = _476_数字的补数()

    let result1 = s.findComplement(5)
    assert(result1 == 2)
    print(result1)

    let result2 = s.findComplement(1)
    assert(result2 == 0)
    print(result2)

    let result3 = s.findComplement(0)
    assert(result3 == 1)
    print(result3)


    s.test()
}

do {
    let s = _494_目标和()
    let result1 = s.findTargetSumWays([1,1,1,1,1], 3)
    assert(result1 == 5)

    let result2 = s.findTargetSumWays([1], 1)
    assert(result2 == 1)

    print("\(s) result1 = \(result1) ---- result2 = \(result2)")

    /// 对数器测试
    _494_目标和.test()
}

do {
    let s = _507_完美数()
    let result = s.checkPerfectNumber(28)
    print("\(s) --- \(result)")
}

do {
    let s = _509_斐波那契数()
    let result = s.fib(92)
    print("\(s) --- \(result)")
}

do {
    let s = _552_学生出勤记录II()
    let result = s.checkRecord(2)
    print("\(s) --- \(result)")

    assert(s.checkRecord(2) == 8)
}

do {
    let s = _557_反转字符串中的单词III()
    let result = s.reverseWords("Let's take LeetCode contest")
    print("\(s) --- \(result)")
}

do {
    let s = _598_范围求和II()
    let result = s.maxCount(1,1,[[1,1]])
    print("\(s) --- \(result)")
    
    assert(s.maxCount(1,1,[[1,1]]) == 1)
    assert(s.maxCount(3,5,[[2,2],[3,3]]) == 4)
}

do {
    let s = _611_有效三角形的个数()
    let result1 = s.triangleNumber([2,2,3,4])
    assert(result1 == 3)
    let result2 = s.triangleNumber([4,2,3,4])
    assert(result2 == 4)

    print("\(s) result1 = \(result1) ---- result2 = \(result2)")
}

do {
    let s = _628_三个数的最大乘积()
    let result = s.numIdenticalPairs([1,2,3,1,1,3])
    print("\(s) --- \(result)")

    assert(s.numIdenticalPairs([1,2,3,1,1,3]) == 4)
    assert(s.numIdenticalPairs([1,1,1,1]) == 6)
    assert(s.numIdenticalPairs([1,2,3]) == 0)
}

do {
    let s = _633_平方数之和()
    let result = s.judgeSquareSum(3)
    print("\(s) --- \(result)")
    
    assert(s.judgeSquareSum(5) == true)
    assert(s.judgeSquareSum(3) == false)
}

do {
    let s = _660_移除9()
    let result = s.newInteger(9)
    print("\(s) --- \(result)")

    assert(s.newInteger(9) == 10)
}

do {
    let s = _679_24点游戏()
    let result = s.judgePoint24([4, 1, 8, 7])
    print("\(s) --- \(result)")
}

do {
    let s = _704_二分查找()

    let result1 = s.search([-1,0,3,5,9,12], 9)
    assert(result1 == 4)
    print(result1)

    let result2 = s.search([-1,0,3,5,9,12], 2)
    assert(result2 == -1)
    print(result2)

    /// 对数器测试
    s.test()
}

do {
    let s = _714_买卖股票的最佳时机含手续费()
    let input1 = [1, 3, 2, 8, 4, 9]
    let input2 = [1,3,7,5,10,3]
    let result = s.maxProfit(input1, 2)
    print("\(s) --- \(result)")

    assert(s.maxProfit(input1, 2) == 8)
    assert(s.maxProfit(input2, 3) == 6)
}

do {
    let s = _735_行星碰撞()
    let result = s.asteroidCollision([5,10,-5])
    print("\(s) --- \(result)")

    /// 对数器测试
    s.test()
}

do {
    let s = _739_每日温度()
    let result1 = s.dailyTemperatures([73,74,75,71,69,72,76,73])
    assert(result1 == [1,1,4,2,1,1,0,0])
    
    let result2 = s.dailyTemperatures([30,40,50,60])
    assert(result2 == [1,1,1,0])

    let result3 = s.dailyTemperatures([30,60,90])
    assert(result3 == [1,1,0])

    print("\(s) result1 = \(result1) ---- result2 = \(result2) ---- result3 = \(result3)")

    /// 对数器测试
    _739_每日温度.test()
}

do {
    let s = _740_删除并获得点数()
    let result = s.deleteAndEarn([2,2,3,3,3,4])
    print("\(s) --- \(result)")
}

do {
    let s = _746_使用最小花费爬楼梯()
    let result = s.minCostClimbingStairs([1, 100])
    print("\(s) --- \(result)")

    assert(s.minCostClimbingStairs([10, 15, 20]) == 15)
    assert(s.minCostClimbingStairs([1, 100, 1, 1, 1, 100, 1, 1, 100, 1]) == 6)
}

do {
    let s = _796_旋转字符串()
    let result1 = s.rotateString("aa", "a")
    let result2 = s.rotateString("abcde", "cdeab")
    let result3 = s.rotateString("abcde", "abced")
    print("\(s) --- \(result1), --- \(result2), ---- \(result3)")

    /// 对数器测试
    s.test()
}

do {
    let s = _829_连续整数求和()
    let result = s.consecutiveNumbersSum(15)
    print("\(s) --- \(result)")

    assert(s.consecutiveNumbersSum(5) == 2)
    assert(s.consecutiveNumbersSum(9) == 3)
    assert(s.consecutiveNumbersSum(15) == 4)
}

do {
    let s = _832_翻转图像()
    let result = s.flipAndInvertImage([[1,1,0],[1,0,1],[0,0,0]])
    print("\(s) --- \(result)")
}

do {
    let s = _836_矩形重叠()
    let result = s.isRectangleOverlap([0,0,2,2], [1,1,3,3])
    print("\(s) --- \(result)")

    assert(s.isRectangleOverlap([0,0,2,2], [1,1,3,3]) == true)
    assert(s.isRectangleOverlap([0,0,1,1], [1,0,2,1]) == false)
    assert(s.isRectangleOverlap([0,0,1,1], [2,2,3,3]) == false)
}

do {
    let s = _867_转置矩阵()
    let result = s.transpose([[1,2,3],[4,5,6]])
    print("\(s) --- \(result)")
}

do {
    let s = _876_链表的中间结点()
    let node = ListNode.arrayToNode([1,2,3,4,5])
    let result = s.middleNode(node)
    let answer = ListNode.arrayToNode([3,4,5])
    if let result = result {
        print("\(s) --- \(result)")
    }

    assert(result == answer)
    
    s.runTestSuite()
}

do {
    let s = _918_环形子数组的最大和()
    let input1 = [1,-2,3,-2]
    let input2 = [5,-3,5]
    let result = s.maxSubarraySumCircular(input1)
    print("\(s) --- \(result)")

    assert(s.maxSubarraySumCircular(input1) == 3)
    assert(s.maxSubarraySumCircular(input2) == 10)
}

do {
    let s = _921_使括号有效的最少添加()
    let result1 = s.minAddToMakeValid("())")
    assert(result1 == 1)
    
    let result2 = s.minAddToMakeValid("(((")
    assert(result2 == 3)

    print("\(s) result1 = \(result1) ---- result2 = \(result2)")

    /// 对数器测试
    _921_使括号有效的最少添加.test()
}

do {
    let s = _946_验证栈序列()
    let result1 = s.validateStackSequences([1,2,3,4,5], [4,5,3,2,1])
    assert(result1 == true)
    let result2 = s.validateStackSequences([1,2,3,4,5], [4,3,5,1,2])
    assert(result2 == false)

    print("\(s) result1 = \(result1) ---- result2 = \(result2)")

    /// 对数器测试
    s.test()
}

do {
    let s = _994_腐烂的橘子()

    let result1 = s.orangesRotting([[2,1,1],[1,1,0],[0,1,1]])
    assert(result1 == 4)
    print(result1)

    let result2 = s.orangesRotting([[2,1,1],[0,1,1],[1,0,1]])
    assert(result2 == -1)
    print(result2)

    let result3 = s.orangesRotting([[0,2]])
    assert(result3 == 0)
    print(result3)

    s.test()
}

do {
    let s = _1104_二叉树寻路()
    let result = s.pathInZigZagTree(26)
    print(result)
    
    assert(s.pathInZigZagTree(14) == [1,3,4,14])
    assert(s.pathInZigZagTree(26) == [1,2,6,10,26])
}

do {
    let s = _1134_阿姆斯特朗数()
    let result = s.isArmstrong(153)
    print("\(s) --- \(result)")
}

do {
    let s = _1137_第N个泰波那契数()
    let result = s.tribonacci(4)
    print("\(s) --- \(result)")

    assert(s.tribonacci(4) == 4)
    assert(s.tribonacci(25) == 1389537)
}

do {
    let s = _1154_一年中的第几天()
    let result = s.dayOfYear("2019-01-09")
    print("\(s) --- \(result)")

    assert(s.dayOfYear("2019-01-09") == 9)
    assert(s.dayOfYear("2019-02-10") == 41)
    assert(s.dayOfYear("2003-03-01") == 60)
    assert(s.dayOfYear("2004-03-01") == 61)
}

do {
    let s = _1178_猜字谜()
    let result = s.findNumOfValidWords(["aaaa","asas","able","ability","actt","actor","access"], ["aboveyz","abrodyz","abslute","absoryz","actresz","gaswxyz"])
    print("\(s) --- \(result)")
}

do {
    let s = _1185_一周中的第几天()
    let result = s.dayOfTheWeek(31, 8, 2019)
    print("\(s) --- \(result)")

    assert(s.dayOfTheWeek(31, 8, 2019) == "Saturday")
    assert(s.dayOfTheWeek(18, 7, 1999) == "Sunday")
    assert(s.dayOfTheWeek(15, 8, 1993) == "Sunday")
}

do {
    let s = _1196_最多可以买到的苹果数量()
    let result = s.maxNumberOfApples([100,200,150,1000])
    print("\(s) --- \(result)")
    assert(s.maxNumberOfApples([100,200,150,1000]) == 4)
    assert(s.maxNumberOfApples([900,950,800,1000,700,800]) == 5)
}

do {
    let s = _1201_丑数III()
    let result = s.nthUglyNumber(3, 2, 3, 5)
    print("\(s) --- \(result)")

    //assert(s.maxValue(input1) == 12)
}

do {
    let s = _1218_最长定差子序列()
    let result = s.longestSubsequence([1,2,3,4], 1)
    print("\(s) --- \(result)")

    assert(s.longestSubsequence([1,2,3,4], 1) == 4)
    assert(s.longestSubsequence([1,3,5,7], 1) == 1)
    assert(s.longestSubsequence([1,5,7,8,5,3,4,2,1], -2) == 4)
}

do {
    let s = _1222_可以攻击国王的皇后()
    let result = s.queensAttacktheKing([[0,1],[1,0],[4,0],[0,4],[3,3],[2,4]], [0,0])
    print("\(s) --- \(result)")
}

do {
    let s = _1228_等差数列中缺失的数字()
    let result = s.missingNumber([15, 13, 12])
    print("\(s) --- \(result)")
}

do {
    let s = _1252_奇数值单元格的数目()
    let result = s.oddCells(2, 3, [[0,1],[0,0]])
    print("\(s) --- \(result)")

    /// 对数器测试
    s.test()
}

do {
    let s = _1290_二进制链表转整数()
    let head = ListNode.arrayToNode([1,0,1])
    let result = s.getDecimalValue(head)
    print("\(s) --- \(result)")
}

do {
    let s = _1314_矩阵区域和()

    let result1 = s.matrixBlockSum([[1,2,3],[4,5,6],[7,8,9]], 1)
    assert(result1 == [[12,21,16],[27,45,33],[24,39,28]])
    print(result1)

    let result2 = s.matrixBlockSum([[1,2,3],[4,5,6],[7,8,9]], 2)
    assert(result2 == [[45,45,45],[45,45,45],[45,45,45]])
    print(result2)
}

do {
    let s = _1323_6和9组成的最大数字()
    let result = s.maximum69Number(9669)
    print("\(s) --- \(result)")

    assert(s.maximum69Number(9669) == 9969)
    assert(s.maximum69Number(9996) == 9999)
    assert(s.maximum69Number(9999) == 9999)
}

do {
    let s = _1411_给Nx3网格图涂色的方案数()
    let result = s.numOfWays(1)
    print("\(s) --- \(result)")

    assert(s.numOfWays(1) == 12)
    assert(s.numOfWays(2) == 54)
    assert(s.numOfWays(3) == 246)
    assert(s.numOfWays(7) == 106494)
}

do {
    let s = _1413_逐步求和得到正数的最小值()

    let result1 = s.minStartValue([-3,2,-3,4,2])
    let result2 = s.minStartValue([1,2])
    let result3 = s.minStartValue([1,-2,-3])
    assert(result1 == 5)
    assert(result2 == 1)
    assert(result3 == 5)
    print("\(s) --- \(result1),\(result2),\(result3)")

    /// 对数器测试
//    s.test()
}

do {
    let s = _1475_商品折扣后的最终价格()
    let result1 = s.finalPrices([8,4,6,2,3])
    assert(result1 == [4,2,4,2,3])
    let result2 = s.finalPrices([1,2,3,4,5])
    assert(result2 == [1,2,3,4,5])
    let result3 = s.finalPrices([10,1,1,6])
    assert(result3 == [9,0,1,6])

    print("\(s) result1 = \(result1) ---- result2 = \(result2) ---- result3 = \(result3)")

    /// 对数器测试
    s.test()
}

do {
    let s = _1496_判断路径是否相交()

    let result1 = s.isPathCrossing("NES")
    assert(result1 == false)
    print(result1)

    let result2 = s.isPathCrossing("NESWW")
    assert(result2 == true)
    print(result2)
    
    s.test()
}

do {
    let s = _1512_好数对的数目()
    let result = s.numIdenticalPairs([1,2,3,1,1,3])
    print("\(s) --- \(result)")

    assert(s.numIdenticalPairs([1,2,3,1,1,3]) == 4)
    assert(s.numIdenticalPairs([1,1,1,1]) == 6)
    assert(s.numIdenticalPairs([1,2,3]) == 0)
}

do {
    let s = _1641_统计字典序元音字符串的数目()
    let result1 = s.countVowelStrings(1)
    assert(result1 == 5)
    let result2 = s.countVowelStrings(2)
    assert(result2 == 15)
    let result3 = s.countVowelStrings(33)
    assert(result3 == 66045)

    print("\(s) result1 = \(result1) ---- result2 = \(result2) ---- result3 = \(result3)")
    
    /// 对数器测试
    s.test()
}

do {
    let s = _1805_字符串中不同整数的数目()
    let result = s.numDifferentIntegers("a123bc34d8ef34")
    print("\(s) --- \(result)")
    assert(s.numDifferentIntegers("a123bc34d8ef34") == 3)
    assert(s.numDifferentIntegers("leet1234code234") == 2)
    assert(s.numDifferentIntegers("a1b01c001") == 1)
}

do {
    let s = _1814_统计一个数组中好对子的数目()

    let result1 = s.countNicePairs0([42,11,1,97])
    assert(result1 == 2)

    let result2 = s.countNicePairs0([13,10,35,24,76])
    assert(result2 == 4)
    print("\(s) --- \(result1), --- \(result2)")

    /// 对数器测试
    s.test()
}

do {
    let s = _1930_长度为3的不同回文子序列()
    let result = s.countPalindromicSubsequence("aabca")
    print("\(s) --- \(result)")

    assert(s.countPalindromicSubsequence("aabca") == 3)
    assert(s.countPalindromicSubsequence("adc") == 0)
    assert(s.countPalindromicSubsequence("bbcbaba") == 4)
}

do {
    let s = _1979_找出数组的最大公约数()
    let result = s.findGCD([2,5,6,9,10])
    print("\(s) --- \(result)")
    assert(s.findGCD([2,5,6,9,10]) == 2)
    assert(s.findGCD([7,5,6,8,3]) == 1)
    assert(s.findGCD([3,3]) == 3)
}

do {
    let s = _2264_字符串中最大的3位相同数字()

    let result1 = s.largestGoodInteger("6777133339")
    assert(result1 == "777")
    print(result1)

    let result2 = s.largestGoodInteger("2300019")
    assert(result2 == "000")
    print(result2)

    let result3 = s.largestGoodInteger("42352338")
    assert(result3 == "")
    print(result3)

    s.test()
}

do {
    let s = _2347_最好的扑克手牌()

    let result1 = s.bestHand([13,2,3,1,9], ["a","a","a","a","a"])
    assert(result1 == "Flush")
    print(result1)

    let result2 = s.bestHand([4,4,2,4,4], ["d","a","a","b","c"])
    assert(result2 == "Three of a Kind")
    print(result2)

    let result3 = s.bestHand([10,10,2,12,9], ["a","b","c","a","d"])
    assert(result3 == "Pair")
    print(result3)

    let result4 = s.bestHand([2,10,7,10,7], ["a","b","a","d","b"])
    assert(result4 == "Pair")
    print(result4)

    s.test()
}

do {
    let s = _2351_第一个出现两次的字母()
    let result = s.repeatedCharacter("abccbaacz")
    print("\(s) --- \(result)")

    /// 对数器测试
//    s.test()
}


do {
    let s = _2389_和有限的最长子序列()
    let result1 = s.answerQueries([1,2,4,5], [3,10,21])
    assert(result1 == [2,3,4])
    let result2 = s.answerQueries([2,3,4,5], [1])
    assert(result2 == [0])

    print("\(s) result1 = \(result1) ---- result2 = \(result2)")
}

do {
    let s = _2390_从字符串中移除星号()
    let result1 = s.removeStars("leet**cod*e")
    assert(result1 == "lecoe")
    let result2 = s.removeStars("erase*****")
    assert(result2 == "")

    print("\(s) result1 = \(result1) ---- result2 = \(result2)")

    /// 对数器测试
    s.test()
}

do {
    let s = _2391_收集垃圾的最少总时间()
    let result1 = s.garbageCollection(["G","P","GP","GG"], [2,4,3])
    assert(result1 == 21)
    let result2 = s.garbageCollection(["MMM","PGM","GP"], [3,10])
    assert(result2 == 37)

    print("\(s) result1 = \(result1) ---- result2 = \(result2)")
    
    /// 对数器测试
    s.test()
}

do {
    let s = _2446_判断两个事件是否存在冲突()
    let result1 = s.haveConflict(["01:15","02:00"], ["02:00","03:00"])
    assert(result1 == true)

    let result2 = s.haveConflict(["01:00","02:00"], ["01:20","03:00"])
    assert(result2 == true)

    let result3 = s.haveConflict(["10:00","11:00"], ["14:00","15:00"])
    assert(result3 == false)

    print("\(s) result1 = \(result1) ---- result2 = \(result2) ---- result3 = \(result3)")

    /// 对数器测试
    _2446_判断两个事件是否存在冲突.test()
}

do {
    let s = _2706_购买两块巧克力()

    let result1 = s.buyChoco([1,2,2], 3)
    assert(result1 == 0)
    print(result1)

    let result2 = s.buyChoco([3,2,3], 3)
    assert(result2 == 3)
    print(result2)

    let result3 = s.buyChoco([98,54,6,34,66,63,52,39], 62)
    assert(result3 == 22)
    print(result3)

    s.test()
}

do {
    let s = _6132_使数组中所有元素都等于零()
    let result = s.minimumOperations([1,5,0,3,5])
    print("\(s) --- \(result)")

    /// 对数器测试
    s.test()
}

do {
    let s = _6141_合并相似的物品()
    let result1 = s.mergeSimilarItems([[1,1],[4,5],[3,8]], [[3,1],[1,5]])
    assert(result1 == [[1,6],[3,9],[4,5]])
    
    let result2 = s.mergeSimilarItems([[1,1],[3,2],[2,3]], [[2,1],[3,2],[1,3]])
    assert(result2 == [[1,4],[2,4],[3,4]])

    let result3 = s.mergeSimilarItems([[1,3],[2,2]], [[7,1],[2,2],[1,4]])
    assert(result3 == [[1,7],[2,4],[7,1]])
    
    print("\(s) --- \(result1) --- \(result2) --- \(result3)")
}

do {
    let s = _6142_统计坏数对的数目()

    let result1 = s.countBadPairs([4,1,3,3])
    assert(result1 == 5)
    
    let result2 = s.countBadPairs([1,2,3,4,5])
    assert(result2 == 0)

    print("\(s) --- \(result1) --- \(result2)")

    /// 对数器测试
    s.test()
}

do {
    let s = _6152_赢得比赛需要的最少训练时长()

    let result1 = s.minNumberOfHours(5, 3, [1,4,3,2], [2,6,3,1])
    assert(result1 == 8)
    print(result1)

    let result2 = s.minNumberOfHours(2, 4, [1], [3])
    assert(result2 == 0)
    print(result2)

    let result3 = s.minNumberOfHours(1, 1, [1,1,1,1], [1,1,1,50])
    assert(result3 == 51)
    print(result3)

    let result4 = s.minNumberOfHours(5, 3, [1,4], [2,5])
    assert(result4 == 2)
    print(result4)

    print("\(s) --- \(result1) --- \(result2) --- \(result3) --- \(result4)")

    /// 对数器测试
//    s.test()
}

do {
    let s = _6167_检查相同字母间的距离()
    let result1 = s.checkDistances("abaccb", [1,3,0,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])
    assert(result1 == true)
    let result2 = s.checkDistances("aa", [1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])
    assert(result2 == false)
    let result3 = s.checkDistances("zz", [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1])

    print("\(s) result1 = \(result1) ---- result2 = \(result2) ---- result3 = \(result3)")

    /// 对数器测试
//    s.test()
}

do {
    let s = _6168_恰好移动k步到达某一位置的方法数目()
    let result1 = s.numberOfWays(1,2,3)
    assert(result1 == 3)
    let result2 = s.numberOfWays(2,5,10)
    assert(result2 == 0)

    print("\(s) result1 = \(result1) ---- result2 = \(result2)")

    /// 对数器测试
    _6168_恰好移动k步到达某一位置的方法数目.test()
}

do {
    let s = _6204_与对应负数同时存在的最大正整数()
    let result1 = s.findMaxK([-1,2,-3,3])
    assert(result1 == 3)

    let result2 = s.findMaxK([-1,10,6,7,-7,1])
    assert(result2 == 7)

    let result3 = s.findMaxK([-10,8,6,7,-2,-3])
    assert(result3 == -1)

    print("\(s) result1 = \(result1) ---- result2 = \(result2) ---- result3 = \(result3)")

    /// 对数器测试
    _6204_与对应负数同时存在的最大正整数.test()
}

do {
    let s = _6205_反转之后不同整数的数目()
    let result1 = s.countDistinctIntegers([1,13,10,12,31])
    assert(result1 == 6)
    
    let result2 = s.countDistinctIntegers([2,2,2])
    assert(result2 == 1)

    print("\(s) result1 = \(result1) ---- result2 = \(result2)")
    
    /// 对数器测试
    _6205_反转之后不同整数的数目.test()
}

do {
    let s = _6219_反转之后的数字和()
    let result1 = s.sumOfNumberAndReverse(443)
    assert(result1 == true)

    let result2 = s.sumOfNumberAndReverse(63)
    assert(result2 == false)

    let result3 = s.sumOfNumberAndReverse(181)
    assert(result3 == true)

    print("\(s) result1 = \(result1) ---- result2 = \(result2) ---- result3 = \(result3)")

    /// 对数器测试
    _6219_反转之后的数字和.test()
}

//: [Next](@next)

