//
//  BinarySearchTreeTests.swift
//  BinarySearchTreeTests
//
//  Created by Bhaumik on 2020-07-11.
//  Copyright © 2020 Bhaumik. All rights reserved.
//

import XCTest

class BinarySearchTreeTests: XCTestCase {
    var binarySearchTree: BinarySearchTree<Int>!
    
    override func setUpWithError() throws {
        self.binarySearchTree = BinarySearchTree<Int>(array: [7, 2, 5, 10, 9, 1])
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSearch() {
        let node = self.binarySearchTree.search(value: 2)
        XCTAssertTrue(node?.value == 2)
        XCTAssertTrue(node?.parent?.value == 7)
        XCTAssertTrue(node?.left?.value == 1)
        XCTAssertTrue(node?.right?.value == 5)
    }
    
    func testDelete() {
        self.binarySearchTree.search(value: 2)?.delete()
        var result = [Int]()
        self.binarySearchTree.traverseInOrder { (value) in
            result.append(value)
        }
        XCTAssertEqual(result, [1, 5, 7, 9, 10])
    }
    
    func testHeight() {
        let height = self.binarySearchTree.getHeight()
        XCTAssertEqual(height, 2)
    }
    
    func testDepth() {
        let depth = self.binarySearchTree.search(value: 2)?.getDepth()
        XCTAssertEqual(depth, 1)
    }
    
    func testPredeccessor() {
        let predeccessor = self.binarySearchTree.getPredeccessor()
        XCTAssertEqual(predeccessor?.value, 5)
    }

    func testSuccessor() {
        let successor = self.binarySearchTree.getSuccessor()
        XCTAssertEqual(successor?.value, 9)
    }
    
    func testBST() {
        let isBST = self.binarySearchTree.isBST(minValue: Int.min, maxValue: Int.max)
        XCTAssertEqual(isBST, true)
    }
    
    func testInOrderTraversal() {
        let inOrderTraversalResult = [1, 2, 5, 7, 9, 10]
        var result = [Int]()
        self.binarySearchTree.traverseInOrder { (value) in
            result.append(value)
        }
        XCTAssertEqual(result, inOrderTraversalResult)
    }
    
    func testPreOrderTraversal() {
        let preOrderTraversalResult = [7, 2, 1, 5, 10, 9]
        var result = [Int]()
        self.binarySearchTree?.traversePreOrder { (value) in
            result.append(value)
        }
        XCTAssertEqual(result, preOrderTraversalResult)
    }
    
    func testPostOrderTraversal() {
        let postOrderTraversalResult = [1, 5, 2, 9, 10, 7]
        var result = [Int]()
        self.binarySearchTree.traversePostOrder { (value) in
            result.append(value)
        }
        XCTAssertEqual(result, postOrderTraversalResult)
    }
}
