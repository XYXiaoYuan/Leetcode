/**
 https://www.nowcoder.com/practice/eaf5b886bd6645dd9cfb5406f3753e15?tpId=37&tags=&title=&difficulty=0&judgeStatus=0&rp=1

 描述
 MP3 Player因为屏幕较小，显示歌曲列表的时候每屏只能显示几首歌曲，用户要通过上下键才能浏览所有的歌曲。为了简化处理，假设每屏只能显示4首歌曲，光标初始的位置为第1首歌。


 现在要实现通过上下键控制光标移动来浏览歌曲列表，控制逻辑如下：

 歌曲总数<=4的时候，不需要翻页，只是挪动光标位置。

 光标在第一首歌曲上时，按Up键光标挪到最后一首歌曲；光标在最后一首歌曲时，按Down键光标挪到第一首歌曲。



 其他情况下用户按Up键，光标挪到上一首歌曲；用户按Down键，光标挪到下一首歌曲。



 2. 歌曲总数大于4的时候（以一共有10首歌为例）：


 特殊翻页：屏幕显示的是第一页（即显示第1 – 4首）时，光标在第一首歌曲上，用户按Up键后，屏幕要显示最后一页（即显示第7-10首歌），同时光标放到最后一首歌上。同样的，屏幕显示最后一页时，光标在最后一首歌曲上，用户按Down键，屏幕要显示第一页，光标挪到第一首歌上。



 一般翻页：屏幕显示的不是第一页时，光标在当前屏幕显示的第一首歌曲时，用户按Up键后，屏幕从当前歌曲的上一首开始显示，光标也挪到上一首歌曲。光标当前屏幕的最后一首歌时的Down键处理也类似。



 其他情况，不用翻页，只是挪动光标就行。


 输入描述：
 输入说明：
 1 输入歌曲数量
 2 输入命令 U或者D

 本题含有多组输入数据！

 输出描述：
 输出说明
 1 输出当前列表
 2 输出当前选中歌曲

 示例1
 输入：
 10
 UUUU
'
 ' 输出：
 7 8 9 10
 7

 */

import Foundation

typealias Tuple = (list: [Int], cur: Int)

enum OrderType: String {
    case up = "U"
    case down = "D"
    
    
}

func mp3CursorLocation(_ n: Int, _ orders: String) -> Tuple {
    let ods: [String] = orders.map { "\($0)" }
    
    var result = (list: [Int].init(repeating: 0, count: ods.count), cur: 0)
    
    var numbersList: [Int] = [Int]()
    for i in 0..<n {
        numbersList.append(i + 1)
    }
    
    let pageSize: Int = 4
    var top = 1
    var bottom = n
    if bottom > pageSize {
        bottom = pageSize
    }
    var idx = top
    
    func move(type: OrderType) -> Tuple {
        /// .当前选中歌曲处理
        switch type {
        case .up:
            if n > pageSize {
                if idx == 1 {
                    // 第一首往上
                    top = n - pageSize + 1
                    bottom = n
                } else if idx == top {
                    top -= 1
                    bottom -= 1
                }
            }
            idx -= 1
            if idx < 1 {
                idx = n
            }
        case .down:
            if n > pageSize {
                if idx == n {
                    // 最后一首歌往下
                    top = 1
                    bottom = pageSize
                } else if idx == bottom {
                    top += 1
                    bottom += 1
                }
            }
            idx += 1
            if idx > n {
                idx = 1
            }
        }
        
        var curList: [Int] = [Int]()
        for i in top...bottom {
            curList.append(numbersList[i - 1])
        }
        
        return (list: curList, cur: idx)
    }
    
    for od in ods {
        if let type = OrderType(rawValue: od) {
            result = move(type: type)
        }
    }
    
    return result
}

/// 是否是Debug模式
var isDebug: Bool = true

if isDebug {
    let nums: Int = 10
    let orders: String = "UUUU"
    let (list, cur) = mp3CursorLocation(nums, orders)
    print(list.map {"\($0)"}.joined(separator: " ") )
    print(cur)
} else {
    while let line = readLine(), let nums = Int(line), let orders = readLine() {
        let (list, cur) = mp3CursorLocation(nums, orders)
        print(list.map {"\($0)"}.joined(separator: " ") )
        print(cur)
    }
}

assert(mp3CursorLocation(4, "U") == (list: [1, 2, 3, 4], cur: 4))
assert(mp3CursorLocation(4, "UU") == (list: [1, 2, 3, 4], cur: 3))
assert(mp3CursorLocation(4, "D") == (list: [1, 2, 3, 4], cur: 2))
assert(mp3CursorLocation(4, "DD") == (list: [1, 2, 3, 4], cur: 3))
assert(mp3CursorLocation(3, "U") == (list: [1, 2, 3], cur: 3))
assert(mp3CursorLocation(3, "UU") == (list: [1, 2, 3], cur: 2))
assert(mp3CursorLocation(3, "D") == (list: [1, 2, 3], cur: 2))
assert(mp3CursorLocation(3, "DD") == (list: [1, 2, 3], cur: 3))


assert(mp3CursorLocation(10, "UUUU") == (list: [7, 8, 9, 10], cur: 7))
assert(mp3CursorLocation(10, "U") == (list: [7, 8, 9, 10], cur: 10))
assert(mp3CursorLocation(10, "D") == (list: [1, 2, 3, 4], cur: 2))


