//
//  DetailViewController.swift
//  Architecture
//
//  Created by Adamas on 11/6/21.
//

import Foundation
import UIKit

final class DetailViewController: UIViewController {

    @IBOutlet private var label: UILabel!

    private lazy var viewModel: DetailViewModel = DetailViewModel(router: DetailRouter(viewController: self))

    func inject(parentRouter: DetailParentRouterType, detail: String) {
        viewModel.inject(parentRouter: parentRouter, detail: detail)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = viewModel.detail
    }

    @IBAction private func close() {
        viewModel.close()
    }
}
