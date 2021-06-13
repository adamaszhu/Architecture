//
//  ViewModel.swift
//  Architecture
//
//  Created by Adamas on 12/6/21.
//

import Foundation

public protocol ViewModelType: AnyObject {
    associatedtype Router
    var router: Router { get }
}

open class ViewModel<Router: RouterType>: ViewModelType {

    public let router: Router

    public init(router: Router) {
        self.router = router
    }
}
