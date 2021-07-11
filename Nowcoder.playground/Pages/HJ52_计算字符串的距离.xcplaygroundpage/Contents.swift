/**
 https://www.nowcoder.com/practice/3959837097c7413a961a135d7104c314?tpId=37&&tqId=21275&rp=1&ru=/ta/huawei&qru=/ta/huawei/question-ranking
 
 描述
 Levenshtein 距离，又称编辑距离，指的是两个字符串之间，由一个转换成另一个所需的最少编辑操作次数。许可的编辑操作包括将一个字符替换成另一个字符，插入一个字符，删除一个字符。编辑距离的算法是首先由俄国科学家Levenshtein提出的，故又叫Levenshtein Distance。

 Ex：

 字符串A:abcdefg

 字符串B: abcdef

 通过增加或是删掉字符”g”的方式达到目的。这两种方案都需要一次操作。把这个操作所需要的次数定义为两个字符串的距离。

 要求：

 给定任意两个字符串，写出一个算法计算它们的编辑距离。



 本题含有多组输入数据。


 输入描述：
 每组用例一共2行，为输入的两个字符串

 输出描述：
 每组用例输出一行，代表字符串的距离

 示例1
 输入：
 abcdefg
 abcdef
 abcde
 abcdf
 abcde
 bcdef
 复制
 输出：
 1
 1
 2
 复制

 */

func minEditDistance(_ word1: String, _ word2: String) -> Int {
    if word1.count == 0 || word2.count == 0 {
        return 0
    }
    
    let cs1 = word1.map { "\($0)" }
    let cs2 = word2.map { "\($0)" }

    var dp: [[Int]] = Array.init(repeating: [Int].init(repeating: 0, count: cs2.count + 1), count: cs1.count + 1)
    dp[0][0] = 0
    
    // 第0列
    for i in 1...cs1.count {
        dp[i][0] = i
    }
    
    // 第0行
    for j in 1...cs2.count {
        dp[0][j] = j
    }
    
    // 其它列和其它行
    for i in 1...cs1.count {
        for j in 1...cs2.count {
            let top = dp[i - 1][j] + 1
            let left = dp[i][j - 1] + 1
            
            var leftTop: Int = dp[i - 1][j - 1]
            if cs1[i - 1] != cs2[j - 1] {
                leftTop += 1
            }
            
            dp[i][j] = min(min(top, left), leftTop)
        }
    }
    
    return dp[cs1.count][cs2.count]
}

/// 是否是Debug模式
var isDebug: Bool = true

if isDebug {
    let str1 = "ixfkieaaocalmxhfifyadnouljtezrnpnfoenespcaenyvzcjtppsaxegmeytqrkvdwugvouskcnnqnmhepquncvyvgkansquaotkgvlvplktrabaikeuubfupunpztpvvzdqaqgfmtzxlcxsipltzwjegpqjzclclvjsmqbmiyzvcujpvhupyhvhhjq"
    let str2 = "ganxioafstgdpceecubqrngumbpjvwxdpzmragsunvfnmejbcvsoydtbbewybygpsmmyjuvezn"
    let result = minEditDistance(str1, str2)
    print(result)
} else {
    while let str1 = readLine(), let str2 = readLine() {
        let result = minEditDistance(str1, str2)
        print(result)
    }
}

/// 全局打印,发布时不触发, isDebug == false时不打印
public func dprint<T>(_ msg: T,
                      line: Int = #line) {
    if isDebug {
        let prefix = "🏷_\(line)"
        print(prefix, msg)
    }
}

assert(minEditDistance("abcdefg", "abcdef") == 1)
assert(minEditDistance("abcde", "abcdf") == 1)
assert(minEditDistance("abcde", "bcdef") == 2)
assert(minEditDistance("ixfkieaaocalmxhfifyadnouljtezrnpnfoenespcaenyvzcjtppsaxegmeytqrkvdwugvouskcnnqnmhepquncvyvgkansquaotkgvlvplktrabaikeuubfupunpztpvvzdqaqgfmtzxlcxsipltzwjegpqjzclclvjsmqbmiyzvcujpvhupyhvhhjq", "ganxioafstgdpceecubqrngumbpjvwxdpzmragsunvfnmejbcvsoydtbbewybygpsmmyjuvezn") == 153)
assert(minEditDistance("ixotitbgzoknoghrrjjwageedzjaghsjvqeqptfphqkvdtevqjjxqgdwfqunvxpxthzzjeprbcvmyphduapyoargbqmizivhfryqdonlritniosmdvuiyhdoykojzvauymskrzrncufasqzuerdehpqceclpbjtvbebuullzaqtokgkfzznumkvvdgwvuiacetbcbmbcrdoemcfjbuw", "nqbgetlzozptuajfmvpzqqkuuxrwlhjcuyohpcnzpgkgmieuuavdetngrrxlxfauugyccklhjbsdqriznggbgvmcbamzdtdffpujnxhosgvbllnyoqpvuamsylyxtpqhcbfxhrdznwswmcxhvmrhttipapeshhdzjpmkucwqtztfsyxzwupmdgmlcatlqqwglekqmrojldjfjmthmiriyyavtznlosbixdtjxsjtzfyvvvwsqqfpmxbnkzwotuelfqjlctoaobu") == 225)
