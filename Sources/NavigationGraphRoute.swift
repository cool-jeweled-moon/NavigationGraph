//
//  NavigationRoute.swift
//  MVarch
//
//  Created by Борис Анели on 04.04.2025.
//

import Foundation

public protocol NavigationGraphRoute: Identifiable, Hashable {}

public extension NavigationGraphRoute {
    var id: String { "\(hashValue)" }
}
