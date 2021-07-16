class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        if prices.isEmpty {
            return 0
        }
        
        var s1 = prices[0]
        var s2 = Int.min
        var s3 = Int.min
        var s4 = Int.min
        
        for i in 1..<prices.count {
            let v = prices[i]
            s1 = max(s1, -v)
            s2 = max(s2, s1 + v)
            s3 = max(s3, s2 - v)
            s4 = max(s4, s3 + v)
        }
        
        return max(0, s4)
    }
}

let s = Solution()
let input1 = [7,1,5,3,6,4]
let input2 = [7,6,4,3,1]
let input3 = [1,2,3,4,5]
let result = s.maxProfit(input1)
print(result)

assert(s.maxProfit(input1) == 7)
assert(s.maxProfit(input2) == 0)
assert(s.maxProfit(input3) == 4)
