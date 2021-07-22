/**
 https://www.nowcoder.com/practice/03ba8aeeef73400ca7a37a5f3370fe68?tpId=37&&tqId=21250&rp=1&ru=/ta/huawei&qru=/ta/huawei/question-ranking
 
 描述
 定义一个单词的“兄弟单词”为：交换该单词字母顺序（注：可以交换任意次），而不添加、删除、修改原有的字母就能生成的单词。
 兄弟单词要求和原来的单词不同。例如：ab和ba是兄弟单词。ab和ab则不是兄弟单词。
 现在给定你n个单词，另外再给你一个单词str，让你寻找str的兄弟单词里，按字典序排列后的第k个单词是什么？
 注意：字典中可能有重复单词。本题含有多组输入数据。
 输入描述：
 先输入单词的个数n，再输入n个单词。 再输入一个单词，为待查找的单词x 最后输入数字k
 输出描述：
 输出查找到x的兄弟单词的个数m 然后输出查找到的按照字典顺序排序后的第k个兄弟单词，没有符合第k个的话则不用输出。
 示例1
 输入：
 3 abc bca cab abc 1
 复制
 输出：
 2
 bca
 复制
 示例2
 输入：
 6 cab ad abcd cba abc bca abc 1
 复制
 输出：
 3
 bca
 复制
 说明：
 abc的兄弟单词有cab cba bca，所以输出3
 经字典序排列后，变为bca cab cba，所以第1个字典序兄弟单词为bca

 */
