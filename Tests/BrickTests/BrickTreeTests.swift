//
//  File.swift
//  
//
//  Created by miao gaoliang on 2020/8/22.
//
import XCTest
@testable import Brick

@available(OSX 10.15, iOS 13.0, *)
final class RockTreeTests: XCTestCase {
  
  func testLevelTraversal() throws {
    let list: [Int] = orderList(lower: 0, upper: 4)
    let root: TreeNode<Int>? = TreeFacctory.treeNode(from: list)
    let result = levelTraversal(root: root)
//    
    XCTAssertTrue(result.count == 3)
    XCTAssertTrue(result.first?.count == 1)
    XCTAssertTrue(result[1].count == 2)
    XCTAssertTrue(result[2].count == 2)
  }
  
  func testClosure() {
    var more = 0
    stride(from: 1, to: 18, by: 3).forEach { (i) in
      more += i
      print("index = \(i)")
      print(more)
    }
    XCTAssert(more == 51, "")
  }
}
