//
//  HashTable.swift
//  HashTableTests
//
//  Created by Bhaumik on 2020-07-06.
//  Copyright © 2020 Bhaumik. All rights reserved.
//

import Foundation

public struct HashTable<Key: Hashable, Value> {
    private typealias Element = (key: Key, value: Value)
    private typealias Bucket = [Element]
    private var buckets: [Bucket]
    
    init(capacity: Int) {
        self.buckets = Array(repeating: [], count: capacity)
    }
    
    private func getIndex(key: Key) -> Int {
        let hashValue = "\(key)".hash
        return abs(hashValue % self.buckets.count)
    }
 
    // insert/update
    private mutating func update(value: Value, key: Key) {
        let index = self.getIndex(key: key)
        for (row, element) in self.buckets[index].enumerated() {
            if element.key == key {
                // Value for key exist. Update value.
                self.buckets[index][row].value = value
                return
            }
        }
        
        // Value for key doesn't exist. Insert value.
        self.buckets[index].append(Element(key: key, value: value))
    }
    
    // lookup
    private func lookup(key: Key) -> Value? {
        let index = self.getIndex(key: key)
        for element in self.buckets[index] {
            if element.key == key {
                return element.value
            }
        }
        return nil
    }
    
    // remove
    private mutating func remove(key: Key) {
        let index = self.getIndex(key: key)
        for (row, element) in self.buckets[index].enumerated() {
            if element.key == key {
                self.buckets[index].remove(at: row)
                return
            }
        }
    }
    
    subscript(key: Key) -> Value? {
        get {
            return self.lookup(key: key)
        } set {
            if let value = newValue {
                self.update(value: value, key: key)
            } else {
                self.remove(key: key)
            }
        }
    }
}
