//
//  MainViewController.swift
//  Architecture
//
//  Created by Adamas on 11/6/21.
//

import UIKit

class MainViewController: ViewController<MainViewModel> {

    @IBOutlet private var textField: UITextField!

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

