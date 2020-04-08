//
//  API.swift
//  FriendlyUnicorn
//
//  Created by Alexis Jr. Banaag on 4/8/20.
//  Copyright © 2020 Alexis Jr. Banaag. All rights reserved.
//

import Moya

// swiftlint:disable type_name
enum API {
  case fetch(_ params: [String: Any])
}

extension API: TargetType {

  var baseURL: URL {
    return URL(string: "https://jsonplaceholder.typicode.com")!
  }

  var path: String {
    switch self {
    case .fetch:
      return "/todos"
    }
  }

  var method: Method {
    return .get
  }

  var sampleData: Data {
    return Data()
  }

  var task: Task {
    switch self {
    case .fetch(let params):
      return .requestParameters(parameters: params, encoding: URLEncoding.default)
    }
  }

  var headers: [String : String]? {
    return nil
  }
}
