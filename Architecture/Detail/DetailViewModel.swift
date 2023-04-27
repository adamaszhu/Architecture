//
//  DetailViewModel.swift
//  Architecture
//
//  Created by Adamas on 12/6/21.
//

import Foundation

protocol DetailViewModelType: ViewModelType {

    var detail: String { get }
    
    func close()
}

final class DetailViewModel: ViewModel<DetailCoordinatorType>, DetailViewModelType {

    let detail: String

    init(coordinator: DetailCoordinatorType,
         detail: String) {
        self.detail = detail
        super.init(coordinator: coordinator)
    }

    func close() {
        coordinator.close()
    }
}
