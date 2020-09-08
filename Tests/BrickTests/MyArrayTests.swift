//
//  File.swift
//  
//
//  Created by miao gaoliang on 2020/9/8.
//

import XCTest
@testable import Brick

@available(OSX 10.15, iOS 13.0, *)
final class MyArrayTests: XCTestCase {
//  MARK: - list
  // 连续区间和, 前缀和
  func testPrefixRangeSum() {
    let list = [1,2,3,4,5,6,7,8,9]
    
    let has = PrefixSum().has(target: 10, with: list)
    XCTAssertTrue(has == true)
    
    let has2 = PrefixSum().has(target: 99, with: list)
    XCTAssertTrue(has2 == false)
    
    let c5 = PrefixSum().count2(for: 5, with: list)
    XCTAssertTrue(c5 == 2)
  }
  
}
