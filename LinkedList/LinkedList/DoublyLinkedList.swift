//
//  DoublyLinkedList.swift
//  LinkedListTests
//
//  Created by Bhaumik on 2020-07-09.
//  Copyright © 2020 Bhaumik. All rights reserved.
//

import Foundation

public class DoublyLinkedList<Node: Equatable> {
    public var node: Node
    public var previous: DoublyLinkedList<Node>?
    public var next: DoublyLinkedList<Node>?

    /// Initializes `LinkedList`.
    init(node: Node) {
        self.node = node
    }
    
    /// Finds the tail of the `LinkedList`.
    /// - Complexity: O(*n*), where *n* is the number of Nodes in the `LinkedList`.
    public func getTail() -> DoublyLinkedList<Node>? {
        var tail = self
        while tail.next != nil {
            tail = tail.next!
        }
        return tail
    }
    
    /// Searches head for the given `Node`.
    /// - Complexity: O(*n*), where *n* is the number of Nodes in the `LinkedList`.
    public func searchHead(node: Node) -> DoublyLinkedList<Node>? {
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
        let tail = self.getTail()
        let node = DoublyLinkedList(node: node)
        node.previous = tail
        tail?.next = node
    }
    
    /// Deletes node from the `LinkedList` and adjusts `next` and `previous` pointers.
    /// - Complexity: O(1)
    public func delete(node: Node) -> DoublyLinkedList<Node>? {
        var head: DoublyLinkedList<Node>? = self
        if head?.node == node {
            return head?.next // moved head
        }
        head = searchHead(node: node)
        head?.next?.next?.previous = head
        head?.next = head?.next?.next
        return head
    }
}
