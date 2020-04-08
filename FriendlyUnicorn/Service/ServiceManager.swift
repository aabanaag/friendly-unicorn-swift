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
//
//private func JSONResponseDataFormatter(_ data: Data) -> String {
//  do {
//    let dataAsJSON = try JSONSerialization.jsonObject(with: data)
//    let prettyData = try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
//    return String(data: prettyData, encoding: .utf8) ?? String(data: data, encoding: .utf8) ?? ""
//  } catch {
//    return String(data: data, encoding: .utf8) ?? ""
//  }
//}

struct ServiceManager {
  private var provider: MoyaProvider<API> = MoyaProvider<API>(plugins: [
    NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))])
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
