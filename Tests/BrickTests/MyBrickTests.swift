import XCTest
@testable import Brick

final class MyBrickTests: XCTestCase {
  // 改变索引
  func testDupicateNumbers() {
    let item = DuplicateNumbers()

    repeat {
      let s0 = [1,3,4,5,8,0,1,9,6,0]
      var target: Int? = nil
      let result = item.isDuplicate(source: s0, target: &target)
      XCTAssertTrue(result)
      XCTAssertEqual(target, 1)
    } while false
    
    repeat {
      let s0 = [0]
      var target: Int? = nil
      let result = item.isDuplicate(source: s0, target: &target)
      XCTAssertFalse(result)
      XCTAssertEqual(target, nil)
    } while false
    
    repeat {
      // 内容边界
      let s0 = [0,4]
      var target: Int? = nil
      let result = item.isDuplicate(source: s0, target: &target)
      XCTAssertFalse(result)
      XCTAssertEqual(target, nil)
    } while false
  }
  
  // 交互位置
  func testDupicateNumbers2() {
    let item = DuplicateNumbers2()

    repeat {
      var s0 = [1,3,4,5,8,0,1,9,6,0]
      var target: Int? = nil
      let result = item.isDuplicate(source: &s0, target: &target)
      XCTAssertTrue(result)
      XCTAssertEqual(target, 1)
    } while false
    
    repeat {
      var s0 = [0]
      var target: Int? = nil
      let result = item.isDuplicate(source: &s0, target: &target)
      XCTAssertFalse(result)
      XCTAssertEqual(target, nil)
    } while false
    
    repeat {
      // 内容边界
      var s0 = [0,4]
      var target: Int? = nil
      let result = item.isDuplicate(source: &s0, target: &target)
      XCTAssertFalse(result)
      XCTAssertEqual(target, nil)
    } while false
  }
  
  func testDupicateNumbers3() {
    let item = DuplicateNumbers3()

    repeat {
      let s0 = [2, 3, 5, 4, 3, 2, 6, 7]
      let result: Int = item.isDuplicate(source: s0)
      let duplicates = [2,3]
      XCTAssertTrue(duplicates.contains(result), "result = \(result)")
    } while false
    
    repeat {
      let s0 = [3, 2, 1, 4, 4, 5, 6, 7]
      let result = item.isDuplicate(source: s0)
      let duplicates = [4]
      XCTAssertTrue(duplicates.contains(result), "result = \(result)")
    } while false
    
    repeat {
      // 内容边界
      let s0 = [1, 2, 3, 4, 5, 6, 7, 1, 8]
      let result = item.isDuplicate(source: s0)
      let duplicates = [1]
      XCTAssertTrue(duplicates.contains(result), "result = \(result)")
    } while false
  }
  
  func testMatrixFind() {
    let item = MatrixFind()

    repeat {
      let s0 = [
        [1, 2, 8, 9],
        [2, 4, 9, 12],
        [4, 7, 10, 13],
        [6, 8, 11, 15]
      ]
      let result: Bool = item.isExist(source: s0, target: 7)
      XCTAssertTrue(result, "result = \(result)")
    } while false
    
    repeat {
      let s0 = [
        [1, 2, 8, 9],
        [2, 4, 9, 12],
        [4, 7, 10, 13],
        [6, 8, 11, 15]
      ]
      let result: Bool = item.isExist(source: s0, target: 0)
      XCTAssertFalse(result, "result = \(result)")
    } while false
    
    repeat {
      let s0 = [
        [1, 2, 8, 9],
        [2, 4, 9, 12],
        [4, 7, 10, 13],
        [6, 8, 11, 15]
      ]
      let result: Bool = item.isExist(source: s0, target: 4)
      XCTAssertTrue(result, "result = \(result)")
    } while false
  }
  
  func testReplaceBlank() {
    let item = ReplaceBlank()

    repeat {
      let s0 = "We are happy."
      let result = item.replace(source: s0)
      XCTAssertEqual(result, "We%20are%20happy.", "failed = \(result)")
    } while false
    
    repeat {
      let s0 = "We are happy. "
      let result = item.replace(source: s0)
      XCTAssertEqual(result, "We%20are%20happy.%20", "failed = \(result)")
    } while false
    
  }
 // 逆序输出 栈
  func testLinkRev() {
    let item = LinkRev()
    repeat {
      let node = LKNode.makeLKNode(items: [1,2,3])
      let result: [Int] = item.reverse(source: node)
      XCTAssertTrue(result == [3,2,1], "failed = \(result)")
    } while false
    
    repeat {
      let node = LKNode.makeLKNode(items: [1])
      let result: [Int] = item.reverse(source: node)
      XCTAssertTrue(result == [1], "failed = \(result)")
    } while false
    
    repeat {
      let empty = [Int]()
      let node = LKNode.makeLKNode(items: empty)
      let result: [Int] = item.reverse(source: node)
      XCTAssertTrue(result == empty, "failed = \(result)")
    } while false
  }
  
