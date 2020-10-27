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
    let item = TrapRainWater()

    let list: [Int] = [0,1,0,2,1,0,1,3,2,1,2,1]
    let sum = item.trap(list: list)
    XCTAssertTrue(sum == 6, "failed = \(sum)")
    
    let list2 = [4,2,0,3,2,5]
    let sum2 = item.trap(list: list2)
    XCTAssertTrue(sum2 == 9, "failed = \(sum2)")

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
  
  func testMinStack() {
    let stack = MinStack<Int>()
    stack.push(-1) // -1
    stack.push(0) // -1
    stack.push(-3) // -3
    stack.push(-4)  // -4
    stack.push(-1) // -4

    XCTAssertTrue(stack.min()! == -4)
    stack.pop()
    XCTAssertTrue(stack.min()! == -4)
    stack.pop()
    XCTAssertTrue(stack.min()! == -3)
    stack.pop()
    XCTAssertTrue(stack.min()! == -1)
    stack.pop()
    XCTAssertTrue(stack.min()! == -1)
    stack.pop()
    XCTAssertTrue(stack.min() == nil)
  }
  
  func testDecodeString() {
    let item = DecodeString()
    let str1 = "3[a]2[bc]"
    let r1 = item.decodeString(str1)
    XCTAssertTrue(r1 == "aaabcbc", "failed \(r1)")
    

    let str3 = "3[a2[c]]"
    let r3 = item.decodeString(str3)
    XCTAssertTrue(r3 == "accaccacc", "failed \(r3)")

    do {
      let str4 = "2[abc]3[cd]ef"
      let r4 = item.decodeString(str4)
      XCTAssertTrue(r4 == "abcabccdcdcdef", "failed \(r4)")
    }

    do {
        let str5 = "abc3[cd]xyz"
        let r5 = item.decodeString(str5)
        XCTAssertTrue(r5 == "abccdcdcdxyz", "failed \(r5)")
    }
  }
  
  func testStringCheck() {
    let str = "0123456789[aAzZ2[b]]"
    for c in str {
      if c.isNumber {
        print("\(c) isNumber")
      } else if c.isLetter {
        print("\(c) isLetter")
      } else if c == "[" {
        print("\(c) 左括弧")
      } else {
        print("\(c) 右括弧")
      }
    }
  }
  
  func testDailyTemperatures() {
    let temperatures = [73, 74, 75, 71, 69, 72, 76, 73]
    let item = DailyTemperatures()
    let output = item.transfor(temperatures)
    XCTAssert([1, 1, 4, 2, 1, 1, 0, 0] == output, "faile output = \(output)")
  }
}
