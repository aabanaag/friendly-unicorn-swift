//
//  ListTableViewController.swift
//  FriendlyUnicorn
//
//  Created by Alexis Jr. Banaag on 4/8/20.
//  Copyright © 2020 Alexis Jr. Banaag. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class ListTableViewController: UITableViewController {

  // MARK: - DECLARATIONS
  private let bag: DisposeBag = DisposeBag()

  var viewModel: ListViewModel!
  var service: ServiceManager!
  var dataSource: RxTableViewSectionedAnimatedDataSource<MovieSection>!

  override func viewDidLoad() {
    super.viewDidLoad()

    service = ServiceManager()
    viewModel = ListViewModel(service)

    setupTable()

    bindTable()
  }

  private func setupTable() {
    dataSource = RxTableViewSectionedAnimatedDataSource<MovieSection>(configureCell: { (_, tableView, _, movie) -> ListTableViewCell in
      let cell: ListTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "listCell") as? ListTableViewCell)!
      cell.setup(movie: movie)
      return cell
    })

    // TABLE
    tableView.rowHeight = 100
  }

  private func bindTable() {
    guard let vm = viewModel else { return }

    vm.movies
      .debug()
      .map { [MovieSection(name: "TEST", items: $0)] }
      .drive(tableView.rx.items(dataSource: dataSource))
      .disposed(by: bag)

    tableView.rx.modelSelected(Movie.self)
      .debounce(.milliseconds(500), scheduler: MainScheduler.instance)
      .subscribe(onNext: { [weak self] movie in
        guard let strongSelf = self else { return }
        guard let vc = Storyboards.Detail.instantiateInitialViewController().viewControllers.first as? DetailViewController else { return }

        vc.movie = movie
        strongSelf.showDetailViewController(vc, sender: nil)
      })
      .disposed(by: bag)

  }
}
