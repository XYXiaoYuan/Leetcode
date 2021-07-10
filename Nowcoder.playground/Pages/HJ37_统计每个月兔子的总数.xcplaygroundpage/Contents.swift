/**
 https://www.nowcoder.com/practice/1221ec77125d4370833fd3ad5ba72395?tpId=37&&tqId=21260&rp=1&ru=/ta/huawei&qru=/ta/huawei/question-ranking
 
 描述
 有一只兔子，从出生后第3个月起每个月都生一只兔子，小兔子长到第三个月后每个月又生一只兔子，假如兔子都不死，问每个月的兔子总数为多少？

 本题有多组数据。

 输入描述：
 输入int型表示month

 输出描述：
 输出兔子总数int型

 示例1
 输入：
 9
 复制
 输出：
 34
 复制
 */

while let readLine = readLine(), let number = Int(readLine) {
    var twoMonth = 0
    var oneMonth = 1
    var total = 0
 
    for _ in 1..<number {
        total = oneMonth + twoMonth
        twoMonth = oneMonth
        oneMonth = total
    }
    
    print(total)
}
