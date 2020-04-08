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
  private let provider = MoyaProvider<API>(plugins: [NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))])
}

// MARK: - HELPERS
extension ServiceManager {
  func parseServiceError(error: Error) -> Observable<APIResult<Any>> {
    return Observable.of(APIResult.failure(APIError(message: "Something went wrong...")))
  }
}

// MARK: - METHODS
extension ServiceManager {
  func fetch(params: [String: Any]) -> Observable<ProgressResponse> {
    return provider.rx.requestWithProgress(.fetch(params))
    .debug()
  }
}
