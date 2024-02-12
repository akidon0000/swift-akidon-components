//
//  DateFormatter+Exetnsion.swift
//
//  Created by Akihiro Matsuyama on 2024/02/13.
//

import Foundation

extension DateFormatter {

    /*
     let dt = Date()
     // String型へ変換
     let dateString = DateFormatter.formatter.string(for: .date)

     // Date型へ変換
     if let date = DateFormatter.formatter.date(for: .date) {
     */

    // テンプレートの定義(例)
    enum Template: String {
        case date = "yMd"                       // 2017/1/1
        case dateMonthDate = "MMMd"             // 1月1日
        case time = "Hms"                       // 12:39:22
        case full = "yMdkHms"                   // 2017/1/1 12:39:22
        case onlyHour = "k"                     // 17時
        case era = "GG"                         // "西暦" (default) or "平成" (本体設定で和暦を指定している場合)
        case weekDay = "EEEE"                   // 日曜日
        case yyyyMMddHHmmss = "yyyyMMddHHmmss"  // 20170101123922
        case hhmmss = "HHmmss"                  // 123922
    }

    /// テンプレートに基づいて日付フォーマットを設定
    /// - Parameter template: テンプレート
    static func formatter(for template: Template) -> DateFormatter {
        return createFormatter(withFormat: template.rawValue)
    }

    /// 日付と時間のフォーマットに対応するDateFormatterを生成
    /// - Parameter format: 日付と時間のフォーマット文字列
    /// - Returns: 設定済みのDateFormatter
    private static func createFormatter(withFormat format: String) -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.calendar = Calendar(identifier: .gregorian) // グレゴリオ暦を使用
        formatter.timeZone = TimeZone(identifier: "Asia/Tokyo") // 東京のタイムゾーン
        formatter.locale = Locale(identifier: "ja_JP") // 日本のロケール
        return formatter
    }
}
