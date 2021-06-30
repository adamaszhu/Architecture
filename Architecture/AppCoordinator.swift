//
//  AppCoordinator.swift
//  Architecture
//
//  Created by Adamas on 25/6/21.
//

import Foundation
import UIKit

final class AppCoordinator: Coordinator {

    private let router: RouterType
    private let window: UIWindow

    init(window: UIWindow, navigationController: UINavigationController) {
        self.router = Router(navigationController: navigationController)
        self.window = window
        super.init()
        window.configure(with: navigationController)
    }

    override convenience init() {
        self.init(window: UIWindow(), navigationController: UINavigationController())
    }

    override func start() {
        setupMainCoordinator().start()
    }

    private func setupMainCoordinator() -> MainCoordinator {
        let coordinator = MainCoordinator(router: router)
        coordinator.showDetailAction = { [weak self] detail in
            self?.setupDetailCoordinator(withDetail: detail).start()
        }
        addChildCoordinator(coordinator)
        return coordinator
    }

    private func setupDetailCoordinator(withDetail detail: String) -> DetailCoordinator {
        let coordinator = DetailCoordinator(router: router, detail: detail)
        coordinator.willDismissDetailAction = { [weak self] in
            let mainCoordinator = self?.childCoordinator(of: MainCoordinator.self)
            mainCoordinator?.reset()
            self?.removeChildCoordinator(of: DetailCoordinator.self)
        }
        addChildCoordinator(coordinator)
        return coordinator
    }
}

private extension UIWindow {

    func configure(with navigationController: UINavigationController) {
        makeKeyAndVisible()
        rootViewController = navigationController
    }
}
