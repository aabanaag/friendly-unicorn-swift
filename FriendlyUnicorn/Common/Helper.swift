//
//  Helper.swift
//  FriendlyUnicorn
//
//  Created by Alexis Jr. Banaag on 4/9/20.
//  Copyright © 2020 Alexis Jr. Banaag. All rights reserved.
//

import Foundation

struct Helper {
  func format(price: Float, with currency: String) -> String {
    let formatter = NumberFormatter()
    formatter.allowsFloats = true
    formatter.usesGroupingSeparator = true
    formatter.numberStyle = .currency
    formatter.currencyCode = currency
    return formatter.string(from: NSNumber(value: price))!
  }
}
