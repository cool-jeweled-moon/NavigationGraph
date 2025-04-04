//
//  NavigationGraphState.swift
//  RiTodo
//
//  Created by Борис Анели on 05.01.2025.
//

import Foundation

@Observable
public class NavigationGraphState<Route: NavigationGraphRoute> {

    public let root: NavigationGraphNode<Route>

    public init(root: Route) {
        self.root = NavigationGraphNode(root: root)
    }

    private var currentNode: NavigationGraphNode<Route> {
        var currentNode = root
        while let child = currentNode.child {
            currentNode = child
        }
        return currentNode
    }

    public func navigate(to route: Route) {
        currentNode.navigate(to: route)
    }

    public func sheet(_ route: Route) {
        currentNode.sheet(route)
    }

    public func fullScreen(_ route: Route) {
        currentNode.fullScreen(route)
    }

    public func dismiss() {
        currentNode.dismiss()
    }

    public func dismissToRoot() {
        root.dismiss()
    }
}
