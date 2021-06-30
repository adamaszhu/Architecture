//
//  ViewModel.swift
//  Architecture
//
//  Created by Adamas on 12/6/21.
//

public protocol ViewModelType: AnyObject {

    associatedtype Coordinator

    init()
    func inject(coordinator: Coordinator)
}

open class ViewModel<Coordinator: CoordinatorType>: ViewModelType {

    public private (set) weak var coordinator: Coordinator?

    required public init() {}

    public func inject(coordinator: Coordinator) {
        self.coordinator = coordinator
    }
}
