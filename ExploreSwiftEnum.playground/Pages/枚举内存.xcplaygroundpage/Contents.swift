import UIKit

enum Password {
   case number(Int, Int, Int, Int)
   case other
}
var pwd = Password.number(1,2,3,4) // 占用多少个字节?
pwd = .other // 这个呢?

MemoryLayout<Password>.stride//40, 分配占用的空间大小
MemoryLayout<Password>.size//33, 实际用到的空间大小
MemoryLayout<Password>.alignment//8

enum Season {
  case spring, summer, autumn, winter
}
MemoryLayout<Season>.stride//1
MemoryLayout<Season>.size//1
MemoryLayout<Season>.alignment//1

var age = 10
MemoryLayout.stride(ofValue: age)// 8
MemoryLayout.size(ofValue: age) // 8
MemoryLayout.alignment(ofValue: age)// 8

var s0 = Season.spring// 1个字节

//原始值是Int
enum SeasonInt : Int {
    case spring = 1, summer = 2, autumn = 3, winter = 4
}
var s00 = SeasonInt.spring// 1个字节
var s01 = SeasonInt.summer// 1个字节
var s02 = SeasonInt.autumn// 1个字节

//原始值是String
enum SeasonString : String {
    //序号 0 1 2 3
    case spring = "1", summer = "2", autumn = "3", winter = "4"
}
var s10 = SeasonString.spring// 1个字节
var s11 = SeasonString.summer// 1个字节
var s12 = SeasonString.autumn// 1个字节


//思考1:Apple对原始值是怎么实现的?
//思考2:上面例子Password实际用到的空间大小为什么实33?32不行吗?

//关联值、原始值的区别?
//关联值把传进来的关联的值存放到枚举变量里面
//关联值的特点:可以传入不同的值,意味着每一个枚举变量都要有内存来存储不同的值.

var pwd1 = Password.number(10,999,10000,10000)

//原始值和枚举成员绑定在一起,固定不变的一个值.所以没有必要给它分配内存空间放到枚举变量里面
var s20 = Season.spring// 1个字节
var s21 = Season.summer// 1个字节
var s22 = Season.autumn// 1个字节

//猜测:默认值可以这样实现
enum Season3: Int {
    case spring = 1, summer, autumn, winter
    
    func rawValueX() -> Int {
        if self == .spring { return 1 }
        else if self == .summer { return 2 }
        else if self == .autumn { return 3 }
        //...
        else { return 0 }
    }
}



/// Mems一些测试
do {
    showInt()
    showEnum()
    showStruct()
    showClass()
    showArray()
    showString()
    showByteFormat()
}

class Solution {
    func smallestDifference(_ a: [Int], _ b: [Int]) -> Int {
        let aCount = a.count, bCount = b.count
        var dp = [[Int]].init(repeating: [Int].init(repeating: 0, count: bCount), count: aCount)
        
        for i in 0..<aCount {
            for j in 0..<bCount {
                dp[i][j] = min(abs(a[i] - b[j]), dp[i][j])
            }
        }

        print(dp[aCount - 1][bCount - 1])

        return 0
    }
}
