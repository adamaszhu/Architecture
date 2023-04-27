//
//  ViewModel.swift
//  Architecture
//
//  Created by Adamas on 12/6/21.
//

public protocol ViewModelType: AnyObject {
    
    associatedtype Coordinator
    
    /// The coordinator that controls the screen
    var coordinator: Coordinator { get }
}

open class ViewModel<Coordinator>: ViewModelType {
    
    public let coordinator: Coordinator
    
    /// Initialize the view model
    /// - Parameter coordinator: The coordinator that controls the screen
    public init(coordinator: Coordinator) {
        self.coordinator = coordinator
    }
}
