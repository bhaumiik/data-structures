//
//  TreeTests.swift
//  TreeTests
//
//  Created by Bhaumik on 2020-07-10.
//  Copyright © 2020 Bhaumik. All rights reserved.
//

import XCTest

class TreeTests: XCTestCase {
    var treeRootNode: Tree<String>!
    
    override func setUpWithError() throws {
        self.treeRootNode = Tree<String>(value: "beverages")
    }

    override func tearDownWithError() throws {
        self.treeRootNode = nil
    }

    func testAddChild() {
        let hotNode = Tree<String>(value: "hot")
        let coldNode = Tree<String>(value: "cold")
        self.treeRootNode.add(child: hotNode)
        self.treeRootNode.add(child: coldNode)
        XCTAssertTrue(self.treeRootNode.children.count > 0)
    }
    
    func testSearchChild() {
        let hotNode = Tree<String>(value: "hot")
        let coldNode = Tree<String>(value: "cold")
        
        let teaNode = Tree<String>(value: "tea")
        let coffeeNode = Tree<String>(value: "coffee")
        let cocoaNode = Tree<String>(value: "cocoa")
        
        let blackTeaNode = Tree<String>(value: "black")
        let greenTeaNode = Tree<String>(value: "green")
        
        let sodaNode = Tree<String>(value: "soda")
        let milkNode = Tree<String>(value: "milk")
        
        self.treeRootNode.add(child: hotNode)
        self.treeRootNode.add(child: coldNode)
        
        hotNode.add(child: teaNode)
        hotNode.add(child: coffeeNode)
        hotNode.add(child: cocoaNode)
        
        teaNode.add(child: blackTeaNode)
        teaNode.add(child: greenTeaNode)
        
        coldNode.add(child: sodaNode)
        coldNode.add(child: milkNode)
        print(self.treeRootNode.description) // prints tree description
        
        let node = self.treeRootNode.search(value: "tea")
        XCTAssertTrue(node?.parent?.value == "hot")
        XCTAssertTrue(node?.children.count == 2)
    }
}
