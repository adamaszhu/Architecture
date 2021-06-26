//
//  Router.swift
//  Architecture
//
//  Created by Adamas on 12/6/21.
//

import Foundation
import UIKit

public protocol OldRouterType: AnyObject {
    associatedtype ViewController: UIViewController
    var viewController: ViewController { get }
}

open class OldRouter<ViewController: UIViewController>: OldRouterType {

    public private (set) unowned var viewController: ViewController

    public init(viewController: ViewController) {
        self.viewController = viewController
    }
}
