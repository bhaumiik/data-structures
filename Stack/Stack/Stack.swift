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
    private var elements = [Element]()
    
    public mutating func push(element: Element) {
        self.elements.append(element)
    }
    
    public mutating func pop() -> Element? {
        let element = self.elements.removeLast()
        return element
    }
    
    public func peek() -> Element? {
        return self.elements.last
    }
    
    public func isEmpty() -> Bool {
        return self.elements.isEmpty
    }
    
    public func getSize() -> Int {
        return self.elements.count
    }
}

