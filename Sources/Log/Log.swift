//
//  Log.swift
//
//  Created by ycsong on 2021/10/28.
//

import UIKit

public struct Log {
    enum Level {
        case debug, info, warn, error
    }
    
    private static func log(_ msg: Any, _ args: [Any], _ level: Level, _ line: Int = #line, _ filename: String) {
        let id: String = {
            switch level {
            case .debug:
                return "💚"
            case .info:
                return "💜"
            case .warn:
                return "💛"
            case .error:
                return "❤️"
            }
        }()
        
        let date: String = {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "YYYY-MM-dd HH:mm:ss:SSS"
            return dateFormatter.string(from: Date())
        }()
        
        let extraMessage: String = args.map({ String(describing: $0) }).joined(separator: " ")
        
        print("\(date) \(id) [\(filename) - Line \(line)] \(msg) \(extraMessage)")
    }
}

extension Log {
    public static func d(_ msg: Any, _ args: [Any] = [], _ line: Int = #line, filename: String = #file) {
        log(msg, args, .debug, line, URL(string: filename)!.lastPathComponent)
    }
    
    public static func i(_ msg: Any, _ args: [Any] = [], _ line: Int = #line, filename: String = #file) {
        log(msg, args, .info, line, URL(string: filename)!.lastPathComponent)
    }
    
    public static func w(_ msg: Any, _ args: [Any] = [], _ line: Int = #line, filename: String = #file) {
        log(msg, args, .warn, line, URL(string: filename)!.lastPathComponent)
    }

    public static func e(_ msg: Any, _ args: [Any] = [], _ line: Int = #line, filename: String = #file) {
        log(msg, args, .error, line, URL(string: filename)!.lastPathComponent)
    }
}
