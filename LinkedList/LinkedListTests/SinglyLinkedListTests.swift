//
//  LinkedListTests.swift
//  LinkedListTests
//
//  Created by Bhaumik on 2020-07-09.
//  Copyright © 2020 Bhaumik. All rights reserved.
//

import XCTest

class SinglyLinkedListTests: XCTestCase {
    var singlyLinkedList: SinglyLinkedList<Int>!
    
    override func setUpWithError() throws {
        self.singlyLinkedList = SinglyLinkedList<Int>(node: 1)
        self.singlyLinkedList.insert(node: 2)
        self.singlyLinkedList.insert(node: 3)
        self.singlyLinkedList.insert(node: 4)
        self.singlyLinkedList.insert(node: 5)
    }

    override func tearDownWithError() throws {
        self.singlyLinkedList = nil
    }

    func testInsert() {
        self.singlyLinkedList.insert(node: 6)
        XCTAssertTrue(self.singlyLinkedList.getTail()?.node == 6)
    }
    
    func testDeleteFirstNode() {
        let head = self.singlyLinkedList.delete(node: 1)
        XCTAssertTrue(head?.node == 2)
        XCTAssertTrue(head?.next?.node == 3)
    }

    func testDeleteMiddleNode() {
        let head = self.singlyLinkedList.delete(node: 3)
        XCTAssertTrue(head?.node == 2)
        XCTAssertTrue(head?.next?.node == 4)
    }
    
    func testDeleteLastNode() {
        let head = self.singlyLinkedList.delete(node: 5)
        XCTAssertTrue(head?.node == 4)
        XCTAssertTrue(head?.next?.node == nil)
    }
}
