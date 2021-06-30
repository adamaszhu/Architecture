//
//  DetailViewModel.swift
//  Architecture
//
//  Created by Adamas on 12/6/21.
//

import Foundation

protocol DetailViewModelType: ViewModelType {

    var detail: String { get }
    
    func inject(detail: String)
    func close()
}

final class DetailViewModel: ViewModel<DetailCoordinator>, DetailViewModelType {

    private (set) var detail: String = ""

    func inject(detail: String) {
        self.detail = detail
    }

    func close() {
        coordinator?.close()
    }
}
