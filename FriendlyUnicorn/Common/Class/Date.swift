//
//  Date.swift
//  FriendlyUnicorn
//
//  Created by Alexis Jr. Banaag on 4/9/20.
//  Copyright © 2020 Alexis Jr. Banaag. All rights reserved.
//

import Foundation

extension DateFormatter {
  static let yyyyMMdd: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "MMM-dd hh:mm a"
    formatter.calendar = Calendar(identifier: .iso8601)
    formatter.timeZone = TimeZone(secondsFromGMT: 0)
    formatter.timeStyle = .medium
    formatter.dateStyle = .medium
    formatter.locale = Locale(identifier: "en_US_POSIX")
    return formatter
  }()
}

extension Date {
  init(dateString: String) {
    self = Date.iso8601Formatter.date(from: dateString)!
  }

  static let iso8601Formatter: ISO8601DateFormatter = {
    let formatter = ISO8601DateFormatter()
    formatter.formatOptions = [.withFullDate,
                               .withTime,
                               .withDashSeparatorInDate,
                               .withColonSeparatorInTime]
    return formatter
  }()

  func getYearDateString(with format: String = String()) -> String {
    let formatter = DateFormatter()
    formatter.timeZone = TimeZone.current
    formatter.dateFormat = "YYYY"
    return formatter.string(from: self)
  }

  func getDateString(with format: String = String()) -> String {
    let formatter = DateFormatter()
    formatter.timeZone = TimeZone.current

    if format.isEmpty {
      formatter.timeStyle = .medium
      formatter.dateStyle = .medium
    } else {
      formatter.dateFormat = "MMM-dd hh:mm a"
    }

    return formatter.string(from: self)
  }
}
