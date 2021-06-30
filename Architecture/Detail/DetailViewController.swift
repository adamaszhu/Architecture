//
//  DetailViewController.swift
//  Architecture
//
//  Created by Adamas on 11/6/21.
//

import Foundation
import UIKit

final class DetailViewController: ViewController<DetailViewModel> {

    @IBOutlet private var label: UILabel!

    func inject(detail: String) {
        viewModel.inject(detail: detail)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = viewModel.detail
    }

    @IBAction private func close() {
        viewModel.close()
    }
}
