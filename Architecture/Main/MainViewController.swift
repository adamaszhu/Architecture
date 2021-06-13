//
//  MainViewController.swift
//  Architecture
//
//  Created by Adamas on 11/6/21.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet private var textField: UITextField!

    private lazy var viewModel: MainViewModel = MainViewModel(router: MainRouter(viewController: self))

    func reset() {
        textField.text = nil
    }
    
    @IBAction private func showDetail() {
        guard let detail = textField.text else {
            return
        }
        viewModel.showDetail(detail)
    }
}

