//
//  Stack.swift
//  Stack
//
//  Created by Bhaumik on 2020-07-09.
//  Copyright © 2020 Bhaumik. All rights reserved.
//

import Foundation

public struct Stack<Element> {
    // LIFO data structure
    private var elements: [Element]
    
    /// Initializes Stack.
    init() {
        self.elements = [Element]()
    }
    
    /// Adds an element to top of the Stack.
    /// - Complexity: O(1)
    public mutating func push(element: Element) {
        self.elements.append(element)
    }
    
    /// Removes the top element of the Stack.
    /// - Returns: The top element of the Stack.
    /// - Complexity: O(1)
    public mutating func pop() -> Element? {
        return self.elements.removeLast()
    }
    
    /// - Returns: The top element of the Stack.
    /// - Complexity: O(1)
    public func peek() -> Element? {
        return self.elements.last
    }
    
    /// Checks if Stack is empty.
    /// - Returns: `true` is Stack is empty.
    /// - Complexity: O(1)
    public func isEmpty() -> Bool {
        return self.elements.isEmpty
    }
    
    /// - Returns: The size of the Stack.
    /// - Complexity: O(1)
    public func getSize() -> Int {
        return self.elements.count
    }
}

