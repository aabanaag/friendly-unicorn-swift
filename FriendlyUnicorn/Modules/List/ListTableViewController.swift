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

  weak var viewModel: ListViewModel?
  var dataSource: RxTableViewSectionedAnimatedDataSource<MovieSection>!

  override func viewDidLoad() {
    super.viewDidLoad()

    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = false

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem

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
      .map { [MovieSection(name: "TEST", items: $0)] }
      .drive(tableView.rx.items(dataSource: dataSource))
      .disposed(by: bag)

  }
}
