//
//  DetailRouter.swift
//  Architecture
//
//  Created by Adamas on 12/6/21.
//

import Foundation
import UIKit

protocol DetailCoordinatorType: CoordinatorType {
    func close()
}

final class DetailCoordinator: Coordinator, DetailCoordinatorType {
    
    private let detail: String
    
    init(navigationController: UINavigationController?,
         parentCoordinator: CoordinatorType?,
         detail: String) {
        self.detail = detail
        super.init(navigationController: navigationController, parentCoordinator: parentCoordinator)
    }
    
    override func start(from sender: Any?) {
        let viewController = R.storyboard.detail.instantiateInitialViewController()!
        viewController.inject(coordinator: self, detail: detail)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func close() {
        if let mainCoordinator = parentCoordinator as? MainCoordinatorType {
            mainCoordinator.reset()
        }
        dismiss()
    }
}
