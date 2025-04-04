//
//  NavigationState.swift
//  SwiftUISandbox
//
//  Created by Борис Анели on 20.11.2024.
//

import SwiftUI

@Observable
public class NavigationGraphNode<Route: NavigationGraphRoute>: Identifiable {

    public let id: String = UUID().uuidString

    var navigationHash: Int {
        var hasher = Hasher()
        hasher.combine(id)
        hasher.combine(root)
        hasher.combine(path.hashValue)
        return hasher.finalize()
    }

    let root: Route
    var path: [Route] = []
    var sheet: NavigationGraphNode?
    var fullScreenCover: NavigationGraphNode?

    private(set) weak var parent: NavigationGraphNode?
    private(set) weak var child: NavigationGraphNode?

    init(root: Route, parent: NavigationGraphNode? = nil) {
        self.root = root
        self.parent = parent
    }

    func navigate(to route: Route) {
        path.append(route)
    }

    func sheet(_ route: Route) {
        guard child == nil else {
            assertionFailure("Another view is already presented")
            return
        }
        sheet = NavigationGraphNode(root: route, parent: self)
        child = sheet
    }

    func fullScreen(_ route: Route) {
        guard child == nil else {
            assertionFailure("Another view is already presented")
            return
        }
        fullScreenCover = NavigationGraphNode(root: route, parent: self)
        child = fullScreenCover
    }

    func dismiss() {
        guard let parent = parent else { return }
        parent.sheet = nil
        parent.fullScreenCover = nil
    }
}
