//
//  MainViewModel.swift
//  Architecture
//
//  Created by Adamas on 12/6/21.
//

import Foundation

protocol MainViewModelType: ViewModelType {
    func showDetail(_ detail: String)
}

final class MainViewModel: ViewModel<MainCoordinator>, MainViewModelType {

    func showDetail(_ detail: String) {
        coordinator?.showDetail(detail)
    }
}
