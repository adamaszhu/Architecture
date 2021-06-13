//
//  DetailViewModel.swift
//  Architecture
//
//  Created by Adamas on 12/6/21.
//

import Foundation

protocol DetailViewModelType: ViewModelType {
    var detail: String { get }
    func inject(parentRouter: DetailParentRouterType, detail: String)
    func close()
}

final class DetailViewModel<DetailRouter: DetailRouterType>: ViewModel<DetailRouter>, DetailViewModelType {

    private (set) var detail: String = ""

    func inject(parentRouter: DetailParentRouterType, detail: String) {
        self.detail = detail
        router.inject(parentRouter: parentRouter)
    }

    func close() {
        router.close()
    }
}
