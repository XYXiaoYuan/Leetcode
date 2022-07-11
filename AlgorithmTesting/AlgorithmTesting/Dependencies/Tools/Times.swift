import Foundation

public struct Times {
    public static func test(title: String, task: (() -> Void)? = nil) {
        guard let task = task else { return }
        
        let desc = title.isEmpty ? "" : "【" + title + "】"
        print("🍏" + desc + "🍏")
        
        let begin = CFAbsoluteTimeGetCurrent()
        /// 开始
        print("🚀 开始 \(Date().dateString())")
        
        /// 执行代码
        task()
        
        let end = CFAbsoluteTimeGetCurrent()
        /// 结束
        print("🫕 结束 \(Date().dateString())")
        
        /// 总结耗时
        let delta = (end - begin) * 1000
        print("🍖 耗时：" + "\(String(format: "%.3f", end - begin))s" + "(\(String(format: "%.3f", delta))ms)")
        print("-------------------------------------\n")
    }
}

extension Date {
    fileprivate func dateString(formate: String = "HH:mm:ss.SSS") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formate
        return dateFormatter.string(from: self)
    }
}
