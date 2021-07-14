/**
 https://www.nowcoder.com/practice/440f16e490a0404786865e99c6ad91c9?tpId=37&&tqId=21238&rp=1&ru=/ta/huawei&qru=/ta/huawei/question-ranking
 
 
 描述
 输入一个int型的正整数，计算出该int型数据在内存中存储时1的个数。

 输入描述：
  输入一个整数（int类型）

 输出描述：
  这个数转换成2进制后，输出1的个数

 示例1
 输入：
 5
 复制
 输出：
 2
 复制
 */

while let line = readLine(), let num = Int(line) {
    let s = String(num, radix: 2)
    var count = 0
    for i in s {
        if i == "1" {
            count += 1
        }
    }
    print(count)
}
