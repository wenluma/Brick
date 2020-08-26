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
//  MARK: - depth
  // 最大深度递归
  func tMaxDepth<T>(root: TreeNode<T>?) -> UInt {
    guard let root = root else {
      return 0
    }
    let l: UInt = maxDepth(root: root.left)
    let r: UInt = maxDepth(root: root.right)
    return max(l, r) + 1
  }
  // 深度按层遍历
  func tMaxDepth2<T>(root: TreeNode<T>?) -> UInt {
    guard let root = root else {
      return 0
    }
    var dqueue = [TreeNode<T>]()
    dqueue.append(root)
    var level: UInt = 0
    while !dqueue.isEmpty {
      let currentLevelCount = dqueue.count
      for _ in 0..<currentLevelCount {
        let node = dqueue.removeFirst()
        node.left.flatMap({ dqueue.append($0) })
        node.right.flatMap({ dqueue.append($0) })
      }
      level += 1
    }
    return level
  }
  // 每层记录+1
  func tMaxDepth3<T>(root: TreeNode<T>?) -> UInt {
    guard let root = root else {
      return 0
    }
    var dqueue = [(UInt,TreeNode<T>)]()
    dqueue.append((1, root))
    var maxDepth: UInt = 0
    while !dqueue.isEmpty {
      let (current, node) = dqueue.removeFirst()
      maxDepth = max(maxDepth, current)
      let next = current + 1
      node.left.flatMap({ dqueue.append((next, $0)) })
      node.right.flatMap({ dqueue.append((next, $0)) })
    }
    return maxDepth
  }
  
  func testMaxDepth1() {
    let root: TreeNode<Int>? = nil
    let r1 = tMaxDepth(root: root)
    XCTAssertTrue(r1 == 0)
    
    let list : [Int] = randomIndex(lower: 0, upper: 5)
    let root2 = TreeFacctory.treeNode(from: list)
    let r2 = tMaxDepth(root: root2)
    XCTAssertTrue(r2 == 3)
  }
  
  func testMaxDepth2() {
    let root: TreeNode<Int>? = nil
    let r1 = tMaxDepth2(root: root)
    XCTAssertTrue(r1 == 0)
    
    let list : [Int] = randomIndex(lower: 0, upper: 5)
    let root2 = TreeFacctory.treeNode(from: list)
    let r2 = tMaxDepth2(root: root2)
    XCTAssertTrue(r2 == 3)
  }
  
  func testMaxDepth3() {
    let root: TreeNode<Int>? = nil
    let r1 = tMaxDepth3(root: root)
    XCTAssertTrue(r1 == 0)
    
    let list : [Int] = randomIndex(lower: 0, upper: 5)
    let root2 = TreeFacctory.treeNode(from: list)
    let r2 = tMaxDepth3(root: root2)
    XCTAssertTrue(r2 == 3)
  }
//  MARK: - level
  func testLevelTraversal() throws {
    let list: [Int] = orderList(lower: 0, upper: 4)
    let root: TreeNode<Int>? = TreeFacctory.treeNode(from: list)
    let result = levelTraversal(root: root)
    
    XCTAssertTrue(result.count == 3)
    XCTAssertTrue(result.first?.count == 1)
    XCTAssertTrue(result[1].count == 2)
    XCTAssertTrue(result[2].count == 2)
  }
  
  // MARK: - build tree
  func testBuildTree() {
    let preList = [3,9,20,15,7]
    let inList = [9,3,15,20,7]
    
    let root = BuildTree<Int>.testMake(preList: preList, inList: inList)
    printLevel(of: root)

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
