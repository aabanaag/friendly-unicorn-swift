//
//  PaginatedResult.swift
//  FriendlyUnicorn
//
//  Created by Alexis Jr. Banaag on 4/8/20.
//  Copyright © 2020 Alexis Jr. Banaag. All rights reserved.
//

struct PaginatedResult {
  let results: [Movie]
}

extension PaginatedResult: Decodable {
  enum PaginatedResultCodingKeys: String, CodingKey {
    case results
  }

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: PaginatedResultCodingKeys.self)

    results = try container.decode(Array.self, forKey: .results)
  }
}
