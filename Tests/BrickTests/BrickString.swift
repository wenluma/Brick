//
//  File.swift
//  
//
//  Created by miao gaoliang on 2020/10/27.
//

import XCTest
@testable import Brick

final class BrickStringTests: XCTestCase {
  
  // 有字串不重复的的最大长度
  func testLengthOfLongestSubstring() {
    let item = LengthOfLongestSubstring()
    repeat {
      let s0 = "abcabcbb"
      let len = item.subLength(source: s0)
      XCTAssertTrue(len == 3, "failed len = \(len)")
    } while false
    
    
    repeat {
      let s0 = "bbbbbbbb"
      let len = item.subLength(source: s0)
      XCTAssertTrue(len == 1, "failed len = \(len)")
    } while false
    
    repeat {
      let s0 = "pwwkew"
      let len = item.subLength(source: s0)
      XCTAssertTrue(len == 3, "failed len = \(len)")
    } while false
  }
  
  
}
