//
//  AdjacencyListGraphTests.swift
//  AdjacencyListGraphTests
//
//  Created by Bhaumik on 2020-07-12.
//  Copyright © 2020 Bhaumik. All rights reserved.
//

import XCTest

class AdjacencyListGraphTests: XCTestCase {
    var graph: AdjacencyListGraph<String>!
    var vertexA: Vertex<String>!
    var vertexB: Vertex<String>!
    var vertexC: Vertex<String>!
    var vertexD: Vertex<String>!
    
    override func setUpWithError() throws {
        graph = AdjacencyListGraph<String>()
        vertexA = graph.createVertex(data: "a")
        vertexB = graph.createVertex(data: "b")
        vertexC = graph.createVertex(data: "c")
        vertexD = graph.createVertex(data: "d")
        graph.addDirectedEdge(source: vertexA, destination: vertexB, weight: 1.0)
        graph.addDirectedEdge(source: vertexA, destination: vertexD, weight: 3.0)
        graph.addDirectedEdge(source: vertexB, destination: vertexC, weight: 2.0)
        graph.addDirectedEdge(source: vertexC, destination: vertexD, weight: 1.5)
    }

    override func tearDownWithError() throws {
        graph = nil
        vertexA = nil
        vertexB = nil
        vertexC = nil
        vertexD = nil
    }
    
    func testEdgeWeight() {
        let weightBtoC = self.graph.weightFrom(source: vertexB, destination: vertexC)
        XCTAssertEqual(weightBtoC, 2.0)
    }
    
    func testNumOfEdges() {
        let edgesFromA = graph.edgesFrom(vertex: vertexA)
        XCTAssertEqual(edgesFromA?.count ?? 0, 2)
        let edgesFromB = graph.edgesFrom(vertex: vertexB)
        XCTAssertEqual(edgesFromB?.count ?? 0, 1)
        let edgesFromC = graph.edgesFrom(vertex: vertexC)
        XCTAssertEqual(edgesFromC?.count ?? 0, 1)
        let edgesFromD = graph.edgesFrom(vertex: vertexD)
        XCTAssertEqual(edgesFromD?.count ?? 0, 0)
    }
}
