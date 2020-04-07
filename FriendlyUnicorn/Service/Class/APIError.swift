//
//  APIError.swift
//  FriendlyUnicorn
//
//  Created by Alexis Jr. Banaag on 4/8/20.
//  Copyright © 2020 Alexis Jr. Banaag. All rights reserved.
//

import Foundation

struct APIError: LocalizedError {
  var desc = ""
  init(message: String) {
    self.desc = message
  }

  //swiftlint:disable implicit_getter
  var localizedDescription: String {
    get { return self.desc }
  }

  var errorDescription: String? {
    get { return self.desc }
  }
}
