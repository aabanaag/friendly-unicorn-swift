//
//  ListCoordinator.swift
//  FriendlyUnicorn
//
//  Created by Alexis Jr. Banaag on 4/8/20.
//  Copyright © 2020 Alexis Jr. Banaag. All rights reserved.
//

import UIKit

class ListCoordinator: Coordinator {
  var childCoordinators: [Coordinator] = []

  var rootViewModel: ListViewModel!
  var rootCoordinator: AppCoordinator!
  var service: ServiceManager!

  init(service: ServiceManager) {
    self.childCoordinators = []
    self.service = service

    rootViewModel = ListViewModel(service)
  }

  func start() {
    guard let navigationController = Storyboards.List.instantiateInitialViewController() as UINavigationController?,
      let vc = navigationController.viewControllers.first as? ListTableViewController else { return }

    vc.viewModel = rootViewModel
  }
}
