//
//  Log.swift
//
//  Created by ycsong on 2021/10/28.
//

import UIKit

struct Log {
    enum Level {
        case debug, info, warn, error
    }
    
    private static func log(_ msg: Any, _ args: [Any], _ level: Level, _ line: Int = #line, _ filename: String) {
        let date: String = {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "YYYY-MM-dd HH:mm:ss:SSS"
            return dateFormatter.string(from: Date())
        }()
        
        switch level {
        case .debug:
            print("\(date) 💚 [\(filename) - Line \(line)] \(msg)")
        case .info:
            print("\(date) 💜 [\(filename) - Line \(line)] \(msg)")
        case .warn:
            print("\(date) 💛 [\(filename) - Line \(line)] \(msg)")
        case .error:
            print("\(date) ❤️ [\(filename) - Line \(line)] \(msg)")
        }
    }
}

extension Log {
    static func d(_ msg: Any, _ args: [Any] = [], _ line: Int = #line, filename: String = #file) {
        log(msg, args, .debug, line, URL(string: filename)!.lastPathComponent)
    }
    
    static func i(_ msg: Any, _ args: [Any] = [], _ line: Int = #line, filename: String = #file) {
        log(msg, args, .info, line, URL(string: filename)!.lastPathComponent)
    }
    
    static func w(_ msg: Any, _ args: [Any] = [], _ line: Int = #line, filename: String = #file) {
        log(msg, args, .warn, line, URL(string: filename)!.lastPathComponent)
    }

    static func e(_ msg: Any, _ args: [Any] = [], _ line: Int = #line, filename: String = #file) {
        log(msg, args, .error, line, URL(string: filename)!.lastPathComponent)
    }
}
