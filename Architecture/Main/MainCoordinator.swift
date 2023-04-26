//
//  MainRouter.swift
//  Architecture
//
//  Created by Adamas on 12/6/21.
//

import Foundation
import UIKit

protocol MainCoordinatorType: CoordinatorType {
    func showDetail(_ detail: String)
    func reset()
}

final class MainCoordinator: Coordinator, MainCoordinatorType {

    private weak var viewController: MainViewController?

    override func start(from sender: Any?) {
        let viewController = R.storyboard.main.instantiateInitialViewController()!
        viewController.inject(coordinator: self)
        navigationController?.viewControllers = [viewController]
        self.viewController = viewController
    }

    func showDetail(_ detail: String) {
        DetailCoordinator(navigationController: navigationController,
                          parentCoordinator: self,
                          detail: detail)
        .start()
    }

    func reset() {
        viewController?.reset()
    }
}
