//
//  Coordinator.swift
//  Architecture
//
//  Created by Adamas on 25/6/21.
//
import UIKit

public protocol CoordinatorType: AnyObject {
    
    /// The navigation controller that controls the current screen
    var navigationController: UINavigationController? { get }
    
    /// The coordinator that generated the current coordinator
    var parentCoordinator: CoordinatorType? { get }
    
    /// Start the current screen
    /// - Parameter sender: The view that triggers the new screen. It is mandatory if we want to modally present something on iPads.
    func start(from sender: Any?)
}

public extension CoordinatorType {
    
    /// A shortcut for staring the current screen. Note that this shoudn't be called if we want to modally present something on iPads.
    func start() {
        start(from: nil)
    }
    
    /// Dismiss the current screen
    func dismiss() {
        if let navigationController = navigationController,
           navigationController.viewControllers.count > 1 {
            navigationController.popViewController(animated: true)
        } else {
            navigationController?.dismiss(animated: true)
        }
    }
}

open class Coordinator: CoordinatorType {
    
    /// The navigation controller that controls the current screen. Any actual coordinator can generate a new navigation controller, present it and replace the navigation controller here.
    public weak var navigationController: UINavigationController?
    
    public private (set) weak var parentCoordinator: CoordinatorType?
    
    /// Create the coordinator
    /// - Parameters:
    ///   - navigationController: The navigation controlelr that controls the screen.
    ///   - parentCoordinator: The coordinator that generated the current coordinator.
    public init(navigationController: UINavigationController?,
                parentCoordinator: CoordinatorType?) {
        self.navigationController = navigationController
        self.parentCoordinator = parentCoordinator
    }
    
    public func start(from sender: Any?) {
        fatalError("The start function should be overridden by an actual coordinator")
    }
}
