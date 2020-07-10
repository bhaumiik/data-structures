//
//  SinglyLinkedList.swift
//  LinkedListTests
//
//  Created by Bhaumik on 2020-07-09.
//  Copyright © 2020 Bhaumik. All rights reserved.
//

import Foundation

public class SinglyLinkedList<Node: Equatable> {
    public var node: Node
    public var next: SinglyLinkedList<Node>?
    
    /// Initialized `LinkedList`.
    init(node: Node) {
        self.node = node
    }
    
    /// Finds the tail of the `LinkedList`.
    /// - Complexity: O(*n*), where *n* is the number of Nodes in the `LinkedList`.
    public func getTail() -> SinglyLinkedList<Node>? {
        var current = self
        while current.next != nil {
            current = current.next!
        }
        return current
    }
    
    /// Searches head for the given `Node`.
    /// - Complexity: O(*n*), where *n* is the number of Nodes in the `LinkedList`.
    public func searchHead(node: Node) -> SinglyLinkedList<Node>? {
        var head = self
        while head.next != nil {
            if head.next?.node == node {
                return head
            }
            head = head.next!
        }
        return head
    }
    
    /// Inserts node at the end of the `LinkedList`.
    /// - Complexity: O(1)
    public func insert(node: Node) {
        let tail = getTail()
        tail?.next = SinglyLinkedList<Node>(node: node)
    }
    
    /// Deletes node from the `LinkedList` and adjusts pointer.
    /// - Complexity: O(1)
    public func delete(node: Node) -> SinglyLinkedList<Node>? {
        var head: SinglyLinkedList<Node>? = self
        if head?.node == node {
            return head?.next // moved head
        }
        head = self.searchHead(node: node)
        head?.next = head?.next?.next
        return head
    }
}
