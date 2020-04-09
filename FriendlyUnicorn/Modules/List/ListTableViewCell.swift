//
//  ListTableViewCell.swift
//  FriendlyUnicorn
//
//  Created by Alexis Jr. Banaag on 4/8/20.
//  Copyright © 2020 Alexis Jr. Banaag. All rights reserved.
//

import UIKit
import Nuke

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
      priceLabel.text = Helper().format(price: movie.trackPrice, with: movie.currency)
    } else {
      trackNameLabel.text = movie.collectionName
      priceLabel.text = Helper().format(price: movie.collectionPrice, with: movie.currency)
    }

    genreLabel.text = movie.primaryGenreName

    let options = ImageLoadingOptions(
        placeholder: UIImage(systemName: "film"),
        transition: .fadeIn(duration: 0.33)
    )

    Nuke.loadImage(with: URL(string: movie.artworkUrl100)!, options: options, into: artwork)
  }
}
