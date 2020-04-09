//
//  ListViewModel.swift
//  FriendlyUnicorn
//
//  Created by Alexis Jr. Banaag on 4/8/20.
//  Copyright © 2020 Alexis Jr. Banaag. All rights reserved.
//

import RxSwift
import RxCocoa
import Disk

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

// MARK: - PRIIVATE METHODS
extension ListViewModel {
  private func getList() -> Observable<[Movie]> {
    print("API")
    return service.fetch(params: [
      "term": "star",
      "country": "AU",
      "media": "movie"
    ])
    .filterCompleted()
    .map([Movie].self, atKeyPath: "results", using: JSONDecoder(), failsOnEmptyData: true)
    .catchErrorJustReturn([])
  }

  private func fetchList() -> Observable<[Movie]> {
    do {
      if Disk.exists("movies", in: .caches) {
        let retrievedList = try Disk.retrieve("movies", from: .caches, as: [Movie].self)

        return Observable.of(retrievedList)
      }
    } catch let error {
      print(error)
    }

    return getList()
  }
}
