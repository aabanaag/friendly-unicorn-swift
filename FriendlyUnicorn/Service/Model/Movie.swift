//
//  Movie.swift
//  FriendlyUnicorn
//
//  Created by Alexis Jr. Banaag on 4/8/20.
//  Copyright © 2020 Alexis Jr. Banaag. All rights reserved.
//

import RxDataSources

enum WrapperType: String {
  case track = "Track"
  case collection = "Collection"
}

enum ExplicitType: String {
  case explicit = "Explicit"
  case notExplicit = "Not Explicit"
}

struct Movie: Codable {
  let trackId: Int
  let collectionId: Int
  let wrapperType: WrapperType
  let artistName: String
  let collectionName: String
  let trackName: String
  let collectionCensoredName: String
  let trackCensoredName: String
  let collectionViewUrl: String
  let trackViewUrl: String
  let previewUrl: String
  let artworkUrl60: String
  let artworkUrl100: String
  let collectionPrice: Float
  let trackPrice: Float
  let collectionExplicitness: ExplicitType
  let trackExplicitness: ExplicitType
  let discCount: Int
  let discNumber: Int
  let trackCount: Int
  let trackNumber: Int
  let trackTimeMillis: Int
  let country: String
  let currency: String
  let primaryGenreName: String
  let contentAdvisoryRating: String
  let shortDescription: String
  let longDescription: String
  let releaseDate: String
}

extension Movie {
  enum MovieCodingKeys: String, CodingKey {
    case trackId
    case collectionId
    case artistId
    case wrapperType
    case artistName
    case collectionName
    case trackName
    case collectionCensoredName
    case trackCensoredName
    case collectionViewUrl
    case trackViewUrl
    case previewUrl
    case artworkUrl60
    case artworkUrl100
    case collectionPrice
    case trackPrice
    case collectionExplicitness
    case trackExplicitness
    case discCount
    case discNumber
    case trackCount
    case trackNumber
    case trackTimeMillis
    case country
    case currency
    case primaryGenreName
    case contentAdvisoryRating
    case shortDescription
    case longDescription
    case releaseDate
  }

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: MovieCodingKeys.self)
    let type = try container.decode(String.self, forKey: .wrapperType)
    let _collectionExplicitness = try container.decode(String.self, forKey: .collectionExplicitness)
    let _trackExplicitness = try container.decode(String.self, forKey: .trackExplicitness)

    trackId = try container.decode(Int.self, forKey: .trackId)
    collectionId = try container.decodeIfPresent(Int.self, forKey: .collectionId) ?? 0
    wrapperType = WrapperType(rawValue: type) ?? WrapperType.track
    artistName = try container.decode(String.self, forKey: .artistName)
    collectionName = try container.decodeIfPresent(String.self, forKey: .collectionName) ?? ""
    trackName = try container.decode(String.self, forKey: .trackName)
    collectionCensoredName = try container.decodeIfPresent(String.self, forKey: .collectionCensoredName) ?? ""
    trackCensoredName = try container.decode(String.self, forKey: .trackCensoredName)
    collectionViewUrl = try container.decodeIfPresent(String.self, forKey: .collectionViewUrl) ?? ""
    trackViewUrl = try container.decode(String.self, forKey: .trackViewUrl)
    previewUrl = try container.decode(String.self, forKey: .previewUrl)
    artworkUrl60 = try container.decode(String.self, forKey: .artworkUrl60)
    artworkUrl100 = try container.decode(String.self, forKey: .artworkUrl100)
    collectionPrice = try container.decode(Float.self, forKey: .collectionPrice)
    trackPrice = try container.decode(Float.self, forKey: .trackPrice)
    collectionExplicitness = ExplicitType(rawValue: _collectionExplicitness) ?? ExplicitType.notExplicit
    trackExplicitness = ExplicitType(rawValue: _trackExplicitness) ?? ExplicitType.notExplicit
    discCount = try container.decodeIfPresent(Int.self, forKey: .discCount) ?? 0
    discNumber = try container.decodeIfPresent(Int.self, forKey: .discNumber) ?? 0
    trackCount = try container.decodeIfPresent(Int.self, forKey: .trackCount) ?? 0
    trackNumber = try container.decodeIfPresent(Int.self, forKey: .trackNumber) ?? 0
    trackTimeMillis = try container.decode(Int.self, forKey: .trackTimeMillis)
    country = try container.decode(String.self, forKey: .country)
    currency = try container.decode(String.self, forKey: .currency)
    primaryGenreName = try container.decode(String.self, forKey: .primaryGenreName)
    contentAdvisoryRating = try container.decode(String.self, forKey: .contentAdvisoryRating)
    shortDescription = try container.decodeIfPresent(String.self, forKey: .shortDescription) ?? ""
    longDescription = try container.decodeIfPresent(String.self, forKey: .longDescription) ?? ""
    releaseDate = try container.decode(String.self, forKey: .releaseDate)
  }

  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: MovieCodingKeys.self)

    try container.encode(trackId, forKey: .trackId)
    try container.encode(collectionId, forKey: .collectionId)
    try container.encode(wrapperType.rawValue, forKey: .wrapperType)
    try container.encode(collectionName, forKey: .collectionName)
    try container.encode(trackName, forKey: .trackName)
    try container.encode(artistName, forKey: .artistName)
    try container.encode(collectionCensoredName, forKey: .collectionCensoredName)
    try container.encode(trackCensoredName, forKey: .trackCensoredName)
    try container.encode(collectionViewUrl, forKey: .collectionViewUrl)
    try container.encode(trackViewUrl, forKey: .trackViewUrl)
    try container.encode(previewUrl, forKey: .previewUrl)
    try container.encode(artworkUrl60, forKey: .artworkUrl60)
    try container.encode(artworkUrl100, forKey: .artworkUrl100)
    try container.encode(collectionPrice, forKey: .collectionPrice)
    try container.encode(trackPrice, forKey: .trackPrice)
    try container.encode(collectionExplicitness.rawValue, forKey: .collectionExplicitness)
    try container.encode(trackExplicitness.rawValue, forKey: .trackExplicitness)
    try container.encode(discCount, forKey: .discCount)
    try container.encode(discNumber, forKey: .discNumber)
    try container.encode(trackCount, forKey: .trackCount)
    try container.encode(trackNumber, forKey: .trackNumber)
    try container.encode(trackTimeMillis, forKey: .trackTimeMillis)
    try container.encode(country, forKey: .country)
    try container.encode(currency, forKey: .currency)
    try container.encode(primaryGenreName, forKey: .primaryGenreName)
    try container.encode(contentAdvisoryRating, forKey: .contentAdvisoryRating)
    try container.encode(shortDescription, forKey: .shortDescription)
    try container.encode(longDescription, forKey: .longDescription)
    try container.encode(releaseDate, forKey: .releaseDate)
  }
}

extension Movie: IdentifiableType, Equatable {
  typealias Identity = Int

  var identity: Identity { return trackId }

  // swiftlint:disable operator_whitespace
  static func ==(lhs: Movie, rhs: Movie) -> Bool {
    return lhs.trackId == rhs.trackId
  }
}

struct MovieSection {
  var name: String
  var items: [Movie]
}

extension MovieSection: AnimatableSectionModelType {
  var identity: String {
    return name
  }

  init(original: MovieSection, items: [Movie]) {
    self = original
    self.items = items
  }
}
