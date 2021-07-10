/**
 https://www.nowcoder.com/practice/8ef655edf42d4e08b44be4d777edbf43?tpId=37&&tqId=21276&rp=1&ru=/ta/huawei&qru=/ta/huawei/question-ranking
 
 描述


 以上三角形的数阵，第一行只有一个数1，以下每行的每个数，是恰好是它上面的数，左上角数到右上角的数，3个数之和（如果不存在某个数，认为该数就是0）。

 求第n行第一个偶数出现的位置。如果没有偶数，则输出-1。例如输入3,则输出2，输入4则输出3。


 输入n(n <= 1000000000)
 本题有多组输入数据，输入到文件末尾，请使用while(cin>>)等方式读入
 输入描述：
 输入一个int整数

 输出描述：
 输出返回的int值

 示例1
 输入：
 4
 2
 复制
 输出：
 3
 -1
 复制

 */

import Foundation

while let line = readLine(), let num = Int(line) {
    
    if num <= 2 {
        print(-1)
    } else {
        let res: [Int] = [2, 3, 2, 4]
        print(res[(num + 1) % 4])
    }
}
