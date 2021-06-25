//
//  AppCoordinator.swift
//  Architecture
//
//  Created by Adamas on 25/6/21.
//

import Foundation
import UIKit

final class AppCoordinator: Coordinator {

    private let window: UIWindow
    private let navigationController: UINavigationController

    init(window: UIWindow, navigationController: UINavigationController) {
        self.window = window
        self.navigationController = navigationController
        window.configure(with: navigationController)
    }

    convenience init() {
        self.init(window: UIWindow(), navigationController: UINavigationController())
    }

    func start() {
        let viewController = R.storyboard.main.instantiateInitialViewController()!
        navigationController.pushViewController(viewController, animated: true)
    }
}

private extension UIWindow {

    func configure(with navigationController: UINavigationController) {
        makeKeyAndVisible()
        rootViewController = navigationController
    }
}
