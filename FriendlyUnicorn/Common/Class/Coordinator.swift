//
//  Coordinator.swift
//  FriendlyUnicorn
//
//  Created by Alexis Jr. Banaag on 4/8/20.
//  Copyright © 2020 Alexis Jr. Banaag. All rights reserved.
//

import Foundation

protocol Coordinator: class {

  /**
   The child Coordinators being managed by this Coordinator
   */
  var childCoordinators: [Coordinator] { get set }

  /**
   The start method is where the Coordinator executes its setup logic to manage its UIViewController.
   This should only be called once in the entire lifetime of the Coordinator instance.
   Calling this more than once results in a forced fatalError.
   Must call super.
   */
  func start()
}

extension Coordinator {

  /// Add a child coordinator to the parent
  public func addChildCoordinator(_ childCoordinator: Coordinator) {
    self.childCoordinators.append(childCoordinator)
  }

  /// Remove a child coordinator from the parent
  public func removeChildCoordinator(_ childCoordinator: Coordinator) {
    self.childCoordinators = self.childCoordinators.filter { $0 !== childCoordinator }
  }
}