  // 逆序输出 递归
  func testLinkRev2() {
    let item = LinkRev2()
    repeat {
      let node = LKNode.makeLKNode(items: [1,2,3])
      let result: [Int] = item.reverse(source: node)
      XCTAssertTrue(result == [3,2,1], "failed = \(result)")
    } while false
    
    repeat {
      let node = LKNode.makeLKNode(items: [1])
      let result: [Int] = item.reverse(source: node)
      XCTAssertTrue(result == [1], "failed = \(result)")
    } while false
    
    repeat {
      let empty = [Int]()
      let node = LKNode.makeLKNode(items: empty)
      let result: [Int] = item.reverse(source: node)
      XCTAssertTrue(result == empty, "failed = \(result)")
    } while false
  }
  
  // 列表反转
  func testLinkRev3() {
    let item = LinkRev3()
    repeat {
      let node = LKNode.makeLKNode(items: [1,2,3])
      let result: LKNode? = item.reverse(source: node)
      let list = LKNode.node2Array(node: result)
      XCTAssertTrue(list == [3,2,1], "failed = \(String(describing: result))")
    } while false
    
    repeat {
      let node = LKNode.makeLKNode(items: [1])
      let result: LKNode? = item.reverse(source: node)
      let list = LKNode.node2Array(node: result)
      XCTAssertTrue(list == [1], "failed = \(String(describing: result))")
    } while false
    
    repeat {
      let empty = [Int]()
      let node = LKNode.makeLKNode(items: empty)
      let result: LKNode? = item.reverse(source: node)
      let list = LKNode.node2Array(node: result)
      XCTAssertTrue(list == empty, "failed = \(String(describing: result))")
    } while false
  }
  
  // 链表递归反转
  func testLinkRev4() {
    let item = LinkRev4()
    repeat {
      let node = LKNode.makeLKNode(items: [1,2,3])
      let result: LKNode? = item.reverse(source: node)
      let list = LKNode.node2Array(node: result)
      XCTAssertTrue(list == [3,2,1], "failed = \(String(describing: result))")
    } while false
    
    repeat {
      let node = LKNode.makeLKNode(items: [1])
      let result: LKNode? = item.reverse(source: node)
      let list = LKNode.node2Array(node: result)
      XCTAssertTrue(list == [1], "failed = \(String(describing: result))")
    } while false
    
    repeat {
      let empty = [Int]()
      let node = LKNode.makeLKNode(items: empty)
      let result: LKNode? = item.reverse(source: node)
      let list = LKNode.node2Array(node: result)
      XCTAssertTrue(list == empty, "failed = \(String(describing: result))")
    } while false
  }
  
  func testConstructTree() {
    repeat {
      let preOrder = [1, 2, 4, 7, 3, 5, 6, 8]
      let inOrder = [4, 7, 2, 1, 5, 3, 8, 6]

      let item = ConstructTree(preOrder: preOrder, inOrder: inOrder)
      let result: BTTree? = item.build()
      let preO = BTTree.preOrder(tree: result)
      let inO = BTTree.inOrder(tree: result)
      XCTAssertTrue(preO == preOrder, "failed = \(String(describing: preO))")
      XCTAssertTrue(inO == inOrder, "failed = \(String(describing: inO))")
    } while false
    
    repeat {
      let preOrder = [3,9,20,15,7]
      let inOrder = [9,3,15,20,7]
      
      let item = ConstructTree(preOrder: preOrder, inOrder: inOrder)
      let result: BTTree? = item.build()
      let preO = BTTree.preOrder(tree: result)
      let inO = BTTree.inOrder(tree: result)
      XCTAssertTrue(preO == preOrder, "failed = \(String(describing: preO))")
      XCTAssertTrue(inO == inOrder, "failed = \(String(describing: inO))")
    } while false
  }
  
  
  func testTreeNextNode() {
    let item = TreeNextNode()
    repeat {
      let node: BTTree? = nil
      let result = item.getNext(node: node)
      XCTAssertNil(result, "result != nil")
    } while false
    
    // 当前有右值
    repeat {
      let root: BTTree = BTTree(value: 1)
      let r1 = BTTree(value: 2)
      let l1 = BTTree(value: 3)
      BTTree.connect(parent: root, left: l1, right: r1)
      
      let result = item.getNext(node: root)
      XCTAssertTrue(result?.value == r1.value, "failed = \(result?.value)")
    } while false
    
    // 当前有左值
    repeat {
      let root: BTTree = BTTree(value: 1)
      let r1 = BTTree(value: 2)
      let l1 = BTTree(value: 3)
      let l2 =  BTTree(value: 4)

      BTTree.connect(parent: root, left: l1, right: r1)
      BTTree.connect(parent: l1, left: l2, right: nil)
      
      let result = item.getNext(node: l2)
      XCTAssertTrue(result?.value == l1.value, "failed = \(result?.value)")
    } while false
    
    // 节点为其父节点的右子节点，那么需要沿其父指针一直向上遍历，一直找到某个节点是其父节点的左子节点为止，那么这个节点的父节点即是需要寻找的下一个节点
    repeat {
      let root: BTTree = BTTree(value: 1)
      let l1 = BTTree(value: 3)
      let r1 = BTTree(value: 2)
      let ll2 = BTTree(value: 4)
      let lr2 = BTTree(value: 5)
      BTTree.connect(parent: root, left: l1, right: r1)
      BTTree.connect(parent: l1, left: ll2, right: lr2)
      
      let result = item.getNext(node: lr2)
      XCTAssertTrue(result?.value == root.value, "failed = \(result?.value)")
    } while false
    
  }
  
