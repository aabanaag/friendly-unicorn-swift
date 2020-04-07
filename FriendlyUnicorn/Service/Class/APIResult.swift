//
//  APIResult.swift
//  FriendlyUnicorn
//
//  Created by Alexis Jr. Banaag on 4/8/20.
//  Copyright © 2020 Alexis Jr. Banaag. All rights reserved.
//

import Foundation

enum APIResult<T> {
  case success(T)
  case failure(Error)
}
