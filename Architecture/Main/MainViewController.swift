//
//  MainViewController.swift
//  Architecture
//
//  Created by Adamas on 11/6/21.
//

import UIKit

final class MainViewController: ViewController<MainViewModelType> {

    @IBOutlet private var textField: UITextField!
    
    func inject(coordinator: MainCoordinatorType) {
        viewModel = MainViewModel(coordinator: coordinator)
    }
    
    func reset() {
        textField.text = nil
    }
    
    @IBAction private func showDetail() {
        guard let detail = textField.text else {
            return
        }
        viewModel?.showDetail(detail)
    }
}

