//
//  ListTableViewCell.swift
//  FriendlyUnicorn
//
//  Created by Alexis Jr. Banaag on 4/8/20.
//  Copyright © 2020 Alexis Jr. Banaag. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {

  @IBOutlet weak var artwork: UIImageView!
  @IBOutlet weak var trackNameLabel: UILabel!
  @IBOutlet weak var genreLabel: UILabel!
  @IBOutlet weak var priceLabel: UILabel!

  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)

    // Configure the view for the selected state
  }

  func setup(movie: Movie) {
    if movie.wrapperType == .track {
      trackNameLabel.text = movie.trackName
      priceLabel.text = "\(movie.trackPrice)"
    } else {
      trackNameLabel.text = movie.collectionName
      priceLabel.text = "\(movie.collectionName)"
    }

    genreLabel.text = movie.primaryGenreName
  }
}
