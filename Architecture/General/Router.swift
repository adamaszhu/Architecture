//
//  Router.swift
//  Architecture
//
//  Created by Adamas on 12/6/21.
//

import Foundation
import UIKit

public protocol RouterType: AnyObject {
    associatedtype ViewController: UIViewController
    var viewController: ViewController { get }
}

open class Router<ViewController: UIViewController>: RouterType {

    public private (set) unowned var viewController: ViewController

    public init(viewController: ViewController) {
        self.viewController = viewController
    }
}
