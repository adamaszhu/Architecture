//
//  DetailRouter.swift
//  Architecture
//
//  Created by Adamas on 12/6/21.
//

import Foundation

protocol DetailCoordinatorType: CoordinatorType {

    var willDismissDetailAction: () -> Void { get set }
    
    func close()
}

final class DetailCoordinator: Coordinator, DetailCoordinatorType {

    var willDismissDetailAction: () -> Void = {}

    private let router: RouterType
    private let detail: String

    private lazy var viewController: DetailViewController = R.storyboard.detail.instantiateInitialViewController()!

    init(router: RouterType, detail: String) {
        self.router = router
        self.detail = detail
    }

    override func start() {
        viewController.inject(coordinator: self)
        viewController.inject(detail: detail)
        router.push(viewController)
    }

    func close() {
        willDismissDetailAction()
        router.pop()
    }
}
