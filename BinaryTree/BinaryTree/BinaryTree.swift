//
//  BinaryTree.swift
//  BinaryTreeTests
//
//  Created by Bhaumik on 2020-07-10.
//  Copyright © 2020 Bhaumik. All rights reserved.
//

import Foundation

public class BinaryTree<Node> {
    public var value: Node
    public var left: BinaryTree<Node>?
    public var right: BinaryTree<Node>?
    
    /// Initialize binary tree.
    init(left: BinaryTree<Node>?, value: Node, right: BinaryTree<Node>?) {
        self.left = left
        self.value = value
        self.right = right
    }
    
    /// Inserts node to first available space in tree.
    /// - Complexity: O(*log n*), where *n*  is the number of nodes.
    func insert(node: BinaryTree<Node>) {
        var queue = [BinaryTree<Node>]()
        queue.append(self)
        while !queue.isEmpty {
            let temp = queue.removeFirst()
            if temp.left == nil {
                temp.left = node
                break
            } else {
                queue.append(temp.left!)
            }
            
            if temp.right == nil {
                temp.right = node
                break
            } else {
                queue.append(temp.right!)
            }
        }
    }
    
    /// - Complexity: O(*log n*), where *n* is the number of nodes.
    func traverseInOrder(process: (Node) -> Void) {
        left?.traverseInOrder(process: process)
        process(value)
        right?.traverseInOrder(process: process)
    }
    
    /// - Complexity: O(*log n*), where *n* is the number of nodes.
    func traversePreOrder(process: (Node) -> Void) {
        process(value)
        left?.traversePreOrder(process: process)
        right?.traversePreOrder(process: process)
    }
    
    /// - Complexity: O(*log n*), where *n* is the number of nodes.
    func traversePostOrder(process: (Node) -> Void) {
        left?.traversePostOrder(process: process)
        right?.traversePostOrder(process: process)
        process(value)
    }
}
