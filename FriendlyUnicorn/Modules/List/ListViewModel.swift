//
//  ListViewModel.swift
//  FriendlyUnicorn
//
//  Created by Alexis Jr. Banaag on 4/8/20.
//  Copyright © 2020 Alexis Jr. Banaag. All rights reserved.
//

import RxSwift
import RxCocoa

// MARK: - DECLARATIONS
class ListViewModel {
  /// PUBLIC
  var movies: Driver<[Movie]> {
    return _movies.asDriver(onErrorJustReturn: [])
  }

  /// PRIVATE
  private var service: ServiceManager!
  private var _movies: Observable<[Movie]>!

  init(_ service: ServiceManager) {
    self.service = service

    /// START API CALL
    _movies = fetchList()
  }
}

// MARK: - PUBLIC METHODS
extension ListViewModel {
}

// MARK: - PRIIVATE METHODS
extension ListViewModel {
  private func fetchList() -> Observable<[Movie]> {
    return service.fetch(params: [
      "term": "star",
      "country": "AU",
      "media": "movie"
    ])
    .do(onNext: { print("PROGRESS: \($0.progress)")})
    .filterCompleted()
    .map([Movie].self, atKeyPath: "results", using: JSONDecoder(), failsOnEmptyData: true)
    .catchErrorJustReturn([])
  }
}
