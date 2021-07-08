/**
 https://www.nowcoder.com/practice/119bcca3befb405fbe58abe9c532eb29?tpId=37&&tqId=21240&rp=1&ru=/ta/huawei&qru=/ta/huawei/question-ranking
 
 描述
 开发一个坐标计算工具， A表示向左移动，D表示向右移动，W表示向上移动，S表示向下移动。从（0,0）点开始移动，从输入字符串里面读取一些坐标，并将最终输入结果输出到输出文件里面。

 输入：

 合法坐标为A(或者D或者W或者S) + 数字（两位以内）

 坐标之间以;分隔。

 非法坐标点需要进行丢弃。如AA10;  A1A;  $%$;  YAD; 等。

 下面是一个简单的例子 如：

 A10;S20;W10;D30;X;A1A;B10A11;;A10;

 处理过程：

 起点（0,0）

 +   A10   =  （-10,0）

 +   S20   =  (-10,-20)

 +   W10  =  (-10,-10)

 +   D30  =  (20,-10)

 +   x    =  无效

 +   A1A   =  无效

 +   B10A11   =  无效

 +  一个空 不影响

 +   A10  =  (10,-10)

 结果 （10， -10）

 注意请处理多组输入输出

 输入描述：
 一行字符串

 输出描述：
 最终坐标，以逗号分隔

 示例1
 输入：
 A10;S20;W10;D30;X;A1A;B10A11;;A10;
 
 输出：
 10,-10

*/

import Foundation

typealias Tuple = (x: Int, y: Int)

func match(_ str: String) -> Bool {
    if let regex = try? NSRegularExpression(pattern: "^[A|D|S|W]\\d{1,2}$", options: []) {
        let matches = regex.matches(in: str, options: [], range: NSRange(location: 0, length: str.count))
        return matches.count > 0
    }
    return false
//        let regex = "^[A|D|S|W]\\d{2}$"
//        let predicte = NSPredicate(format: "SELF MATCHES %@", regex)
//        return predicte.evaluate(with: str)
}

enum Direcation: Character {
    case left = "A"
    case right = "D"
    case forword = "W"
    case backword = "S"
    
    func moveWithDirection(originX: inout Int, originY: inout Int, step: Int) -> Tuple {
        switch self {
        case .left:
            originX -= step
        case .right:
            originX += step
        case .forword:
            originY += step
        case .backword:
            originY -= step
        }
        return (x: originX, y: originY)
    }
}

func coordinateMove(_ line: String) -> Tuple {
    let array = line.components(separatedBy: ";").filter { match($0) }
        
    var point: Tuple = (x: 0, y: 0)
    for var item in array {
        let direction = item.removeFirst()
        let num = item.filter { $0 != direction }
                
        if let d = Direcation(rawValue: direction), let num = Int(String(num)) {
           point = d.moveWithDirection(originX: &point.x, originY: &point.y, step: num)
        }
    }
    
    let x = point.x
    let y = point.y
    
    return (x: x, y: y)
}

/// 是否是Debug模式
var isDebug: Bool = false

if isDebug {
    let line: String = "A10;S20;W10;D30;X;A1A;B10A11;;A10;"
    let (x, y) = coordinateMove(line)
    print("\(x),\(y)")
} else {
    while let line = readLine() {
        let (x, y) = coordinateMove(line)
        print("\(x),\(y)")
    }
}

assert(coordinateMove("A10;S20;W10;D30;X;A1A;B10A11;;A10;") == (x: 10, y: -10))
