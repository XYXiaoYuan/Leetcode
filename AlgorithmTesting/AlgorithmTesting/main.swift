///**
// https://leetcode.cn/problems/first-letter-to-appear-twice/
// 
// 给你一个由小写英文字母组成的字符串 s ，请你找出并返回第一个出现 两次 的字母。
//
// 注意：
//
// 如果 a 的 第二次 出现比 b 的 第二次 出现在字符串中的位置更靠前，则认为字母 a 在字母 b 之前出现两次。
// s 包含至少一个出现两次的字母。
//  
//
// 示例 1：
//
// 输入：s = "abccbaacz"
// 输出："c"
// 解释：
// 字母 'a' 在下标 0 、5 和 6 处出现。
// 字母 'b' 在下标 1 和 4 处出现。
// 字母 'c' 在下标 2 、3 和 7 处出现。
// 字母 'z' 在下标 8 处出现。
// 字母 'c' 是第一个出现两次的字母，因为在所有字母中，'c' 第二次出现的下标是最小的。
// 示例 2：
//
// 输入：s = "abcdd"
// 输出："d"
// 解释：
// 只有字母 'd' 出现两次，所以返回 'd' 。
//  
//
// 提示：
//
// 2 <= s.length <= 100
// s 由小写英文字母组成
// s 包含至少一个重复字母
//
//
// 来源：力扣（LeetCode）
// 链接：https://leetcode.cn/problems/first-letter-to-appear-twice
// 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
// */
//
//import Foundation
//import Darwin
//
//public class _2351_第一个出现两次的字母 /** Solution */  {
//    public init() {}
//        
//    /// 哈希表法，转化为数组中的不重复的非零元素的个数
//    func repeatedCharacter(_ s: String) -> Character {
//        var dict = [Character: Character]()
//        for c in s {
//            let char = Character(String(c))
//            if let vaule = dict[char] {
//                return vaule
//            }
//            dict[char] = char
//        }
//        return Character("")
//    }
//}
//
//extension _2351_第一个出现两次的字母 {
////    public func test() {
////        let testTime = 100
////        let minValue = 1
////        let maxValue = 100
////        let count = Int.random(in: 0...100)
////        var isSucceed = true
////        for _ in 0..<testTime {
////            let randomArr = Int.random(count: count, min: minValue, max: maxValue)
////
////            /// 方法一
////            let result = minimumOperations(randomArr)
////
////            /// 待验证的：方法二
////            let result2 = minimumOperations1(randomArr)
////
////            /// 待验证的：方法三
////            let result3 = minimumOperations2(randomArr)
////
////            if result != result2 || result != result3 {
////                isSucceed = false
////                print("randomArr = \(randomArr)")
////                break
////            }
////        }
////
////        print("\(isSucceed ? "Nice! 🎉🎉🎉" : "Oops! Fucking fucked! 💣💣💣")")
////    }
//}
//
//do {
//    let s = _2351_第一个出现两次的字母()
//    let result = s.repeatedCharacter("abccbaacz")
//    print("\(s) --- \(result)")
//
//    /// 对数器测试
////    s.test()
//}
//
////: [Next](@next)
//
