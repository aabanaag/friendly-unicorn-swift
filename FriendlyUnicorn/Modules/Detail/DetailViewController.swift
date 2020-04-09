//
//  DetailViewController.swift
//  FriendlyUnicorn
//
//  Created by Alexis Jr. Banaag on 4/9/20.
//  Copyright © 2020 Alexis Jr. Banaag. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import AVFoundation

class DetailViewController: UIViewController {
  // MARK: - DECLARATIONS
  private let bag: DisposeBag = DisposeBag()
  private var player: AVPlayer!

  var viewModel: DetailViewModel!
  var service: ServiceManager!
  var movie: Movie!
  
  @IBOutlet weak var videoPreview: UIView!
  @IBOutlet weak var trackNameLabel: UILabel!
  @IBOutlet weak var subLabel: UILabel!
  @IBOutlet weak var longDescription: UITextView!
  @IBOutlet weak var artistNameLabel: UILabel!
  @IBOutlet weak var priceLabel: UILabel!
  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
    service = ServiceManager()
    viewModel = DetailViewModel(service: service, with: movie)

    bindable()

    showVideo()
  }

  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)

    guard let videoPlayer = player else { return }
    videoPlayer.pause()
  }

  private func bindable() {
    viewModel.trackName
      .drive(trackNameLabel.rx.text)
      .disposed(by: bag)

    viewModel.subLabel
    .drive(subLabel.rx.text)
    .disposed(by: bag)

    viewModel.longDescription
    .drive(longDescription.rx.text)
    .disposed(by: bag)

    viewModel.artistName
    .drive(artistNameLabel.rx.text)
    .disposed(by: bag)

    viewModel.price
    .drive(priceLabel.rx.text)
    .disposed(by: bag)
  }

  private func showVideo() {
    let videoURL = URL(string: movie.previewUrl)
    player = AVPlayer(url: videoURL!)
    let playerLayer = AVPlayerLayer(player: player)
    playerLayer.frame = videoPreview.layer.bounds
    videoPreview.layer.addSublayer(playerLayer)
    player.play()
  }
}
