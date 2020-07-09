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
    }

    override func tearDownWithError() throws {
        self.stack = nil
    }

    func testPush() throws {
        self.stack.push(element: 10)
        XCTAssertFalse(self.stack.isEmpty())
    }
    
    func testPop() throws {
        self.stack.push(element: 2)
        self.stack.push(element: 4)
        self.stack.push(element: 5)
        let element = self.stack.pop()
        XCTAssertTrue(element == 5)
    }
    
    func testPeek() throws {
        self.stack.push(element: 2)
        self.stack.push(element: 4)
        self.stack.push(element: 5)
        self.stack.push(element: 8)
        XCTAssertTrue(self.stack.peek() == 8)
    }
    
    func testSize() throws {
        self.stack.push(element: 1)
        self.stack.push(element: 2)
        self.stack.push(element: 3)
        XCTAssertTrue(self.stack.getSize() == 3)
    }
}
