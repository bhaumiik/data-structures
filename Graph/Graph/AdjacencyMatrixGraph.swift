//
//  AdjacencyMatrixGraph.swift
//  GraphTests
//
//  Created by Bhaumik on 2020-07-14.
//  Copyright © 2020 Bhaumik. All rights reserved.
//

import Foundation

public class AdjacencyMatrixGraph<T: Hashable>: Graph<T> {
    private var adjacencyMatrix: [[Double?]] = []
    private var verticesList: [Vertex<T>] = []
    
    override var vertices: [Vertex<T>] {
        return self.verticesList
    }
    
    override var edges: [Edge<T>] {
        var edges = [Edge<T>]()
        for row in 0 ..< self.adjacencyMatrix.count {
            for column in 0 ..< self.adjacencyMatrix.count {
                let weight = self.adjacencyMatrix[row][column]
                edges.append(Edge(from: vertices[row], to: vertices[column], weight: weight))
            }
        }
        return edges
    }
    
    /// Adds a new vertex to the matrix.
    /// - Complexity: O(*n²*), because of resizing of the Matrix.
    override func createVertex(data: T) -> Vertex<T> {
        // check if the vertex already exists
        let matchingVertices = self.vertices.filter { (vertex) -> Bool in
            return vertex.data == data
        }
        
        if matchingVertices.count > 0 {
            return matchingVertices.last!
        }
        
        // if the vertex doesn't exist, create a new one
        let vertex = Vertex(data: data, index: self.adjacencyMatrix.count)
        self.verticesList.append(vertex)
        
        // Expand each existing row to the right one column.
        for row in 0 ..< self.adjacencyMatrix.count {
            self.adjacencyMatrix[row].append(nil)
        }
        
        // Add one new row at the bottom.
        let newRow = [Double?](repeating: nil, count: self.adjacencyMatrix.count + 1)
        self.adjacencyMatrix.append(newRow)
        return vertex
    }
    
    /// Adds directed edge.
    override func addDirectedEdge(source: Vertex<T>, destination: Vertex<T>, weight: Double?) {
        self.adjacencyMatrix[source.index][destination.index] = weight
    }
    
    /// Adds undirected edge.
    override func addUndirectedEdge(vertices: [Vertex<T>], weight: Double?) {
        self.addDirectedEdge(source: vertices.first!, destination: vertices.last!, weight: weight)
        self.addDirectedEdge(source: vertices.last!, destination: vertices.first!, weight: weight)
    }
    
    /// - Returns: `weight` of edge between source vertex and destination vertex.
    override func weightFrom(source: Vertex<T>, destination: Vertex<T>) -> Double? {
        return self.adjacencyMatrix[source.index][destination.index]
    }
    
    /// - Returns: The list of `Edges` from given vertex.
    override func edgesFrom(vertex: Vertex<T>) -> [Edge<T>]? {
        var edges = [Edge<T>]()
        let row = vertex.index
        for column in 0 ..< self.adjacencyMatrix.count {
            guard let weight = self.adjacencyMatrix[row][column] else { continue }
            let edge = Edge(from: vertex, to: self.vertices[column], weight: weight)
            edges.append(edge)
        }
        return edges
    }
}

