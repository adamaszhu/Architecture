//
//  ViewController.swift
//  Architecture
//
//  Created by Adamas on 30/6/21.
//

import UIKit

public protocol ViewControllerType: AnyObject {

    associatedtype Coordinator

    func inject(coordinator: Coordinator)
}

open class ViewController<ViewModel: ViewModelType>: UIViewController, ViewControllerType {

    public let viewModel = ViewModel()

    public func inject(coordinator: ViewModel.Coordinator) {
        viewModel.inject(coordinator: coordinator)
    }
}
