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
  
  func testArrayIndices() {
    let list = [5,4,3,2,1,0]
    // 数组切片，可以通过它，直接获取元素
    for i in list.indices {
      let value = list[i]
      print("i = \(i), value = \(value)")
    }
    
    let elist = [Int]()
    // 数组切片，可以通过它，直接获取元素
    for i in elist.indices {
      let value = elist[i]
      print("i = \(i), value = \(value)")
    }
  }
}
