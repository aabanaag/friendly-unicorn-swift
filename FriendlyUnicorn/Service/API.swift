//
//  API.swift
//  FriendlyUnicorn
//
//  Created by Alexis Jr. Banaag on 4/8/20.
//  Copyright © 2020 Alexis Jr. Banaag. All rights reserved.
//

import Moya

enum API {
  case fetch(_ params: [String: Any])
}

extension API: TargetType {
  var baseURL: URL {
    return URL(string: "https://itunes.apple.com/")!
  }
  
  var path: String {
    switch self {
    case .fetch:
      return "/search"
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
      return .requestParameters(parameters: params, encoding: JSONEncoding.default)
    }
  }
  
  var headers: [String : String]? {
    return ["Content-type": "application/json"]
  }
}
