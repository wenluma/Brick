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

  func testRotationArray() {
    let item = RotationArray()
    repeat {
      let source = [3, 4, 5, 1, 2]
      let r = item.findMin(in: source)
      XCTAssertEqual(r, 1, "failed r = \(r)")
    } while false
    
    repeat {
      let source = [3, 4, 5, 5, 2, 2, 3]
      let r = item.findMin(in: source)
      XCTAssertEqual(r, 2, "failed r = \(r)")
    } while false
    
    repeat {
      let source = [3, 4, 5, 1, 1, 2]
      let r = item.findMin(in: source)
      XCTAssertEqual(r, 1, "failed r = \(r)")
    } while false
    
    repeat {
      let source = [3, 4, 5, 1, 2, 2]
      let r = item.findMin(in: source)
      XCTAssertEqual(r, 1, "failed r = \(r)")
    } while false
    
    repeat {
      let source = [1, 0, 1, 1, 1]
      let r = item.findMin(in: source)
      XCTAssertEqual(r, 0, "failed r = \(r)")
    } while false
    
    repeat {
      let source = [1, 2, 3, 4, 5]
      let r = item.findMin(in: source)
      XCTAssertEqual(r, 1, "failed r = \(r)")
    } while false
    
    repeat {
      let source = [1]
      let r = item.findMin(in: source)
      XCTAssertEqual(r, 1, "failed r = \(r)")
    } while false
  }
  
  func testMatrixPath() {
    repeat {
      let s = "ABTGCFCSJDEH"
      let board = MatrixPath.make2D(source: s, rows: 3, cols: 4)
      let word = "BFCE"
      
      let item = MatrixPath(board: board, word: word)
      let r = item.check()
      XCTAssertTrue(r, "failed r = \(r)")
    } while false
    
    repeat {
      let s = "ABCESFCSADEE"
      let board = MatrixPath.make2D(source: s, rows: 3, cols: 4)
      let word = "SEE"
      
      let item = MatrixPath(board: board, word: word)
      let r = item.check()
      XCTAssertTrue(r, "failed r = \(r)")
    } while false
    
    repeat {
      let s = "ABTGCFCSJDEH"
      let board = MatrixPath.make2D(source: s, rows: 3, cols: 4)
      let word = "ABFB"
      
      let item = MatrixPath(board: board, word: word)
      let r = item.check()
      XCTAssertFalse(r, "failed r = \(r)")
    } while false
    
    repeat {
      let s = "ABCEHJIGSFCSLOPQADEEMNOEADIDEJFMVCEIFGGS"
      let board = MatrixPath.make2D(source: s, rows: 5, cols: 8)
      let word = "SLHECCEIDEJFGGFIE"
      
      let item = MatrixPath(board: board, word: word)
      let r = item.check()
      XCTAssertTrue(r, "failed r = \(r)")
    } while false
    
    repeat {
      let s = "ABCEHJIGSFCSLOPQADEEMNOEADIDEJFMVCEIFGGS"
      let board = MatrixPath.make2D(source: s, rows: 5, cols: 8)
      let word = "SGGFIECVAASABCEHJIGQEM"
      
      let item = MatrixPath(board: board, word: word)
      let r = item.check()
      XCTAssertTrue(r, "failed r = \(r)")
    } while false
    
    repeat {
      let s = "ABCEHJIGSFCSLOPQADEEMNOEADIDEJFMVCEIFGGS"
      let board = MatrixPath.make2D(source: s, rows: 5, cols: 8)
      let word = "SGGFIECVAASABCEEJIGOEM"
      
      let item = MatrixPath(board: board, word: word)
      let r = item.check()
      XCTAssertFalse(r, "failed r = \(r)")
    } while false
    
    repeat {
      let s = "ABCEHJIGSFCSLOPQADEEMNOEADIDEJFMVCEIFGGS"
      let board = MatrixPath.make2D(source: s, rows: 5, cols: 8)
      let word = "SGGFIECVAASABCEHJIGQEMS"
      
      let item = MatrixPath(board: board, word: word)
      let r = item.check()
      XCTAssertFalse(r, "failed r = \(r)")
    } while false
    
    repeat {
      let s = "AAAAAAAAAAAA"
      let board = MatrixPath.make2D(source: s, rows: 3, cols: 4)
      let word = "AAAAAAAAAAAA"
      
      let item = MatrixPath(board: board, word: word)
      let r = item.check()
      XCTAssertTrue(r, "failed r = \(r)")
    } while false
    
    repeat {
      let s = "AAAAAAAAAAAA"
      let board = MatrixPath.make2D(source: s, rows: 3, cols: 4)
      let word = "AAAAAAAAAAAAA"
      
      let item = MatrixPath(board: board, word: word)
      let r = item.check()
      XCTAssertFalse(r, "failed r = \(r)")
    } while false
    
    repeat {
      let s = "A"
      let board = MatrixPath.make2D(source: s, rows: 1, cols: 1)
      let word = "A"
      let item = MatrixPath(board: board, word: word)
      let r = item.check()
      XCTAssertTrue(r, "failed r = \(r)")
    } while false
    
    repeat {
      let s = "A"
      let board = MatrixPath.make2D(source: s, rows: 1, cols: 1)
      let word = "B"
      let item = MatrixPath(board: board, word: word)
      let r = item.check()
      XCTAssertFalse(r, "failed r = \(r)")
    } while false
    
  }
  
  func testRobotMoveRange() {
    repeat {
      let item = RobotMoveRange(5, 10, 10)
      let r = item.move()
      XCTAssertEqual(r, 21, "failed r = \(r)")
    } while false
    
    repeat {
      let item = RobotMoveRange(15, 20, 20)
      let r = item.move()
      XCTAssertEqual(r, 359, "failed r = \(r)")
    } while false


    repeat {
      let item = RobotMoveRange(10, 1, 100)
      let r = item.move()
      XCTAssertEqual(r, 29, "failed r = \(r)")
    } while false


    repeat {
      let item = RobotMoveRange(10, 1, 10)
      let r = item.move()
      XCTAssertEqual(r, 10, "failed r = \(r)")
    } while false

    repeat {
      let item = RobotMoveRange(15, 100, 1)
      let r = item.move()
      XCTAssertEqual(r, 79, "failed r = \(r)")
    } while false

    repeat {
      let item = RobotMoveRange(15, 10, 1)
      let r = item.move()
      XCTAssertEqual(r, 10, "failed r = \(r)")
    } while false

    repeat {
      let item = RobotMoveRange(15, 1, 1)
      let r = item.move()
      XCTAssertEqual(r, 1, "failed r = \(r)")
    } while false

    repeat {
      let item = RobotMoveRange(0, 1, 1)
      let r = item.move()
      XCTAssertEqual(r, 1, "failed r = \(r)")
    } while false

    repeat {
      let item = RobotMoveRange(-10, 10, 10)
      let r = item.move()
      XCTAssertEqual(r, 0, "failed r = \(r)")
    } while false

  }
  
  func testCutRope() {
    let item = CutRope()
    repeat {
      let r = item.cut(2)
      XCTAssertEqual(r, 1, "failed r = \(r)")
    } while false
    
    repeat {
      let r = item.cut(3)
      XCTAssertEqual(r, 2, "failed r = \(r)")
    } while false

    repeat {
      let r = item.cut(4)
      XCTAssertEqual(r, 4, "failed r = \(r)")
    } while false

    repeat {
      let r = item.cut(10)
      XCTAssertEqual(r, 36, "failed r = \(r)")
    } while false
    
  }
  
  func testBitCount() {
    let item = BitCount()
    repeat {
      let r = item.number(9)
      XCTAssertEqual(r, 2, "failed r = \(r)")
    } while false
    
    
    repeat {
      let r = item.number(0)
      XCTAssertEqual(r, 0, "failed r = \(r)")
    } while false
    
    repeat {
      let r = item.number(10)
      XCTAssertEqual(r, 2, "failed r = \(r)")
    } while false
    
    repeat {
      let r = item.number(0x7FFFFFFF)
      XCTAssertEqual(r, 31, "failed r = \(r)")
    } while false
    
    repeat {
      let r = item.number(0xFFFFFFFF)
      XCTAssertEqual(r, 32, "failed r = \(r)")
    } while false
    
    repeat {
      let r = item.number(0x80000000)
      XCTAssertEqual(r, 1, "failed r = \(r)")
    } while false
  }
  
  func testBitCount2() {
    let item = BitCount2()
    repeat {
      let r = item.number(9)
      XCTAssertEqual(r, 2, "failed r = \(r)")
    } while false
    
    
    repeat {
      let r = item.number(0)
      XCTAssertEqual(r, 0, "failed r = \(r)")
    } while false
    
    repeat {
      let r = item.number(10)
      XCTAssertEqual(r, 2, "failed r = \(r)")
    } while false
    
    repeat {
      let r = item.number(0x7FFFFFFF)
      XCTAssertEqual(r, 31, "failed r = \(r)")
    } while false
    
    repeat {
      let r = item.number(0xFFFFFFFF)
      XCTAssertEqual(r, 32, "failed r = \(r)")
    } while false
    
    repeat {
      let r = item.number(0x80000000)
      XCTAssertEqual(r, 1, "failed r = \(r)")
    } while false
  }
  
  
  func testMyPower() {
    let item = MyPower()
    repeat {
      let r = try? item.pow(2,3)
      XCTAssertEqual(r, 8, "failed r = \(r)")
    } while false
    
    repeat {
      let r = try? item.pow(-2,3)
      XCTAssertEqual(r, -8, "failed r = \(r)")
    } while false
    
    repeat {
      let r = try? item.pow(2,-3)
      XCTAssertEqual(r, 0.125, "failed r = \(r)")
    } while false
    
    repeat {
      let r = try? item.pow(2, 0)
      XCTAssertEqual(r, 1, "failed r = \(r)")
    } while false
    
    repeat {
      let r = try? item.pow(0, 0)
      XCTAssertEqual(r, 1, "failed r = \(r)")
    } while false
    
    repeat {
      let r = try? item.pow(0, 4)
      XCTAssertEqual(r, 0, "failed r = \(r)")
    } while false

    repeat {
      XCTAssertThrowsError(try item.pow(0,-4))
    } while false
    
  }
  
  func testMaxNDigit() {
    let item = MaxNDigit()
    
    repeat {
       XCTAssertThrowsError(try item.excute(n: 0))
    } while false
    
    repeat {
      try? item.excute(n: 1)
    } while false
    
    repeat {
       try? item.excute(n: 2)
    } while false
    
    repeat {
       try? item.excute(n: 4)
    } while false
    
  }
  
  func testMaxNDigit2() {
    let item = MaxNDigit2()
    
    repeat {
       XCTAssertThrowsError(try item.excute(n: 0))
    } while false
    
    repeat {
      try? item.excute(n: 1)
    } while false
    
    repeat {
       try? item.excute(n: 2)
    } while false
    
    repeat {
       try? item.excute(n: 4)
    } while false
    
  }
 
  
  func testPermutations() {
    let item =  Permutations()
    repeat {
      _ = item.permute([1,2,3])
    } while false
  }
  
  
  func testMDeleteNode() {
    let item = MDeleteNode()
    repeat {
      var head: LKNode? = nil
      var deletedNode: LKNode? = nil
      item.delete(head: &head, beDeleted: &deletedNode)
      XCTAssertNil(head)
    } while false
    
    repeat {
      let list = [1,2,3]
      var head = LKNode.makeLKNode(items: list)
      var deletedNode: LKNode? = LKNode.get(node: head, index: 1) // 2
      item.delete(head: &head, beDeleted: &deletedNode)
      let result = LKNode.node2Array(node: head)
      XCTAssertEqual(result, [1,3])
    } while false
    
    repeat {
      let list = [1,2,3]
      var head = LKNode.makeLKNode(items: list)
      var deletedNode: LKNode? = LKNode.get(node: head, index: 0) // 1
      item.delete(head: &head, beDeleted: &deletedNode)
      let result = LKNode.node2Array(node: head)
      XCTAssertEqual(result, [2,3])
    } while false

    repeat {
      let list = [1,2,3]
      var head = LKNode.makeLKNode(items: list)
      var deletedNode: LKNode? = LKNode.get(node: head, index: 2) // 3
      item.delete(head: &head, beDeleted: &deletedNode)
      let result = LKNode.node2Array(node: head)
      XCTAssertEqual(result, [1,2])
    } while false
    
  }
  
  func testMDeleteDupNode() {
    let item = MDeleteDupNode()
    repeat {
      var head: LKNode? = nil
      var deletedNode: LKNode? = nil
      item.delete(head: &head)
      XCTAssertNil(head)
    } while false
    
    repeat {
      let list = [1,1,3]
      var head = LKNode.makeLKNode(items: list)
      var deletedNode: LKNode? = LKNode.get(node: head, index: 1) // 2
      item.delete(head: &head)
      let result = LKNode.node2Array(node: head)
      XCTAssertEqual(result, [1,3])
    } while false
    
    repeat {
      let list = [1,1,1]
      var head = LKNode.makeLKNode(items: list)
      var deletedNode: LKNode? = LKNode.get(node: head, index: 0) // 1
      item.delete(head: &head)
      let result = LKNode.node2Array(node: head)
      XCTAssertEqual(result, [1])
    } while false

    repeat {
      let list = [1,1,2,2,3,3,3]
      var head = LKNode.makeLKNode(items: list)
      var deletedNode: LKNode? = LKNode.get(node: head, index: 2) // 3
      item.delete(head: &head)
      let result = LKNode.node2Array(node: head)
      XCTAssertEqual(result, [1,2,3])
    } while false
    
  }
  
  func testMyNumeric() {
    let item = MyNumeric()
    repeat {
      let r = item.isNumberic("100")
      XCTAssert(r == true)
    } while false

    repeat {
      let r = item.isNumberic("123.45e+6")
      XCTAssert(r == true)
    } while false

    repeat {
      let r = item.isNumberic("+500")
      XCTAssert(r == true)
    } while false

    repeat {
      let r = item.isNumberic("5e2")
      XCTAssert(r == true)
    } while false

    repeat {
      let r = item.isNumberic("3.1416")
      XCTAssert(r == true)
    } while false

    repeat {
      let r = item.isNumberic("600.")
      XCTAssert(r == true)
    } while false

    repeat {
      let r = item.isNumberic("-.123")
      XCTAssert(r == true)
    } while false

    repeat {
      let r = item.isNumberic("-1E-16")
      XCTAssert(r == true)
    } while false

    repeat {
      let r = item.isNumberic("1.79769313486232E+308")
      XCTAssert(r == true)
    } while false

    repeat {
      let r = item.isNumberic("12e")
      XCTAssert(r == false)
    } while false

    repeat {
      let r = item.isNumberic("1a3.14")
      XCTAssert(r == false)
    } while false

    repeat {
      let r = item.isNumberic("1+23")
      XCTAssert(r == false)
    } while false

    repeat {
      let r = item.isNumberic("1.2.3")
      XCTAssert(r == false)
    } while false

    repeat {
      let r = item.isNumberic("+-5")
      XCTAssert(r == false)
    } while false

    repeat {
      let r = item.isNumberic("12e+5.4")
      XCTAssert(r == false)
    } while false

    repeat {
      let r = item.isNumberic(".")
      XCTAssert(r == false)
    } while false

    repeat {
      let r = item.isNumberic(".e1")
      XCTAssert(r == false)
    } while false

    repeat {
      let r = item.isNumberic("e1")
      XCTAssert(r == false)
    } while false

    repeat {
      let r = item.isNumberic("+.")
      XCTAssert(r == false)
    } while false

  }
  
  func testRecordOddEven() {
    let item = RecordOddEven()
    repeat {
      var list = [1, 2, 3, 4, 5, 6, 7]
      item.record(&list)
      XCTAssert(list == [1,7,3,5,4,6,2])
    } while false
    
    repeat {
      var list = [2, 4, 6, 1, 3, 5, 7]
      item.record(&list)
      XCTAssert(list == [7,5,3,1,6,4,2])
    } while false
    
    repeat {
      var list = [1, 3, 5, 7, 2, 4, 6]
      item.record(&list)
      XCTAssert(list == [1, 3, 5, 7, 2, 4, 6])
    } while false
    
    repeat {
      var list = [1]
      item.record(&list)
      XCTAssert(list == [1])
    } while false
    
  }
  
  func testTailKthNode() {
    let item = TailKthNode()
    repeat {
      let list = [1,2,3,4]
      let node = LKNode.makeLKNode(items: list)
      let r = try? item.find(node, 1)
      XCTAssertEqual(r, 4)
    } while false
    
    repeat {
      let list = [1,2,3,4]
      let node = LKNode.makeLKNode(items: list)
      XCTAssertThrowsError(try item.find(node, 10))
    } while false
    
    repeat {
      let list = [1,2,3,4]
      let node = LKNode.makeLKNode(items: list)
      XCTAssertThrowsError(try item.find(node, 0))
    } while false
    
    repeat {
      let list = [1,2,3,4]
      let node = LKNode.makeLKNode(items: list)
      let r = try? item.find(node, 4)
      XCTAssertEqual(r, 1)
    } while false
    
    repeat {
      let list = [1,2,3,4]
      let node = LKNode.makeLKNode(items: list)
      XCTAssertThrowsError(try item.find(node, 5))
    } while false
    
    repeat {
      let list = [Int]()
      let node = LKNode.makeLKNode(items: list)
      XCTAssertThrowsError(try item.find(node, 0))
    } while false

    
  }
  
  func testLinkCircleLoop() {
    let item = LinkCircleLoop()
    repeat {
      let list = [1,2,3,4]
      let node = LKNode.makeLKNode(items: list)
      let r = item.entryNodeFor(node)
      XCTAssertNil(r)
    } while false
    
    repeat {
      let list = [1,2,3,4]
      let node = LKNode.makeLKNode(items: list)
      let n4 = LKNode.get(node: node, index: 3)
      let n2 = LKNode.get(node: node, index: 1)
      n4?.next = n2
      let r = item.entryNodeFor(node)
      XCTAssertEqual(r, n2)
    } while false

    repeat {
      let list = [1,2,3,4]
      let node = LKNode.makeLKNode(items: list)
      let n4 = LKNode.get(node: node, index: 3)
      let n1 = LKNode.get(node: node, index: 0)
      n4?.next = n1
      let r = item.entryNodeFor(node)
      XCTAssertEqual(r, n1)
    } while false
    
    repeat {
      let list = [1,2,3,4]
      let node = LKNode.makeLKNode(items: list)
      let n4 = LKNode.get(node: node, index: 3)
      n4?.next = n4
      let r = item.entryNodeFor(node)
      XCTAssertEqual(r, n4)
    } while false

    
  }
  
  func testLinkCircleLoop2() {
    let item = LinkCircleLoop2()
    repeat {
      let list = [1,2,3,4]
      let node = LKNode.makeLKNode(items: list)
      let r = item.entryNodeFor(node)
      XCTAssertNil(r)
    } while false
    
    repeat {
      let list = [1,2,3,4]
      let node = LKNode.makeLKNode(items: list)
      let n4 = LKNode.get(node: node, index: 3)
      let n2 = LKNode.get(node: node, index: 1)
      n4?.next = n2
      let r = item.entryNodeFor(node)
      XCTAssertEqual(r, n2)
    } while false

    repeat {
      let list = [1,2,3,4]
      let node = LKNode.makeLKNode(items: list)
      let n4 = LKNode.get(node: node, index: 3)
      let n1 = LKNode.get(node: node, index: 0)
      n4?.next = n1
      let r = item.entryNodeFor(node)
      XCTAssertEqual(r, n1)
    } while false
    
    repeat {
      let list = [1,2,3,4]
      let node = LKNode.makeLKNode(items: list)
      let n4 = LKNode.get(node: node, index: 3)
      n4?.next = n4
      let r = item.entryNodeFor(node)
      XCTAssertEqual(r, n4)
    } while false

    
  }
  
  func teststride() {
    // [from, to)
    // [0, -1) -1
    // [0, 1) +1
    for i in stride(from: 0, to: -1, by: -1) {
      print(i)
    }
  }
}
