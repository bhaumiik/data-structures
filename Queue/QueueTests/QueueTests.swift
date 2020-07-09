//
//  QueueTests.swift
//  QueueTests
//
//  Created by Bhaumik on 2020-07-09.
//  Copyright © 2020 Bhaumik. All rights reserved.
//

import XCTest

class QueueTests: XCTestCase {
    var queue: Queue<Int>!

    override func setUpWithError() throws {
        self.queue = Queue()
    }

    override func tearDownWithError() throws {
        self.queue = nil
    }

    func testEnqueue() throws {
        self.queue.enqueue(element: 3)
        XCTAssertFalse(self.queue.isEmpty())
    }
    
    func testDequeue() throws {
        self.queue.enqueue(element: 1)
        self.queue.enqueue(element: 2)
        self.queue.enqueue(element: 3)
        let element = self.queue.dequeue()
        XCTAssertTrue(element == 1)
    }
    
    func testPeek() throws {
        self.queue.enqueue(element: 1)
        self.queue.enqueue(element: 2)
        self.queue.enqueue(element: 3)
        let element = self.queue.front()
        XCTAssertTrue(element == 1)
    }
    
    func testSize() throws {
        self.queue.enqueue(element: 14)
        self.queue.enqueue(element: 22)
        self.queue.enqueue(element: 35)
        self.queue.enqueue(element: 12)
        self.queue.enqueue(element: 21)
        self.queue.enqueue(element: 37)
        let size = self.queue.getSize()
        XCTAssertTrue(size == 6)
    }
}
