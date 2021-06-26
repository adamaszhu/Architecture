//
//  MainRouter.swift
//  Architecture
//
//  Created by Adamas on 12/6/21.
//

import Foundation
import UIKit

protocol MainRouterType: OldRouterType, DetailParentRouterType {}

final class MainRouter: OldRouter<MainViewController>, MainRouterType {

    func showDetail(_ detail: String) {
        let storyboard = UIStoryboard(name: "Detail", bundle: nil)
        guard let viewController = storyboard.instantiateInitialViewController() as? DetailViewController else {
            return
        }
        viewController.inject(parentRouter: self, detail: detail)
        self.viewController.navigationController?.pushViewController(viewController, animated: true)
    }

    func didShowDetail() {
        viewController.reset()
    }
}
