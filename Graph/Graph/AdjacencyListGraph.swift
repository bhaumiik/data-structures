//
//  AdjacencyListGraph.swift
//  GraphTests
//
//  Created by Bhaumik on 2020-07-14.
//  Copyright © 2020 Bhaumik. All rights reserved.
//

import Foundation

public class Adjacency<T: Hashable> {
    var vertex: Vertex<T>
    var edges: [Edge<T>]?
    
    init(vertex: Vertex<T>) {
        self.vertex = vertex
    }
    
    func add(edge: Edge<T>) {
        if self.edges == nil {
            self.edges = [edge]
        } else {
            self.edges?.append(edge)
        }
    }
}

public class AdjacencyListGraph<T: Hashable>: Graph<T> {
    private var adjacencyList = [Adjacency<T>]()
    
    override var vertices: [Vertex<T>] {
        var vertices = [Vertex<T>]()
        for adjacency in adjacencyList {
            vertices.append(adjacency.vertex)
        }
        return vertices
    }
    
    override var edges: [Edge<T>] {
        var allEdges = Set<Edge<T>>()
        for adjacency in adjacencyList {
            guard let edges = adjacency.edges else { continue }
            for edge in edges {
                allEdges.insert(edge)
            }
        }
        return Array(allEdges)
    }
    
    override func createVertex(data: T) -> Vertex<T> {
        // check if the vertex already exists
        let matchingVertices = vertices.filter { (vertex) -> Bool in
            return vertex.data == data
        }
        
        if matchingVertices.count > 0 {
            return matchingVertices.last!
        }
        
        // if the vertex doesn't exist, create a new one
        let vertex = Vertex(data: data, index: adjacencyList.count)
        adjacencyList.append(Adjacency(vertex: vertex))
        return vertex
    }
     
    override func addDirectedEdge(source: Vertex<T>, destination: Vertex<T>, weight: Double?) {
        let edge = Edge(from: source, to: destination, weight: weight)
        adjacencyList[source.index].add(edge: edge)
    }
    
    override func addUndirectedEdge(vertices: [Vertex<T>], weight: Double?) {
        addDirectedEdge(source: vertices.first!, destination: vertices.last!, weight: weight)
        addDirectedEdge(source: vertices.last!, destination: vertices.first!, weight: weight)
    }
    
    override func weightFrom(source: Vertex<T>, destination: Vertex<T>) -> Double? {
        let adjacency = adjacencyList[source.index]
        guard let edges = adjacency.edges else { return nil }
        for edge in edges {
            if edge.to == destination {
                return edge.weight
            }
        }
        return nil
    }
    
    override func edgesFrom(vertex: Vertex<T>) -> [Edge<T>]? {
        return adjacencyList[vertex.index].edges
    }
}
