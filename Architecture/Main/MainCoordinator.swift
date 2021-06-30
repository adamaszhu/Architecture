//
//  MainRouter.swift
//  Architecture
//
//  Created by Adamas on 12/6/21.
//

import Foundation
import UIKit

protocol MainCoordinatorType: CoordinatorType {

    var showDetailAction: (String) -> Void { get set }
    
    func showDetail(_ detail: String)
    func reset()
}

final class MainCoordinator: Coordinator, MainCoordinatorType {

    var showDetailAction: (String) -> Void = { _ in }

    private let router: RouterType

    private lazy var viewController: MainViewController = R.storyboard.main.instantiateInitialViewController()!

    init(router: RouterType) {
        self.router = router
    }

    override func start() {
        viewController.inject(coordinator: self)
        router.push(viewController)
    }

    func showDetail(_ detail: String) {
        showDetailAction(detail)
    }

    func reset() {
        viewController.reset()
    }
}
