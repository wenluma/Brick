//
//  File.swift
//  
//
//  Created by miao gaoliang on 2020/9/16.
//

import XCTest
@testable import Brick

final class BrickStackTests: XCTestCase {

  // 有效括号
  func testVaildParentheses() {
    let checker = VaildParentheses()
    let s0 = "{{}"
    XCTAssertFalse(checker.check(source: s0))

    let s1 = "{}"
    XCTAssertTrue(checker.check(source: s1))
    
    let s2 = "[]"
    XCTAssertTrue(checker.check(source: s2))

    let s3 = "()"
    XCTAssertTrue(checker.check(source: s3))
    
    let s4 = "{)"
    XCTAssertFalse(checker.check(source: s4))
    
    let s5 = "})"
    XCTAssertFalse(checker.check(source: s5))

    
    let s6 = "([})"
    XCTAssertFalse(checker.check(source: s6))
    
    let s7 = "([{}()[]()])"
    XCTAssertTrue(checker.check(source: s7))
  }
  
  // 接雨水
  func testRainWater() {
    let list: [Int] = [0,1,0,2,1,0,1,3,2,1,2,1]
    let item = TrapRainWater()
    let sum = item.trap(list: list)
    XCTAssertTrue(sum == 6)
  }
  
  func testRainWater2() {
    let list: [Int] = [0,1,0,2,1,0,1,3,2,1,2,1]
    let item = TrapRainWater()
    let sum = item.trap2(list: list)
    XCTAssertTrue(sum == 6)
    
    let list1 = [1,0]
    let sum2 = item.trap2(list: list1)
    XCTAssert(sum2 == 0)
  }
  
  func testLargestRectangleArea() {
    let item = LargestRectangleArea()

    let list0 = [2]
    let area = item.area(heights: list0)
    XCTAssertTrue(area == 2, "area = \(area)")
    
    let list2 = [2,1,5,6,2,3]
    let area2 = item.area(heights: list2)
    XCTAssertTrue(area2 == 10, "area = \(area2)")
  }
  
  func testList() {
    let list = [0,1]
    print("list.startindex = \(list.startIndex)")
    print("list.endindex = \(list.endIndex)")
    
    for index in list.startIndex ..< list.endIndex {
      print("index = \(index); item = \(list[index])")
    }
  
    for i in 0 ..< 0 {
      print("i = \(i)")
    }
  }
  
  func testMaxtriaRectangleArea() {
    let matrix: [[Character]] =  [["1","0","1","0","0"],["1","0","1","1","1"],["1","1","1","1","1"],["1","0","0","1","0"]]
    let item = MaxtriaRectangleArea()
    let result = item.maximalRectangle(matrix)
    XCTAssertTrue(result == 6, "failed result = \(result)")
  }
  
}
