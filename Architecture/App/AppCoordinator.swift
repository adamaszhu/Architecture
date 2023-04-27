//
//  AppCoordinator.swift
//  Architecture
//
//  Created by Adamas on 25/6/21.
//

import Foundation
import UIKit

protocol AppCoordinatorType: CoordinatorType {}

final class AppCoordinator: Coordinator, AppCoordinatorType {
    
    private let window: UIWindow

    init(window: UIWindow) {
        self.window = window
        let navigationController = UINavigationController()
        window.rootViewController = navigationController
        super.init(navigationController: navigationController, parentCoordinator: nil)
        self.navigationController = navigationController
    }

    convenience init() {
        self.init(window: UIWindow())
    }

    override func start(from sender: Any?) {
        window.makeKeyAndVisible()
        MainCoordinator(navigationController: navigationController,
                        parentCoordinator: self)
        .start()
    }
}
