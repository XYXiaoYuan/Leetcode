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
}
