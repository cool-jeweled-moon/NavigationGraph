//
//  NavigationGraphView.swift
//  RiTodo
//
//  Created by Борис Анели on 05.01.2025.
//

import SwiftUI

public struct NavigationGraphView<Route: NavigationGraphRoute>: View {
    @State
    private(set) var node: NavigationGraphNode<Route>

    @ViewBuilder
    let routeBuilder: (Route) -> any View

    public var body: some View {
        NavigationStack(path: $node.path) {
            AnyView(routeBuilder(node.root))
                .navigationDestination(for: Route.self) { route in
                    AnyView(routeBuilder(route))
                }
                .sheet(item: $node.sheet) { sheetNode in
                    NavigationGraphView(
                        node: sheetNode,
                        routeBuilder: routeBuilder
                    )
                }
                .fullScreenCover(item: $node.fullScreenCover) { coverNode in
                    NavigationGraphView(
                        node: coverNode,
                        routeBuilder: routeBuilder
                    )
                }
        }
        .id(node.navigationHash)
    }
}
