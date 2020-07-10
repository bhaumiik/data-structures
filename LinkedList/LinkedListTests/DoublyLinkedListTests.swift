//
//  DoublyLinkedListTests.swift
//  LinkedListTests
//
//  Created by Bhaumik on 2020-07-09.
//  Copyright © 2020 Bhaumik. All rights reserved.
//

import XCTest

class DoublyLinkedListTests: XCTestCase {
    var doublyLinkedList: DoublyLinkedList<Int>!
    
    override func setUpWithError() throws {
        self.doublyLinkedList = DoublyLinkedList(node: 0)
    }

    override func tearDownWithError() throws {
        self.doublyLinkedList = nil
    }

    func testInsert() throws {
        self.doublyLinkedList.insert(node: 1)
        self.doublyLinkedList.insert(node: 2)
        self.doublyLinkedList.insert(node: 3)
        let tail = self.doublyLinkedList.getTail()
        XCTAssertTrue(tail?.node == 3)
    }
    
    func testDeleteFirstNode() throws {
        self.doublyLinkedList.insert(node: 1)
        self.doublyLinkedList.insert(node: 2)
        self.doublyLinkedList.insert(node: 3)
        self.doublyLinkedList.insert(node: 4)
        self.doublyLinkedList.insert(node: 5)
        self.doublyLinkedList.insert(node: 6)
        let head = self.doublyLinkedList.delete(node: 0)
        XCTAssertTrue(head?.node == 1)
        XCTAssertTrue(head?.next?.node == 2)
        XCTAssertTrue(head?.next?.previous?.node == 1)
    }

    func testDeleteMiddleNode() throws {
        self.doublyLinkedList.insert(node: 1)
        self.doublyLinkedList.insert(node: 2)
        self.doublyLinkedList.insert(node: 3)
        self.doublyLinkedList.insert(node: 4)
        self.doublyLinkedList.insert(node: 5)
        self.doublyLinkedList.insert(node: 6)
        let head = self.doublyLinkedList.delete(node: 4)
        XCTAssertTrue(head?.node == 3)
        XCTAssertTrue(head?.next?.node == 5)
        XCTAssertTrue(head?.next?.previous?.node == 3)
    }
    
    func testDeleteLastNode() throws {
        self.doublyLinkedList.insert(node: 1)
        self.doublyLinkedList.insert(node: 2)
        self.doublyLinkedList.insert(node: 3)
        self.doublyLinkedList.insert(node: 4)
        self.doublyLinkedList.insert(node: 5)
        self.doublyLinkedList.insert(node: 6)
        let head = self.doublyLinkedList.delete(node: 6)
        XCTAssertTrue(head?.node == 5)
        XCTAssertTrue(head?.next?.node == nil)
        XCTAssertTrue(head?.next?.previous?.node == nil)
    }
}
