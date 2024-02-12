//
//  AKLogger.swift
//
//  Created by Akihiro Matsuyama on 2024/02/13.
//

import Foundation

public struct AKLogger {
    public enum LogLevel {
        case DEBUG     // システムの動作状況に関する詳細な情報。
        case INFO      // 一般的な情報のログ記録。
        case WARN      // 異常とは言い切れないが正常とも異なる何らかの問題。
        case ERROR     // 予期しないその他の実行時エラー。
        case FATAL     // プログラムの異常終了を伴うようなもの。
    }

    // DateFormatterを静的に再利用
    private static let logDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
        return formatter
    }()

    /// ログ出力
    ///
    /// - Parameters:
    ///   - file: ソースファイル名
    ///   - line: 行番号
    ///   - function: メソッド
    ///   - level: ログ・レベル
    ///   - message: メッセージ
    public static func log(file: String = #file,
                           line: Int = #line,
                           function: String = #function,
                           level: LogLevel,
                           message: CustomStringConvertible ) {  // CustomStringConvertibleに変更

        let levelString: String
        switch level {
        case .DEBUG:    levelString = "DEBUG"
        case .INFO:     levelString = "INFO"    // INFOレベルを追加
        case .WARN:     levelString = "WARN"
        case .ERROR:    levelString = "ERROR"
        case .FATAL:    levelString = "FATAL"
        }

        let fileName = NSString(string: file).lastPathComponent
        let now = logDateFormatter.string(from: Date())

        // 条件付きでログ出力
        #if DEBUG
        // コンソール出力
        print("AKLogger: " + now + " \(levelString) \(fileName)(\(line)) \(function) - \(message)")
        #endif
    }
}
