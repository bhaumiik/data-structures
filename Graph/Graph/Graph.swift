//
//  Graph.swift
//  GraphTests
//
//  Created by Bhaumik on 2020-07-12.
//  Copyright © 2020 Bhaumik. All rights reserved.
//

import Foundation

public class Graph<T: Hashable> {
    var vertices: [Vertex<T>] { fatalError() }
    var edges: [Edge<T>] { fatalError() }
    
    func createVertex(data: T) -> Vertex<T> { fatalError() }
    func addDirectedEdge(source: Vertex<T>, destination: Vertex<T>, weight: Double?) { fatalError() }
    func addUndirectedEdge(vertices: [Vertex<T>], weight: Double?) { fatalError() }
    func weightFrom(source: Vertex<T>, destination: Vertex<T>) -> Double? { fatalError() }
    func edgesFrom(vertex: Vertex<T>) -> [Edge<T>]? { fatalError() }
}
