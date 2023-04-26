//
//  ViewController.swift
//  Architecture
//
//  Created by Adamas on 30/6/21.
//

import UIKit

public protocol ViewControllerType: AnyObject {
    
    associatedtype ViewModel
    
    /// The view model that provides data to the screen
    var viewModel: ViewModel? { get }
    
    /// Initialize the screen
    /// - Parameter viewModel: The view model that interacts with the screen
    func initialize(with viewModel: ViewModel)
}

open class ViewController<ViewModel>: UIViewController, ViewControllerType {
    
    /// The view model that provides data to the screen. Any `inject` function will create the actual view model.
    public var viewModel: ViewModel?
    
    open func initialize(with viewModel: ViewModel) {}
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        if let viewModel = viewModel {
            initialize(with: viewModel)
        }
    }
}
