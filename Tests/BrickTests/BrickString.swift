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
  
  func testLongestPalindromicSubstring() {
    let item = LongestPalindromicSubstring()
    repeat {
      let s0 = "babad"
      let sub = item.subLength(source: s0)
      XCTAssertTrue(sub == "bab", "failed len = \(sub)")
    } while false
    
    repeat {
      let s0 = "bbbbbbbb"
      let sub = item.subLength(source: s0)
      XCTAssertTrue(sub == "bbbbbbbb", "failed len = \(sub)")
    } while false
    
    repeat {
      let s0 = "cbbd"
      let sub = item.subLength(source: s0)
      XCTAssertTrue(sub == "bb", "failed len = \(sub)")
    } while false
  }
  
  func testPalindromic() {
    let item = LongestPalindromicSubstring()
    repeat {
      let isPalindromic = item.isPalindromic("ab")
      XCTAssertFalse(isPalindromic)
    } while false
    repeat {
      let isPalindromic = item.isPalindromic("b")
      XCTAssertFalse(isPalindromic)
    } while false
    repeat {
      let isPalindromic = item.isPalindromic("")
      XCTAssertFalse(isPalindromic)
    } while false
    repeat {
      let isPalindromic = item.isPalindromic("bab")
      XCTAssertTrue(isPalindromic)
    } while false

    repeat {
      let isPalindromic = item.isPalindromic("bb")
      XCTAssertTrue(isPalindromic)
    } while false
  }
  
  
}
