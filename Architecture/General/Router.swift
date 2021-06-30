//
//  Router.swift
//  Architecture
//
//  Created by Adamas on 28/6/21.
//

import UIKit

public protocol RouterType: AnyObject {
    init(navigationController: UINavigationController)
    func push(_ viewController: UIViewController)
    func pop()
    func popTo(_ viewController: UIViewController)
}

open class Router: RouterType {

    private let navigationController: UINavigationController

    required public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    public func push(_ viewController: UIViewController) {
        navigationController.pushViewController(viewController, animated: true)
    }

    public func pop() {
        navigationController.popViewController(animated: true)
    }

    public func popTo(_ viewController: UIViewController) {
        navigationController.popToViewController(viewController, animated: true)
    }
}
