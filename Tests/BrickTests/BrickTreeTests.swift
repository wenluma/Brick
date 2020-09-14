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
  
  func testBuildTree2() {
    let preList = [3,9,20,15,7]
    let inList = [9,3,15,20,7]
    
    let root = BuildTree<Int>.testMake2(preList: preList, inList: inList)
    printLevel(of: root)
  }
  
  func testFlattenTree1() {
    let list: [Int] = orderList(lower: 0, upper: 5)
    let node: TreeNode<Int>? = TreeFacctory.treeNode(from: list)
    let flattenNode = FlattenTree<Int>().flatten(root: node)
    
    XCTAssert(flattenNode?.value == 0)
    XCTAssert(flattenNode?.right?.value == 1)
    XCTAssert(flattenNode?.right?.right?.value == 3)
    XCTAssert(flattenNode?.right?.right?.right?.value == 4)
    XCTAssert(flattenNode?.right?.right?.right?.right?.value == 2)
    XCTAssert(flattenNode?.right?.right?.right?.right?.right?.value == 5)
  }
  
  func testMaxPathSumTree() {
    let root = TreeNode(value: -10)
    let l1_l = TreeNode(value: 9)
    let l1_r = TreeNode(value: 20)
    let l2_2_l = TreeNode(value: 15)
    let l2_2_r = TreeNode(value: 7)
    
    root.left = l1_l
    root.right = l1_r
    l1_r.left = l2_2_l
    l1_r.right = l2_2_r
    
    
    /*
            -10
          9     20
              15  7
     */

    let max = MaxPathSumTree().maxSum(root)
    print(max)
    XCTAssertTrue(max == 42)
  }
  
  func testInvert() {
    let list = [4, 2, 7, 1,3, 6,9]
    let node: TreeNode<Int>? = TreeFacctory.treeNode(from: list)
    let invert = InvertTree<Int>().invert(node)
    let result = levelTraversal(root: invert).joined()
    let array = Array(result)
    XCTAssertTrue(array == [4,7,2,9,6,3,1])
  }
  
  func testInvert2() {
    let list = [4, 2, 7, 1,3, 6,9]
    let node: TreeNode<Int>? = TreeFacctory.treeNode(from: list)
    let invert = InvertTree<Int>().invert2(node)
    let result = levelTraversal(root: invert).joined()
    let array = Array(result)
    XCTAssertTrue(array == [4,7,2,9,6,3,1])
  }
  
  func testLCA() {
    let list = [3,5,1,6,2,0,8,nil,nil,7,4]
    let node: TreeNode<Int>? = TreeFacctory.treeNode(from: list)
    let lcaNode = LowestCommentAncestorTree.init().lowestCommonAncestor(node, 5, 1)
    XCTAssert(lcaNode?.value == 3)
  }
  
  func testCoder() {
    let list = [1,2,3,nil,nil,4,5]
    let node: TreeNode<Int>? = TreeFacctory.treeNode(from: list)
  
    let coder = CoderTree()
    let ser = coder.serialize(root: node)
    let tree = coder.deserialize(source: ser)
    
    XCTAssert(ser == "1,2,x,x,3,4,x,x,5,x,x,")
    
    let result = levelTraversal(root: tree).joined()
    let array = Array(result)
    XCTAssert(array == [1,2,3,4,5])
  }
  
  func testCoder2() {
    let list = [1,2,3,nil,nil,4,5]
    let node: TreeNode<Int>? = TreeFacctory.treeNode(from: list)
  
    let coder = CoderTree()
    let ser = coder.bfsSerialize(root: node)
    let tree = coder.bfsDeserialize(source: ser)
    
    XCTAssert(ser == "1,2,3,x,x,4,5,x,x,x,x")
    
    let result = levelTraversal(root: tree).joined()
    let array = Array(result)
    XCTAssert(array == [1,2,3,4,5])
  }
  
  func testRobTree() {
    let list:[Int?] = [3,2,3,nil,3,nil,1]
    let node: TreeNode<Int>? = TreeFacctory.treeNode(from: list)

    let value: Int = RobTree().rob(node: node)
    XCTAssertTrue(value == 7)
  }
  
  func testRobTree2() {
    let list:[Int?] = [3,2,3,nil,3,nil,1]
    let node: TreeNode<Int>? = TreeFacctory.treeNode(from: list)

    let value: Int = RobTree().rob2(node: node)
    XCTAssertTrue(value == 7)
  }
  
  func testRobTree3() {
    let list:[Int?] = [3,2,3,nil,3,nil,1]
    let node: TreeNode<Int>? = TreeFacctory.treeNode(from: list)

    let value: Int = RobTree().rob3(node: node)
    XCTAssertTrue(value == 7)
  }
  
  func testPathSum() {
    let list = [10,5,-3,3,2,nil,11,3,-2,nil,1]
    let node: TreeNode<Int>? = TreeFacctory.treeNode(from: list)
    
    let paths = PathSumTree().sum(node: node, target: 8)
    XCTAssertTrue(paths == 3)
    
    let l2 = [5,4,8,11,nil,13,4,7,2,nil,nil,5,1]
    let node2: TreeNode<Int>? = TreeFacctory.treeNode(from: l2)
    
    let paths2 = PathSumTree().sum(node: node2, target: 22)
    XCTAssertTrue(paths2 == 3, "paths2 = \(paths2)")
  }
  
  func testPathSum2() {
    let list = [10,5,-3,3,2,nil,11,3,-2,nil,1]
    let node: TreeNode<Int>? = TreeFacctory.treeNode(from: list)
    
    let paths = PathSumTree().sum2(node: node, target: 8)
    XCTAssertTrue(paths == 3, "paths = \(paths)")
    
    let l2 = [5,4,8,11,nil,13,4,7,2,nil,nil,5,1]
    let node2: TreeNode<Int>? = TreeFacctory.treeNode(from: l2)
    
    let paths2 = PathSumTree().sum2(node: node2, target: 22)
    XCTAssertTrue(paths2 == 3, "paths2 = \(paths2)")
  }
  
  func testPathSum3() {
    let list = [10,5,-3,3,2,nil,11,3,-2,nil,1]
    let node: TreeNode<Int>? = TreeFacctory.treeNode(from: list)

    let paths = PathSumTree().sum3(node: node, target: 8)
    XCTAssertTrue(paths == 3, "paths = \(paths)")
    
    let l2 = [5,4,8,11,nil,13,4,7,2,nil,nil,5,1]
    let node2: TreeNode<Int>? = TreeFacctory.treeNode(from: l2)
    
    let paths2 = PathSumTree().sum3(node: node2, target: 22)
    XCTAssertTrue(paths2 == 3, "paths2 = \(paths2)")
  }
  
  func testBinarySearchTree2GreaterTree() {
    let list = [5,2,13]
    let node: TreeNode<Int>? = TreeFacctory.treeNode(from: list)

    let root = BST2GT().convert2GT(node: node)
    let list2: [Int]?  = inOrderTraversal(node: root)
  
    XCTAssertTrue(list2 != nil, "list2 is nil, faild")
    for (idx, item) in list.enumerated() {
      if list2![idx] != item {
        XCTAssertFalse(false, " idx = \(idx) value not equal")
      }
    }
  }
  
  func testBinarySearchTree2GreaterTree2() {
    let list = [5,2,13]
    let node: TreeNode<Int>? = TreeFacctory.treeNode(from: list)

    let root = BST2GT().convert2GT2(node: node)
    let list2: [Int]?  = inOrderTraversal(node: root)
  
    XCTAssertTrue(list2 != nil, "list2 is nil, faild")
    for (idx, item) in list.enumerated() {
      if list2![idx] != item {
        XCTAssertFalse(false, " idx = \(idx) value not equal")
      }
    }
  }
  
  func testDiameterOfBinaryTree() {
    let list = [1,2,3,4,5]
    let node: TreeNode<Int>? = TreeFacctory.treeNode(from: list)
    let diameter = DiameterOfBinaryTree()
    let value = diameter.diameter(node: node)
    XCTAssertTrue(value == 3, "failed value = \(value)")
  }
  
  func testMergeTree() {
    let list1 = [1,3,2,5]
    let list2 = [2,1,3,nil,4,nil,7]
    let node1: TreeNode<Int>? = TreeFacctory.treeNode(from: list1)
    let node2: TreeNode<Int>? = TreeFacctory.treeNode(from: list2)
    
    let node = MergeTree().merge(t1: node1, t2: node2)
    let array = levelTraversal(root: node)
    XCTAssertTrue(array[0] == [3])
    XCTAssertTrue(array[1] == [4,5])
    XCTAssertTrue(array[2] == [5,4,7])
  }
  
  func testMergeTree2() {
    let list1 = [1,3,2,5]
    let list2 = [2,1,3,nil,4,nil,7]
    let node1: TreeNode<Int>? = TreeFacctory.treeNode(from: list1)
    let node2: TreeNode<Int>? = TreeFacctory.treeNode(from: list2)
    
    let node = MergeTree().merge2(t1: node1, t2: node2)
    let array = levelTraversal(root: node)
    XCTAssertTrue(array[0] == [3])
    XCTAssertTrue(array[1] == [4,5])
    XCTAssertTrue(array[2] == [5,4,7])
  }
  
  func testStringSplit() {
    let str = "a,bc,d,e,,,"
    let tr = CoderTree()

    let list = tr.split(source:str, separator: ",")
    XCTAssert(list[0] == "a")
    XCTAssert(list[1] == "bc")
    XCTAssert(list[2] == "d")
    XCTAssert(list[3] == "e")
    XCTAssert(list[4] == "")
    XCTAssert(list[5] == "")
    
    
    let str2 = ",a,bc,d,e,"

    let list2 = tr.split(source:str2, separator: ",")
    XCTAssert(list2[0] == "")
    XCTAssert(list2[1] == "a")
    XCTAssert(list2[2] == "bc")
    XCTAssert(list2[3] == "d")
    XCTAssert(list2[4] == "e")
    
    let str3 = ""
    let list3 = tr.split(source:str3, separator: ",")
    XCTAssert(list3.isEmpty)

    let str4 = "a"
    let list4 = tr.split(source:str4, separator: ",")
    XCTAssert(list4.isEmpty)
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
  
  func testIndexSet() {
    // indexset 用来记录 另一个集合中的索引
    var indexSet = IndexSet(integersIn: 0...5)
    indexSet.insert(9)
    XCTAssertTrue(indexSet.contains(3))
    XCTAssertTrue(indexSet.contains(9))
    XCTAssertFalse(indexSet.contains(7))
    XCTAssertFalse(indexSet.contains(6))
    indexSet.remove(integersIn: 7..<10)
    XCTAssertFalse(indexSet.contains(9))
  }
}
