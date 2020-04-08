//
//  AppCoordinator.swift
//  FriendlyUnicorn
//
//  Created by Alexis Jr. Banaag on 4/8/20.
//  Copyright © 2020 Alexis Jr. Banaag. All rights reserved.
//

import UIKit
import RxSwift

class AppCoordinator: Coordinator {
  private let bag = DisposeBag()

  private lazy var splitViewController: UISplitViewController = {
    let splitController = UISplitViewController()
    return splitController
  }()

  private lazy var navigationController: UINavigationController = {
    let navigationController = UINavigationController()
    navigationController.navigationBar.tintColor = UIColor.black
    return navigationController
  }()

  let window: UIWindow
  var childCoordinators: [Coordinator]
  var service: ServiceManager!

  init(window: UIWindow) {
    self.window = window
    self.childCoordinators = []
    self.service = ServiceManager()

    splitViewController.viewControllers = [Storyboards.List.instantiateInitialViewController(), Storyboards.Detail.instantiateInitialViewController()]
    self.window.rootViewController = splitViewController
    self.window.makeKeyAndVisible()
  }

  func start() {
    showList()
  }

  private func showList() {
    let listCoordinator: ListCoordinator = ListCoordinator(service: service)
    listCoordinator.rootCoordinator = self
    listCoordinator.start()
  }
}
