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
}