//
//  Queue.swift
//  QueueTests
//
//  Created by Bhaumik on 2020-07-09.
//  Copyright © 2020 Bhaumik. All rights reserved.
//

import Foundation

public struct Queue<Element> {
    // FIFO structure
    private var elements: [Element]
    
    /// Initialize queue.
    init() {
        self.elements = [Element]()
    }
    
    /// Adds an element to the end of the queue.
    /// - Complexity: O(1)
    public mutating func enqueue(element: Element) {
        self.elements.append(element)
    }
    
    /// Removes the first element in the queue.
    /// - Returns: The top element of the queue.
    /// - Complexity: O(1)
    public mutating func dequeue() -> Element? {
        return self.elements.first
    }
    
    /// - Returns: The top element of the queue.
    /// - Complexity: O(1)
    public mutating func front() -> Element? {
        return self.elements.first
    }
    
    /// Checks if the queue is empty.
    /// - Returns: True if the queus is empty.
    /// - Complexity: O(1)
    public func isEmpty() -> Bool {
        return self.elements.isEmpty
    }
    
    /// - Returns: The size of the queue.
    /// - Complexity: O(1)
    public func getSize() -> Int {
        return self.elements.count
    }
}
