//
//  DetailViewController.swift
//  Architecture
//
//  Created by Adamas on 11/6/21.
//

import Foundation
import UIKit

final class DetailViewController: ViewController<DetailViewModelType> {

    @IBOutlet private var label: UILabel!
    
    func inject(coordinator: DetailCoordinatorType, detail: String) {
        viewModel = DetailViewModel(coordinator: coordinator, detail: detail)
    }

    @IBAction private func close() {
        viewModel?.close()
    }
    
    override func initialize(with viewModel: any DetailViewModelType) {
        label.text = viewModel.detail
    }
}
