//
//  Edge.swift
//  GraphTests
//
//  Created by Bhaumik on 2020-07-14.
//  Copyright © 2020 Bhaumik. All rights reserved.
//

import Foundation

public struct Edge<T: Hashable> {
    var from: Vertex<T>
    var to: Vertex<T>
    var weight: Double?
}

extension Edge: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(from.data)
        hasher.combine(to.data)
        hasher.combine(weight)
    }
}

public func == <T>(lhs: Edge<T>, rhs: Edge<T>) -> Bool {
    guard lhs.from == rhs.from else { return false }
    guard lhs.to == rhs.to else { return false }
    guard lhs.weight == rhs.weight else { return false }
    return true
}
