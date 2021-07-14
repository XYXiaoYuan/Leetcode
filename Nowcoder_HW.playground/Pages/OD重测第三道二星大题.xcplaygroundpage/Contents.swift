/**
 有一个文件,包含以一定规则写作的文本,请统计文件中包含的文本数量
 
 规则如下
 1.文本以";"分隔, 最后一条可以没有";", 但空文本不能算语句,
 
 2.文本可以跨行
 
 3.文件支持成对的单引号双引号
 
 4.支持注释
 
 */

import Foundation

func fileLineIsEmpty(str: String) -> Bool {
    if str == "\n" || str == "\t" || str == " " {
        return false
    }
    return true
}

func test(_ file: String) {
    let inputs: [String] = file.split(separator: ";").map { "\($0)" }

    let result = inputs.filter { fileLineIsEmpty(str: $0) }
    
    /// 文本数量
    var count: Int = result.count
    
    for item in result {
        if item.contains("--"), item.contains(";") {
            count -= 1
        }
    }
    
}

func fileLineCount(_ file: String) -> Int {
//    let inputs: [String] = file.split(separator: ";").map { "\($0)" }
//
//    let result = inputs.filter { fileLineIsEmpty(str: $0) }
    
    /// 文本数量
    var count: Int = 0
    
    let inputs: [String] = file.split(separator: "\n").map { "\($0)" }
    print(inputs)
    
    for (index, item) in inputs.enumerated() {
        if item.contains("--") {
            // 删除注释再统计
            var lineCount: Int = 0
            for (index, ch) in item.enumerated() {
                if ch == "-" {
                    lineCount += 1
                }
            }
            
        } else {
            if item.contains(";") {
                count += 1
            }
        }
        
    }
    
    
    return count
}

/// 是否是Debug模式
var isDebug: Bool = true

if isDebug {
    let file =
    """
    COMMAND TABLE IF EXISTS "UNITED STATE";
    COMMAND A GREAT (
        ID ADSAB,
        download_length INTE-GER,  -- test
        file_name TEXT,
        guid TEXT,
        mime_type TEXT,
        notifica-tionid INTEGER,
        original_file_name TEXT,
        pause_reason_type INTEGER,
        resumable_flag INTEGER,
        start_time INTEGER,
        state INTEGER,
        folder TEXT,
        path TEXT,
        total_length INTE-GER,
        url TEXT
    );
    """
    
    let result = fileLineCount(file)
    print(result)
} else {
    while let file = readLine() {
        let result = fileLineCount(file)
        print(result)
    }
}

/// 全局打印,发布时不触发, isDebug == false时不打印
public func dprint<T>(_ msg: T,
                      line: Int = #line) {
    if isDebug {
        let prefix = "🏷_\(line)"
        print(prefix, msg)
    }
}
