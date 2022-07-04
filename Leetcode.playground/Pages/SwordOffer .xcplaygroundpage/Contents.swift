import UIKit

do {
    let s = _剑指Offer03_数组中重复的数字()
    let result = s.findRepeatNumber([2, 3, 1, 0, 2, 5, 3])
    print("\(s) --- \(result)")

    assert(s.findRepeatNumber([2, 3, 1, 0, 2, 5, 3]) == 2)
}

do {
    let s = _剑指Offer10II_青蛙跳台阶问题()
    let result = s.numWays(2)
    print("\(s) --- \(result)")

    assert(s.numWays(2) == 2)
    assert(s.numWays(7) == 21)
    assert(s.numWays(0) == 1)
}

do {
    let s = _剑指Offer13_机器人的运动范围()
    let result = s.movingCount(2, 3, 1)
    print("\(s) --- \(result)")

    assert(s.movingCount(2, 3, 1) == 3)
    assert(s.movingCount(3, 1, 0) == 1)
    assert(s.movingCount(3, 2, 17) == 6)
}

do {
    let s = _剑指Offer16_数值的整数次方()
    let result = s.myPow(2.00000, 10)
    print("\(s) --- \(result)")
}

do {
    let s = _剑指Offer17_打印从1到最大的n位数()
    let result = s.printNumbers(2)
    print("\(s) --- \(result)")
}

do {
    let s = _剑指Offer20_表示数值的字符串()
    let result = s.isNumber("0")
    print("\(s) --- \(result)")

    assert(s.isNumber("0") == true)
    assert(s.isNumber("e") == false)
    assert(s.isNumber(".") == false)
    assert(s.isNumber("    .1  ") == true)
}

do {
    let s = _剑指Offer21_调整数组顺序使奇数位于偶数前面()
//    let input1 = [1,2,3,4]
    let input2 = [2,16,3,5,13,1,16,1,12,18,11,8,11,11,5,1]
    let result = s.exchange(input2)
    print("\(s) --- \(result)")
}

do {
    let s = _剑指OfferII_023_两个链表的第一个重合节点()
    let headA = ListNode.arrayToNode([4,1,8,4,5])
    let headB = ListNode.arrayToNode([5,0,1,8,4,5])
    let result = s.getIntersectionNode(headA, headB)
    if let result = result {
        print("\(s) --- \(result.log())")
    }
}

do {
    let s = _剑指Offer29_顺时针打印矩阵()
    let input1 = [[1,2,3],[4,5,6],[7,8,9]]
    let input2 = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]
    let result = s.spiralOrder(input1)
    print("\(s) --- \(result)")

    assert(s.spiralOrder(input1) == [1,2,3,6,9,8,7,4,5])
    assert(s.spiralOrder(input2) == [1,2,3,4,8,12,11,10,9,5,6,7])
}

do {
    let s = _剑指Offer38_字符串的排列()
    let result = s.permutation("abc")
    print("\(s) --- \(result)")
}

do {
    let s = _剑指Offer39_数组中出现次数超过一半的数字()
    let result = s.majorityElement([1, 2, 3, 2, 2, 2, 5, 4, 2])
    print("\(s) --- \(result)")
}

do {
    let s = _剑指Offer42_连续子数组的最大和()
    let result = s.maxSubArray([-2,1,-3,4,-1,2,1,-5,4])
    print("\(s) --- \(result)")
}

do {
    let s = _剑指Offer43_1～n整数中1出现的次数()
    let result = s.countDigitOne(13)
    print("\(s) --- \(result)")

    assert(s.countDigitOne(13) == 6)
    assert(s.countDigitOne(0) == 0)
}

do {
    let s = _剑指Offer45_把数组排成最小的数()
    let result = s.minNumber([0, 0])
    print("\(s) --- \(result)")

    assert(s.minNumber([10,2]) == "102")
    assert(s.minNumber([3,30,34,5,9]) == "3033459")
    assert(s.minNumber([0]) == "0")
    assert(s.minNumber([0,0]) == "00")
}

do {
    let s = _剑指Offer47礼物的最大价值()
    let input1 = [
        [1,3,1],
        [1,5,1],
        [4,2,1]
      ]
    let input2 = [
        [1,2,5],
        [3,2,1]
    ]
    let result = s.maxValue(input2)
    print("\(s) --- \(result)")

    assert(s.maxValue(input1) == 12)
    //assert(s.maxValue(input2) == 12)
}

do {
    let s = _剑指Offer49_丑数()
    let result = s.nthUglyNumber(10)
    print("\(s) --- \(result)")
}

do {
    let s = _剑指Offer51_数组中的逆序对()
    let result = s.reversePairs([7,5,6,4])
    print("\(s) --- \(result)")

    assert(s.reversePairs([7,5,6,4]) == 5)
}

do {
    let s = _剑指Offer56_II_数组中数字出现的次数II()
    let input1 = [3,4,3,3]
    let input2 = [9,1,7,9,7,9,7]
    let result = s.singleNumber(input1)
    print("\(s) --- \(result)")

    assert(s.singleNumber(input1) == 4)
    assert(s.singleNumber(input2) == 1)
}

do {
    let s = _剑指Offer57_II_和为s的连续正数序列()
    let result = s.findContinuousSequence(10)
    print("\(s) --- \(result)")

    assert(s.findContinuousSequence(9) == [[2,3,4],[4,5]])
    assert(s.findContinuousSequence(15) == [[1,2,3,4,5],[4,5,6],[7,8]])
}

do {
    let s = _剑指Offer58_I_翻转单词顺序()
    let result = s.reverseWords("the sky is blue")
    print("\(s) --- \(result)")

    assert(s.reverseWords("the sky is blue") == "blue is sky the")
    assert(s.reverseWords("  hello world!  ") == "world! hello")
    assert(s.reverseWords("a good   example") == "example good a")
}

do {
    let s = _剑指Offer60_n个骰子的点数()
    let result = s.dicesProbability(2)
    print("\(s) --- \(result)")
}

do {
    let s = _剑指Offer61_扑克牌中的顺子()
    let input1 = [1, 2, 3, 4, 5]
    let input2 = [0, 0, 1, 2, 5]
    let input3 = [0, 0, 8, 5, 4]
    let input4 = [8, 7, 11, 0, 9]
    let input5 = [0, 0, 2, 2, 5]
    let input6 = [11, 0, 9, 0, 0]
    let result = s.isStraight(input6)
    print("\(s) --- \(result)")

    assert(s.isStraight(input1) == true)
    assert(s.isStraight(input2) == true)
    assert(s.isStraight(input3) == true)
    assert(s.isStraight(input4) == true)
    assert(s.isStraight(input5) == false)
    assert(s.isStraight(input6) == true)
}

do {
    let s = _剑指Offer63_股票的最大利润()
    let input1 = [7,1,5,3,6,4]
    let input2 = [7,6,4,3,1]
    let result = s.maxProfit(input1)
    print("\(s) --- \(result)")

    assert(s.maxProfit(input1) == 5)
    assert(s.maxProfit(input2) == 0)
}

do {
    let s = _剑指Offer66_构建乘积数组()
    let input1 = [1, 2, 3, 4, 5]
//    let input2 = [1, 2, 0, 4, 5]
    let input3 = [1, 2, 0, 4, 0]
    let result = s.constructArr(input3)
    print("\(s) --- \(result)")

    assert(s.constructArr(input1) == [120,60,40,30,24])
}
