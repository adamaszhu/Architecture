//
//  Coordinator.swift
//  Architecture
//
//  Created by Adamas on 25/6/21.
//

public protocol CoordinatorType: AnyObject {
    func start()
    func childCoordinator<Type: CoordinatorType>(of type: Type.Type) -> Type?
    func addChildCoordinator<Type: CoordinatorType>(_ childCoordinator: Type)
    func removeChildCoordinator<Type: CoordinatorType>(of type: Type.Type)
}

open class Coordinator: CoordinatorType {

    private var childCoordinators = [CoordinatorType]()

    public func start() {
        fatalError()
    }

    public func childCoordinator<Type: CoordinatorType>(of type: Type.Type) -> Type? {
        childCoordinators
            .compactMap { $0 as? Type }
            .first
    }

    public func addChildCoordinator<Type: CoordinatorType>(_ childCoordinator: Type) {
        removeChildCoordinator(of: Type.self)
        childCoordinators.append(childCoordinator)
    }

    public func removeChildCoordinator<Type: CoordinatorType>(of type: Type.Type) {
        childCoordinators.removeAll(where: { $0 is Type })
    }
}
