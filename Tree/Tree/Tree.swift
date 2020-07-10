//
//  Tree.swift
//  TreeTests
//
//  Created by Bhaumik on 2020-07-10.
//  Copyright © 2020 Bhaumik. All rights reserved.
//

import Foundation

public class Tree<Node: Equatable> {
    public var value: Node
    public var parent: Tree<Node>?
    public var children = [Tree<Node>]()
    
    /// Initializes Tree `node`.
    init(value: Node) {
        self.value = value
    }
    
    /// Adds child to the `node`.
    /// - Complexity: O(1)
    public func add(child: Tree<Node>) {
        child.parent = self
        self.children.append(child)
    }
    
    /// - Returns: `node` with a given value.
    /// - Complexity: O(*log n*), where *n* is a number of nodes.
    public func search(value: Node) -> Tree<Node>? {
        if self.value == value {
            return self
        }
        for child in self.children {
            if let foundNode = child.search(value: value) {
                return foundNode
            }
        }
        return nil
    }
}
