//
//  NavigationGraphState.swift
//  RiTodo
//
//  Created by Борис Анели on 05.01.2025.
//

import Foundation

@Observable
public class NavigationGraphState<Route: NavigationGraphRoute> {

    let root: NavigationGraphNode<Route>

    init(root: Route) {
        self.root = NavigationGraphNode(root: root)
    }

    private var currentNode: NavigationGraphNode<Route> {
        var currentNode = root
        while let child = currentNode.child {
            currentNode = child
        }
        return currentNode
    }

    func navigate(to route: Route) {
        currentNode.navigate(to: route)
    }

    func sheet(_ route: Route) {
        currentNode.sheet(route)
    }

    func fullScreen(_ route: Route) {
        currentNode.fullScreen(route)
    }

    func dismiss() {
        currentNode.dismiss()
    }

    func dismissToRoot() {
        root.dismiss()
    }
}
