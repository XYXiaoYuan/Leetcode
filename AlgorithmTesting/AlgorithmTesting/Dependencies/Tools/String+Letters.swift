//
//  String+Letters.swift
//  AlgorithmTesting
//
//  Created by lizhi on 2022/8/9.
//

import Foundation

extension String {
    public static func lowercaseAndUppercaseLetters() -> (lowcaseLetters: [String], uppercaseLetters: [String]) {
        let lowercaseLetterValues = Unicode.Scalar("a").value...Unicode.Scalar("z").value
        let lowercaseLetters = lowercaseLetterValues.map { String(Unicode.Scalar($0) ?? " ")}
        // ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

        let uppercaseLetterValues = Unicode.Scalar("A").value...Unicode.Scalar("Z").value
        let uppercaseLetters = uppercaseLetterValues.map { String(Unicode.Scalar($0) ?? " ")}
        // ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
        
        return (lowercaseLetters, uppercaseLetters)
    }
    
    public static func lowercaseLetters() -> [String] {
        let lowercaseLetterValues = Unicode.Scalar("a").value...Unicode.Scalar("z").value
        let letters = lowercaseLetterValues.map { String(Unicode.Scalar($0) ?? " ")}
        return letters
        // ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    }
    
    public static func uppercaseLetters() -> [String]  {
        let uppercaseLetterValues = Unicode.Scalar("A").value...Unicode.Scalar("Z").value
        let letters = uppercaseLetterValues.map { String(Unicode.Scalar($0) ?? " ")}
        return letters
        // ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    }
    
    public static func helloWorld() {
        let str = "hello world!"
        for index in str.indices {
            let s = str[index]
            print(s)
        }
    }
}

extension String {
    public func toLowerCase(_ s: String) -> String {
        var result = ""
        for i in s.indices {
            var v = s[i]
            if var value = v.asciiValue,
                value >= 65,
                value <= 90 {
                value |= 32
                v = Character(String(format: "%c", value))
            }
            result.append(v)
        }
        return result
    }
}

extension String {
    
    /// 获取随机汉字
    public static func randomChinese() -> String {
        let cfEncoding = CFStringEncoding(CFStringEncodings.GB_18030_2000.rawValue)
        let gbkEncoding = CFStringConvertEncodingToNSStringEncoding(cfEncoding)
        let randomH = 0xA1 + arc4random() % (0xFE - 0xA1 + 1)
        let randomL = 0xB0 + arc4random() % (0xF7 - 0xB0 + 1)
        var number = (randomH << 8) + randomL
        let data = Data.init(bytes: &number, count: 2)
        let string = String(data: data, encoding: String.Encoding(rawValue: gbkEncoding))

        guard let str = string else {
            return ""
        }
        return str
    }

    /// 获取N个随机汉字
    /// - Parameter count: 汉字字数
    /// - Returns: N个随机汉字
    public static func randomChinese(_ count: Int) -> String {
        var target: String = ""
        for _ in 0..<count {
            let temp = Self.randomChinese()
            target.append(temp)
        }
        return target
    }
}
