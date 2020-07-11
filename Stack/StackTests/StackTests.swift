//
//  StackTests.swift
//  StackTests
//
//  Created by Bhaumik on 2020-07-09.
//  Copyright © 2020 Bhaumik. All rights reserved.
//

import XCTest

class StackTests: XCTestCase {
    var stack: Stack<Int>!
    
    override func setUpWithError() throws {
        self.stack = Stack()
        self.stack.push(element: 1)
        self.stack.push(element: 2)
        self.stack.push(element: 3)
        self.stack.push(element: 4)
        self.stack.push(element: 5)
    }

    override func tearDownWithError() throws {
        self.stack = nil
    }
    
    func testIsNotEmpty() {
        XCTAssertFalse(self.stack.isEmpty())
    }
    
    func testIsEmpty() {
        self.stack.pop()
        self.stack.pop()
        self.stack.pop()
        self.stack.pop()
        self.stack.pop()
        XCTAssertTrue(self.stack.isEmpty())
    }

    func testPush() {
        self.stack.push(element: 10)
        XCTAssertTrue(self.stack.peek() == 10)
    }
    
    func testPop() {
        let element = self.stack.pop()
        XCTAssertTrue(element == 5)
    }
    
    func testPeek() {
        XCTAssertTrue(self.stack.peek() == 5)
    }
    
    func testSize() {
        XCTAssertTrue(self.stack.getSize() == 5)
    }
}