  // 双stack，模拟queue
  func testMyQueue() {
    let item = MyQueue<Int>()
    
    item.appendTail(1)
    item.appendTail(2)
    item.appendTail(3)
    
    repeat {
      let top = item.deleteHead()
      XCTAssertTrue(top == 3, "failed = \(top)")
    } while false

    repeat {
      let top = item.deleteHead()
      XCTAssertTrue(top == 2, "failed = \(top)")
    } while false

    item.appendTail(4)
    repeat {
      let top = item.deleteHead()
      XCTAssertTrue(top == 4, "failed = \(top)")
    } while false
    
    repeat {
      let top = item.deleteHead()
      XCTAssertTrue(top == 1, "failed = \(top)")
    } while false
  }
  
  func testFib1() {
    let item = Fibonacci1()
    repeat {
      let r = item.fib(0)
      XCTAssertEqual(r, 0)
    } while false
    
    repeat {
      let r = item.fib(1)
      XCTAssertEqual(r, 1)
    } while false
    
    repeat {
      let r = item.fib(2)
      XCTAssertEqual(r, 1)
    } while false
    
    repeat {
      let r = item.fib(3)
      XCTAssertEqual(r, 2)
    } while false
    
    repeat {
      let r = item.fib(4)
      XCTAssertEqual(r, 3)
    } while false
    
    repeat {
      let r = item.fib(5)
      XCTAssertEqual(r, 5)
    } while false
    
    repeat {
      let r = item.fib(6)
      XCTAssertEqual(r, 8)
    } while false
    
    repeat {
      let r = item.fib(7)
      XCTAssertEqual(r, 13)
    } while false
    
    repeat {
      let r = item.fib(8)
      XCTAssertEqual(r, 21)
    } while false
    
    repeat {
      let r = item.fib(9)
      XCTAssertEqual(r, 34)
    } while false
    
    repeat {
      let r = item.fib(10)
      XCTAssertEqual(r, 55)
    } while false

  }
  
  func testFib2() {
    let item = Fibonacci2()
    repeat {
      let r = item.fib(0)
      XCTAssertEqual(r, 0)
    } while false
    
    repeat {
      let r = item.fib(1)
      XCTAssertEqual(r, 1)
    } while false
    
    repeat {
      let r = item.fib(2)
      XCTAssertEqual(r, 1)
    } while false
    
    repeat {
      let r = item.fib(3)
      XCTAssertEqual(r, 2)
    } while false
    
    repeat {
      let r = item.fib(4)
      XCTAssertEqual(r, 3)
    } while false
    
    repeat {
      let r = item.fib(5)
      XCTAssertEqual(r, 5)
    } while false
    
    repeat {
      let r = item.fib(6)
      XCTAssertEqual(r, 8)
    } while false
    
    repeat {
      let r = item.fib(7)
      XCTAssertEqual(r, 13)
    } while false
    
    repeat {
      let r = item.fib(8)
      XCTAssertEqual(r, 21)
    } while false
    
    repeat {
      let r = item.fib(9)
      XCTAssertEqual(r, 34)
    } while false
    
    repeat {
      let r = item.fib(10)
      XCTAssertEqual(r, 55)
    } while false

    
  }

  
}
