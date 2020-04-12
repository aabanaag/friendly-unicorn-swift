//
//  ServiceManager.swift
//  FriendlyUnicorn
//
//  Created by Alexis Jr. Banaag on 4/8/20.
//  Copyright © 2020 Alexis Jr. Banaag. All rights reserved.
//

import Moya
import RxSwift
import RxMoya

struct ServiceManager {
  /// Uncomment if you would like to inspect the logs of each Network calls. Best suited for development environment.
//  private let provider = MoyaProvider<API>(plugins: [NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))])

  private let provider = MoyaProvider<API>()
}

// MARK: - METHODS
extension ServiceManager {
  func fetch(params: [String: Any]) -> Observable<ProgressResponse> {
    return provider.rx.requestWithProgress(.fetch(params))
  }
}
