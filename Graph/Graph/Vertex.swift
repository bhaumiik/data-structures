//
//  Vertex.swift
//  GraphTests
//
//  Created by Bhaumik on 2020-07-14.
//  Copyright © 2020 Bhaumik. All rights reserved.
//

import Foundation

public struct Vertex<T: Hashable> {
    var data: T
    var index: Int
}

extension Vertex: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(data)
        hasher.combine(index)
    }
}

public func ==<T> (lhs: Vertex<T>, rhs: Vertex<T>) -> Bool {
    guard lhs.data == rhs.data else { return false }
    guard lhs.index == rhs.index else { return false }
    return true
}
