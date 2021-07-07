

/**
 https://www.nowcoder.com/practice/02cb8d3597cf416d9f6ae1b9ddc4fde3?tpId=37&&tqId=21268&rp=1&ru=/ta/huawei&qru=/ta/huawei/question-ranking
 
 描述
 给出一个名字，该名字有26个字符组成，定义这个字符串的“漂亮度”是其所有字母“漂亮度”的总和。
 每个字母都有一个“漂亮度”，范围在1到26之间。没有任何两个不同字母拥有相同的“漂亮度”。字母忽略大小写。

 给出多个名字，计算每个名字最大可能的“漂亮度”。

 本题含有多组数据。

 输入描述：
 整数N，后续N个名字

 输出描述：
 每个名称可能的最大漂亮程度

 示例1
 输入：
 2
 zhangsan
 lisi

 输出：
 192
 101
 */

import Foundation

func beautifulDegreeOfName(names: [String]) -> String {
    var result: [Int] = [Int]()
    for name in names {
        var dict: [String: Int] = [String: Int]()
        for i in name {
            dict[String(i)] = (dict[String(i)] ?? 0) + 1
        }
        var values = [Int](dict.values)
        values.sort() { $0 > $1 }
                
        var price = 26
        var res: Int = 0
        for i in values {
            res += i * price
            price -= 1
        }
        result.append(res)
    }
        
    return result.map { "\($0)" }.joined(separator: "\n")
}


/// 是否是Debug模式
var isDebug: Bool = true

if isDebug {
//    let num: Int = 2
    let names: [String] = [
        "zhangsan",
        "lisi"
    ]
    
    let res = beautifulDegreeOfName(names: names)
    print(res)
} else {
    while let line = readLine(), let num = Int(line) {
        var names: [String] = [String]()
        for _ in 0..<num {
            if let name = readLine() {
                names.append(name)
            }
        }
        let res = beautifulDegreeOfName(names: names)
        print(res)
    }
}

/// 一些测试用例的断言
assert(beautifulDegreeOfName(names: ["zhangsan"]) == "192")
assert(beautifulDegreeOfName(names: ["lisi"]) == "101")
assert(beautifulDegreeOfName(names: ["nhlztmyhrcgskkqyylngwrtjmgnnyqhlanhnifozalnlqozqlslwwggpbrctsrlydjlpyfttgfxuwssfxfjwikkufqepsohztibkedauxfzdanybvpqsoratfkedsklvzayjzdtmqcwmzpcurnylqgsabkrjyyzhcmgnhezxetbdeyneytoptdaroihblybnrcaaodwhgjpblpjkbzkbwnmadhsiuxpcxxgulqqlnepckvpwpxoibvkbzzhwvsrmtzuyyeirqvlsfqiudergtvqvrluwviqwputnrwiiljasnqukfzbjuscscskahypgphraxdivjirrpqlwfdeezycvbaqcwlnohktqvxdzczlawuzzenhspnyzkwchyjbrfmjsugsxzxzpqvhlxqsauvjcysvsfrqbzetoiqsjnelrvzenyhfcmpmyfvxxqfpxhcfgflcgtgzmblypayyhsnjfcnzlfdpryckqbfcmxauyrctrihcpnawwcjaloofsjfjkeebrpvhildxzmkdxggejqecolynffijajloopjvprctrwqjltnzcpwsqaohnjvvugvoxtrmbztupztnuclfxyfibdgwbiyzuyufmiqjgkuwpxsialeooiigekmdlcgawzfagqjqfgkfiyqwovvuzpycsxgeawtlanmkyzfrhkrwwwiuhniotszlnwpholdmrkyqfhovtyxfvgupphgxrfnrnuicnqsuvqevmokmxbghulakcvkxawrzraomhliazmvovmudbgniozgulobefkekwazaivwkeqdqllpzkjbvrbignizhqovmflqcwyvucixlbumoukqqklnwzjsstugspitencvqqrsnhjlmnnhoehsmchbjycglgpzhysigezanfqmeriterpkvdppqctujtvuuzjfaszdqvkygdcvrgnugmyiysyfahuwavvswfcvantdztcqgrfrzrulpevxzzowychyfvzxhevnqokmmdakiddckbzimkizpvkyifvozjynyelweinsfypuywobowvtlrubtoadjhqnledcovczrxbqnoxgqvzwqyctjsjugidnsfsmqydegtzbucheyimagfezipjnvfwmybpdflckqirvrkjsvvixpedwljhouulrtzegsdryjlmtogkatn"]) == "17234")
assert(beautifulDegreeOfName(names: ["vzsefzriolraueazkoseqcivkdpwnlnxyzpdbondojxesxlmwmkdtwspxweqqhwtghqljfcordkfpcmhiriftvwapftictpeiilrvdxsovazrgxebwjplvkaidmynqlnzytucijbhqpfwooevtqpiclvdrvnxemjzmqctiupufjgkkdwdvgnpiuqvtjartgmwvqeihtbqwefyhxyrrxdroleranrbpbpfeafpsrtiwazs"]) == "3752")

