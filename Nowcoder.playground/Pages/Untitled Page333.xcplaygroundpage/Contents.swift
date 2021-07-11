let string1: String? = "5"

if let line = string1, let num = Int(line) {
    enum Type: String {
        case request = "REQUEST"
        case release = "RELEASE"
    }
    
    typealias Tuple = (order: Type, number: Int)
    
    let re: [String] = [
        "REQUEST=10",
        "REQUEST=20",
        "RELEASE=0",
        "REQUEST=20",
        "REQUEST=10",
    ]
    
    var requests: [Tuple] = [Tuple]()
    for i in 0..<num {
        let line = re[i].split(separator: "=")
        if let orderType = Type.init(rawValue: String(line[0])) {
            let number: Int = Int(line[1])!
            requests.append((order: orderType, number: number))
        }
    }
    
    var initial: Int = 100
    /// 1为分配,0为未分配
    var initialSpace: [Int] = [Int].init(repeating: 0, count: initial)
    
    typealias Space = (res: Int, count: Int)
    
    var res: [Space] = [Space]()
    
    var hasRelease: Bool = false
    
    var address: Int = 0
    for item in requests {
        let order = item.order
        switch order {
        case .request:
            
            if initial < 0 {
                print("error")
                break
            } else {
                func appleAddress() {
                    initial -= item.number
                    res.append((res: address, count: item.number))
                    
                    /// 把内存地址置为1
                    print("111地址区间\(address) --- \(address + item.number)")
                    
                    for i in address..<(address + item.number) {
                        initialSpace[i] = 1
                    }
                    print("当前内存空间分布\(initialSpace)")
                    address += item.number
                }
                
                // 查看当前的内存分布情况
                if hasRelease {
                    var zeroCount: Int = 0
                    for item in initialSpace {
                        if item == 0 {
                            zeroCount += 1
                        } else {
                            break
                        }
                    }
                    print("zeroCount: \(zeroCount)")
                    if zeroCount > item.number {
                        // 直接分配前面的内存
                        print("直接分配前面的内存")
                    } else {
                        // 分配后面的内存
                        appleAddress()
                    }
                    
                } else {
                    appleAddress()
                }
            }
        case .release:
            address += item.number
            
            if let space = res.filter({ $0.res == item.number }).first {
                initial += item.number
                let start = space.res
                let count = space.count
                /// 把内存地址置为1
                print("222地址区间\(start) --- \(start + count)")

                for i in start..<(start + count) {
                    initialSpace[i] = 0
                }
                hasRelease = true
                
                print("当前内存空间分布\(initialSpace)")
            }
        }
    }
    
    let output = res.map { "\($0.res)" }.joined(separator: "\n")
    
    print(output)
}
