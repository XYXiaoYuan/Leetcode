/**
 https://www.nowcoder.com/practice/48b3cb4e3c694d9da5526e6255bb73c3?tpId=37&&tqId=21236&rp=1&ru=/ta/huawei&qru=/ta/huawei/question-ranking
 
 描述
 将一个英文语句以单词为单位逆序排放。例如“I am a boy”，逆序排放后为“boy a am I”
 所有单词之间用一个空格隔开，语句中除了英文字母外，不再包含其他字符

 输入描述：
 输入一个英文语句，每个单词用空格隔开。保证输入只包含空格和字母。

 输出描述：
 得到逆序的句子

 示例1
 输入：
 I am a boy
 复制
 输出：
 boy a am I
 复制
 
 
 */

while let line = readLine() {
    let array: [String] = line.components(separatedBy: " ").reversed()
    let res: String = array.joined(separator: " ")
    print(res)
}
