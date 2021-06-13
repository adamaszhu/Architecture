//
//  DetailRouter.swift
//  Architecture
//
//  Created by Adamas on 12/6/21.
//

import Foundation

protocol DetailRouterType: RouterType {
    func inject(parentRouter: DetailParentRouterType)
    func close()
}

final class DetailRouter: Router<DetailViewController>, DetailRouterType {

    private weak var parentRouter: DetailParentRouterType?

    func inject(parentRouter: DetailParentRouterType) {
        self.parentRouter = parentRouter
    }

    func close() {
        parentRouter?.didShowDetail()
        viewController.navigationController?.popViewController(animated: true)
    }
}
