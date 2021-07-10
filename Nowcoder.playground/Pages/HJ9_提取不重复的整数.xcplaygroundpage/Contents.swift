/**
 https://www.nowcoder.com/practice/253986e66d114d378ae8de2e6c4577c1?tpId=37&&tqId=21232&rp=1&ru=/ta/huawei&qru=/ta/huawei/question-ranking
 
 描述
 输入一个int型整数，按照从右向左的阅读顺序，返回一个不含重复数字的新的整数。
 保证输入的整数最后一位不是0。
 输入描述：
 输入一个int型整数

 输出描述：
 按照从右向左的阅读顺序，返回一个不含重复数字的新的整数

 示例1
 输入：
 9876673
 复制
 输出：
 37689

 */

while let line = readLine(), let num = Int(line) {
    var vals = Set<Int>()
    var k = num
    while k > 0 {
        let val = k % 10
        if !vals.contains(val) {
            vals.insert(val)
            print("\(val)", terminator: "")
        }
        k /= 10
    }
}
