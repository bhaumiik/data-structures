//
//  BinaryTreeTests.swift
//  BinaryTreeTests
//
//  Created by Bhaumik on 2020-07-10.
//  Copyright © 2020 Bhaumik. All rights reserved.
//

import XCTest

class BinaryTreeTests: XCTestCase {
    var binaryTree: BinaryTree<String>!

    override func setUpWithError() throws {
        // leaf nodes
        let nodeA = BinaryTree<String>(left: nil, value: "a", right: nil)
        let node10 = BinaryTree<String>(left: nil, value: "10", right: nil)
        let node4 = BinaryTree<String>(left: nil, value: "4", right: nil)
        let node3 = BinaryTree<String>(left: nil, value: "3", right: nil)
        let nodeB = BinaryTree<String>(left: nil, value: "b", right: nil)
        let node5 = BinaryTree<String>(left: nil, value: "5", right: nil)
        
        // intermediate nodes on the left
        let nodeAminus10 = BinaryTree<String>(left: nodeA, value: "-", right: node10)
        let timesLeft = BinaryTree<String>(left: node5, value: "*", right: nodeAminus10)
 
        // intermediate nodes on the right
        let nodeMinus4 = BinaryTree<String>(left: node4, value: "-", right: nil)
        let nodeDivide = BinaryTree<String>(left: node3, value: "/", right: nodeB)
        let timesRight = BinaryTree<String>(left: nodeMinus4, value: "*", right: nodeDivide)
        
        // Root node
        self.binaryTree = BinaryTree<String>(left: timesLeft, value: "+", right: timesRight)
    }

    override func tearDownWithError() throws {
        self.binaryTree = nil
    }
    
    func testInsert() {
        self.binaryTree.insert(node: BinaryTree<String>(left: nil, value: "1", right: nil))
        var node = self.binaryTree
        while node?.left != nil {
            node = node?.left
        }
        XCTAssertTrue(node?.value == "1")
    }

    func testInOrderTraversal() {
        let inOrderResult = ["5", "*", "a", "-", "10", "+", "4", "-", "*", "3", "/", "b"]
        var result = [String]()
        self.binaryTree.traverseInOrder { (value) in
            result.append(value)
        }
        print(result)
        XCTAssertTrue(result == inOrderResult)
    }
    
    func testPreOrderTraversal() {
        let preOrderResult = ["+", "*", "5", "-", "a", "10", "*", "-", "4", "/", "3", "b"]
        var result = [String]()
        self.binaryTree.traversePreOrder { (value) in
            result.append(value)
        }
        XCTAssertTrue(result == preOrderResult)
    }
    
    func testPostOrderTraversal() {
        let postOrderResult = ["5", "a", "10", "-", "*", "4", "-", "3", "b", "/", "*", "+"]
        var result = [String]()
        self.binaryTree.traversePostOrder { (value) in
            result.append(value)
        }
        XCTAssertTrue(result == postOrderResult)
    }
}
