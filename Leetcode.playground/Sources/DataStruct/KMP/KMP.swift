//
//  KMP.swift
//  AlgorithmTesting
//
//  Created by lizhi on 2022/8/7.
//

/// KMP算法
protocol KMP {
    
    /// 获取match字符串在s字符串第一次出现的位置 ,如果没有出现,返回-1
    /// - Parameters:
    ///   - s: 源字符串
    ///   - m: 匹配字符串
    func getIndexOf(_ s: String, _ m: String) -> Int
    
    /// 之前这坨字符串最长前缀和最长后缀相等时的匹配长度数组
    /// - Parameters:
    ///   - ms: 匹配字符串数组
    func getNextArray(_ ms: [Character]) -> [Int]
}

extension KMP {
    
    /// 获取match字符串在s字符串第一次出现的位置 ,如果没有出现,返回-1
    /// - Parameters:
    ///   - s: 源字符串
    ///   - m: 匹配字符串
    func getIndexOf(_ s: String, _ m: String) -> Int {
        if s.count < m.count {
            return -1
        }
        
        let ss = s.map { Character(extendedGraphemeClusterLiteral: $0) }
        let ms = m.map { Character(extendedGraphemeClusterLiteral: $0) }
        var si = 0
        var mi = 0
        let next = getNextArray(ms)
        
        while si < ss.count, mi < ms.count {
            if ss[si] == ms[mi] {
                si += 1
                mi += 1
            } else if next[mi] == -1 {
                si += 1
            } else {
                mi = next[mi]
            }
        }
        
        return mi == ms.count ? si - mi : -1
    }
    
    /// 之前这坨字符串最长前缀和最长后缀相等时的匹配长度数组
    /// - Parameters:
    ///   - ms: 匹配字符串数组
    func getNextArray(_ ms: [Character]) -> [Int] {
        if ms.count == 1 {
            return [-1]
        }
        
        var next = [Int].init(repeating: 0, count: ms.count)
        next[0] = -1
        next[1] = 0

        var pos = 2
        var cn = 0
        while pos < next.count {
            if ms[pos - 1] == ms[cn] {
                cn += 1
                next[pos] = cn
                pos += 1
            } else if cn > 0 {
                cn = next[cn]
            } else {
                next[pos] = 0
                pos += 1
            }
        }
        
        return next
    }
}
