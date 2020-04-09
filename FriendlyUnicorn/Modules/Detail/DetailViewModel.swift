//
//  DetailViewModel.swift
//  FriendlyUnicorn
//
//  Created by Alexis Jr. Banaag on 4/9/20.
//  Copyright © 2020 Alexis Jr. Banaag. All rights reserved.
//

import RxSwift
import RxCocoa

struct DetailViewModel {
  /// PUBLIC
  var trackName: Driver<String> {
    return _trackName.asDriver(onErrorJustReturn: "")
  }
  var subLabel: Driver<String> {
    return _subLabel.asDriver(onErrorJustReturn: "")
  }
  var longDescription: Driver<String> {
    return _longDescription.asDriver(onErrorJustReturn: "")
  }
  var artistName: Driver<String> {
    return _artistName.asDriver(onErrorJustReturn: "")
  }
  var price: Driver<String> {
    return _price.asDriver(onErrorJustReturn: "")
  }

  /// PRIVATE
  private var service: ServiceManager!
  private var _trackName: Observable<String>!
  private var _subLabel: Observable<String>!
  private var _longDescription: Observable<String>!
  private var _artistName: Observable<String>!
  private var _price: Observable<String>!

  init(service: ServiceManager, with movie: Movie) {
    self.service = service

    _trackName = Observable.just(movie.trackName)
    _subLabel = Observable.just(getSubDetail(movie: movie))
    _longDescription = Observable.just(movie.longDescription)
    _artistName = Observable.just(movie.artistName)
    _price = Observable.just(Helper().format(price: movie.trackPrice, with: movie.currency))
  }
}

extension DetailViewModel {
  private func getSubDetail(movie: Movie) -> String {
    let genre = movie.primaryGenreName
    let year = movie.releaseDate.getYearDateString()

    return "\(genre) • \(year)"
  }
}
