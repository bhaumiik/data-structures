//
//  HashTableTests.swift
//  HashTableTests
//
//  Created by Bhaumik on 2020-07-06.
//  Copyright © 2020 Bhaumik. All rights reserved.
//

import XCTest
@testable import HashTable

class HashTableTests: XCTestCase {
    var hashTable: HashTable<String, String>!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.hashTable = HashTable<String, String>(capacity: 23)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        self.hashTable = nil
    }

    func testAdd() throws {
        self.hashTable["Toronto"] = "Ontario"
        XCTAssertNotNil(self.hashTable["Toronto"])
    }
    
    func testUpdate() throws {
        self.hashTable["Toronto"] = "Ontario"
        XCTAssert(self.hashTable["Toronto"] == "Ontario")
        self.hashTable["Toronto"] = "British Columbia"
        XCTAssert(self.hashTable["Toronto"] == "British Columbia")
    }

    func testRemove() throws {
        self.hashTable["Toronto"] = "Ontario"
        XCTAssertNotNil(self.hashTable["Toronto"])
        self.hashTable["Toronto"] = nil
        XCTAssertNil(self.hashTable["Toronto"])
    }
}
