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
  
  func testMergeLink() {
    let item = MergeLink()
    repeat {
      let l1 = [1,3,5]
      let l2 = [2,4,6]
      let n1 = LKNode.makeLKNode(items: l1)
      let n2 = LKNode.makeLKNode(items: l2)
      
      let node: LKNode? = item.merge(n1, n2)
      let result = LKNode.node2Array(node: node)
      XCTAssertEqual(result, [1,2,3,4,5,6])
    } while false
    
    repeat {
      let l1 = [1,3,5]
      let l2 = [1,3,5]
      let n1 = LKNode.makeLKNode(items: l1)
      let n2 = LKNode.makeLKNode(items: l2)
      
      let node: LKNode? = item.merge(n1, n2)
      let result = LKNode.node2Array(node: node)
      XCTAssertEqual(result, [1,1,3,3,5,5])
    } while false
    
    repeat {
      let l1 = [1]
      let l2 = [2]
      let n1 = LKNode.makeLKNode(items: l1)
      let n2 = LKNode.makeLKNode(items: l2)
      
      let node: LKNode? = item.merge(n1, n2)
      let result = LKNode.node2Array(node: node)
      XCTAssertEqual(result, [1,2])
    } while false
    
    repeat {
      let l1 = [Int]()
      let l2 = [1,2,3]
      let n1 = LKNode.makeLKNode(items: l1)
      let n2 = LKNode.makeLKNode(items: l2)
      
      let node: LKNode? = item.merge(n1, n2)
      let result = LKNode.node2Array(node: node)
      XCTAssertEqual(result, [1,2,3])
    } while false
    
    repeat {
      let l1 = [1,2,3]
      let l2 = [Int]()
      let n1 = LKNode.makeLKNode(items: l1)
      let n2 = LKNode.makeLKNode(items: l2)
      
      let node: LKNode? = item.merge(n1, n2)
      let result = LKNode.node2Array(node: node)
      XCTAssertEqual(result, [1,2,3])
    } while false
    
    repeat {
      let l1 = [Int]()
      let l2 = [Int]()
      let n1 = LKNode.makeLKNode(items: l1)
      let n2 = LKNode.makeLKNode(items: l2)
      
      let node: LKNode? = item.merge(n1, n2)
      XCTAssertNil(node)
    } while false
  }
  
  
  func testMySubTree() {
    let item = MySubTree()
    repeat {
      // 树中结点含有分叉，树B是树A的子结构
      //                  8                8
      //              /       \           / \
      //             8         7         9   2
      //           /   \
      //          9     2
      //               / \
      //              4   7
      
      let pNodeA1 = BTTree(value: 8)
      let pNodeA2 = BTTree(value: 8)
      let pNodeA3 = BTTree(value: 7)
      let pNodeA4 = BTTree(value: 9)
      let pNodeA5 = BTTree(value: 2)
      let pNodeA6 = BTTree(value: 4)
      let pNodeA7 = BTTree(value: 7)
      BTTree.connect(parent: pNodeA1, left: pNodeA2, right: pNodeA3)
      BTTree.connect(parent: pNodeA2, left: pNodeA4, right: pNodeA5)
      BTTree.connect(parent: pNodeA5, left: pNodeA6, right: pNodeA7)
      let pNodeB1 = BTTree(value: 8)
      let pNodeB2 = BTTree(value: 9)
      let pNodeB3 = BTTree(value: 2)
      BTTree.connect(parent: pNodeB1, left: pNodeB2, right: pNodeB3)
      let result: Bool = item.hasSub(pNodeA1, pNodeB1)
      XCTAssert(result ==  true)

    } while false
    
    repeat {
      // 树中结点含有分叉，树B不是树A的子结构
      //                  8                8
      //              /       \           / \
      //             8         7         9   2
      //           /   \
      //          9     3
      //               / \
      //              4   7
      
      let pNodeA1 = BTTree(value: 8)
      let pNodeA2 = BTTree(value: 8)
      let pNodeA3 = BTTree(value: 7)
      let pNodeA4 = BTTree(value: 9)
      let pNodeA5 = BTTree(value: 3)
      let pNodeA6 = BTTree(value: 4)
      let pNodeA7 = BTTree(value: 7)
      BTTree.connect(parent: pNodeA1, left: pNodeA2, right: pNodeA3)
      BTTree.connect(parent: pNodeA2, left: pNodeA4, right: pNodeA5)
      BTTree.connect(parent: pNodeA5, left: pNodeA6, right: pNodeA7)
      let pNodeB1 = BTTree(value: 8)
      let pNodeB2 = BTTree(value: 9)
      let pNodeB3 = BTTree(value: 2)
      BTTree.connect(parent: pNodeB1, left: pNodeB2, right: pNodeB3)
      let result: Bool = item.hasSub(pNodeA1, pNodeB1)
      XCTAssert(result ==  false)
    } while false
    
    repeat {
      // 树中结点只有左子结点，树B是树A的子结构
      //                8                  8
      //              /                   /
      //             8                   9
      //           /                    /
      //          9                    2
      //         /
      //        2
      //       /
      //      5
      let pNodeA1 = BTTree(value: 8)
      let pNodeA2 = BTTree(value: 8)
      let pNodeA3 = BTTree(value: 9)
      let pNodeA4 = BTTree(value: 2)
      let pNodeA5 = BTTree(value: 5)
      BTTree.connect(parent: pNodeA1, left: pNodeA2, right: nil)
      BTTree.connect(parent: pNodeA2, left: pNodeA3, right: nil)
      BTTree.connect(parent: pNodeA3, left: pNodeA4, right: nil)
      BTTree.connect(parent: pNodeA4, left: pNodeA5, right: nil)
      let pNodeB1 = BTTree(value: 8)
      let pNodeB2 = BTTree(value: 9)
      let pNodeB3 = BTTree(value: 2)
      BTTree.connect(parent: pNodeB1, left: pNodeB2, right: nil)
      BTTree.connect(parent: pNodeB2, left: pNodeB3, right: nil)
      let result: Bool = item.hasSub(pNodeA1, pNodeB1)
      XCTAssert(result ==  true)
      
    } while false
    
    repeat {
      // 树中结点只有左子结点，树B不是树A的子结构
      //                8                  8
      //              /                   /
      //             8                   9
      //           /                    /
      //          9                    3
      //         /
      //        2
      //       /
      //      5
      let pNodeA1 = BTTree(value: 8)
      let pNodeA2 = BTTree(value: 8)
      let pNodeA3 = BTTree(value: 9)
      let pNodeA4 = BTTree(value: 2)
      let pNodeA5 = BTTree(value: 5)
      BTTree.connect(parent: pNodeA1, left: pNodeA2, right: nil)
      BTTree.connect(parent: pNodeA2, left: pNodeA3, right: nil)
      BTTree.connect(parent: pNodeA3, left: pNodeA4, right: nil)
      BTTree.connect(parent: pNodeA4, left: pNodeA5, right: nil)
      let pNodeB1 = BTTree(value: 8)
      let pNodeB2 = BTTree(value: 9)
      let pNodeB3 = BTTree(value: 3)
      BTTree.connect(parent: pNodeB1, left: pNodeB2, right: nil)
      BTTree.connect(parent: pNodeB2, left: pNodeB3, right: nil)
      let result: Bool = item.hasSub(pNodeA1, pNodeB1)
      XCTAssert(result ==  false)
    } while false
    
    repeat {
      // 树中结点只有右子结点，树B是树A的子结构
      //       8                   8
      //        \                   \
      //         8                   9
      //          \                   \
      //           9                   2
      //            \
      //             2
      //              \
      //               5
      let pNodeA1 = BTTree(value: 8)
      let pNodeA2 = BTTree(value: 8)
      let pNodeA3 = BTTree(value: 9)
      let pNodeA4 = BTTree(value: 2)
      let pNodeA5 = BTTree(value: 5)
      BTTree.connect(parent: pNodeA1, left: nil, right: pNodeA2)
      BTTree.connect(parent: pNodeA2, left: nil, right: pNodeA3)
      BTTree.connect(parent: pNodeA3, left: nil, right: pNodeA4)
      BTTree.connect(parent: pNodeA4, left: nil, right: pNodeA5)
      let pNodeB1 = BTTree(value: 8)
      let pNodeB2 = BTTree(value: 9)
      let pNodeB3 = BTTree(value: 2)
      BTTree.connect(parent: pNodeB1, left: nil, right: pNodeB2)
      BTTree.connect(parent: pNodeB2, left: nil, right: pNodeB3)
      let result: Bool = item.hasSub(pNodeA1, pNodeB1)
      XCTAssert(result ==  true)

    } while false
    
    repeat {
      // 树A中结点只有右子结点，树B不是树A的子结构
      //       8                   8
      //        \                   \
      //         8                   9
      //          \                 / \
      //           9               3   2
      //            \
      //             2
      //              \
      //               5
      let pNodeA1 = BTTree(value: 8)
      let pNodeA2 = BTTree(value: 8)
      let pNodeA3 = BTTree(value: 9)
      let pNodeA4 = BTTree(value: 2)
      let pNodeA5 = BTTree(value: 5)
      BTTree.connect(parent: pNodeA1, left: nil, right: pNodeA2)
      BTTree.connect(parent: pNodeA2, left: nil, right: pNodeA3)
      BTTree.connect(parent: pNodeA3, left: nil, right: pNodeA4)
      BTTree.connect(parent: pNodeA4, left: nil, right: pNodeA5)
      let pNodeB1 = BTTree(value: 8)
      let pNodeB2 = BTTree(value: 9)
      let pNodeB3 = BTTree(value: 2)
      BTTree.connect(parent: pNodeB1, left: nil, right: pNodeB2)
      BTTree.connect(parent: pNodeB2, left: nil, right: pNodeB3)
      let result: Bool = item.hasSub(pNodeA1, pNodeB1)
      XCTAssert(result ==  true)
    } while false
    
    repeat {
      // 树A为空树

      let pNodeB1 = BTTree(value: 8)
      let pNodeB2 = BTTree(value: 9)
      let pNodeB3 = BTTree(value: 3)
      let pNodeB4 = BTTree(value: 2)
      BTTree.connect(parent: pNodeB1, left: nil, right: pNodeB2)
      BTTree.connect(parent: pNodeB2, left: pNodeB3, right: pNodeB4)
      let result: Bool = item.hasSub(nil, pNodeB1)
      XCTAssert(result ==  false)
    } while false
    
    repeat {
      // 树B为空树
      let pNodeA1 = BTTree(value: 8)
      let pNodeA2 = BTTree(value: 9)
      let pNodeA3 = BTTree(value: 3)
      let pNodeA4 = BTTree(value: 2)
      BTTree.connect(parent: pNodeA1, left: nil, right: pNodeA2)
      BTTree.connect(parent: pNodeA2, left: pNodeA3, right: pNodeA4)
      let result: Bool = item.hasSub(pNodeA1, nil)
      XCTAssert(result ==  false)

    } while false
    
    repeat {
      // 树A, B为空树
      let result: Bool = item.hasSub(nil, nil)
      XCTAssert(result ==  false)
    } while false
    
  }
  
  func testMyMirrorTree() {
    let item = MyMirrorTree()
    repeat {
      // 测试完全二叉树：除了叶子节点，其他节点都有两个子节点
      //            8
      //        6      10
      //       5 7    9  11
      let pNode8 = BTTree(value: 8)
      let pNode6 = BTTree(value: 6)
      let pNode10 = BTTree(value: 10)
      let pNode5 = BTTree(value: 5)
      let pNode7 = BTTree(value: 7)
      let pNode9 = BTTree(value: 9)
      let pNode11 = BTTree(value: 11)
      BTTree.connect(parent: pNode8, left: pNode6, right: pNode10)
      BTTree.connect(parent: pNode6, left: pNode5, right: pNode7)
      BTTree.connect(parent: pNode10, left: pNode9, right: pNode11)

      let root = item.mirror(pNode8)
      
      let res = BTTree.levelOrder(root)
      for e in res {
        print(e)
      }
      print("----")
      XCTAssert(res.count == 3)
      XCTAssert(res[0] == [8])
      XCTAssert(res[1] == [10, 6])
      XCTAssert(res[2] == [11, 9, 7, 5])
      
    } while false
    
    repeat {
      // 测试二叉树：出叶子结点之外，左右的结点都有且只有一个左子结点
      //            8
      //          7
      //        6
      //      5
      //    4
      let pNode8 = BTTree(value: 8)
      let pNode7 = BTTree(value: 7)
      let pNode6 = BTTree(value: 6)
      let pNode5 = BTTree(value: 5)
      let pNode4 = BTTree(value: 4)
      BTTree.connect(parent: pNode8, left: pNode7, right: nil)
      BTTree.connect(parent: pNode7, left: pNode6, right: nil)
      BTTree.connect(parent: pNode6, left: pNode5, right: nil)
      BTTree.connect(parent: pNode5, left: pNode4, right: nil)
      
      let root = item.mirror(pNode8)
      
      let res = BTTree.levelOrder(root)
      for e in res {
        print(e)
      }

      print("----")

    } while false
    
    repeat {
      // 测试二叉树：出叶子结点之外，左右的结点都有且只有一个左子结点
      //            8
    } while false
    
    repeat {
      // 测试二叉树：出叶子结点之外，左右的结点都有且只有一个右子结点
      //            8
      //             7
      //              6
      //               5
      //                4
      let pNode8 = BTTree(value: 8)
      let pNode7 = BTTree(value: 7)
      let pNode6 = BTTree(value: 6)
      let pNode5 = BTTree(value: 5)
      let pNode4 = BTTree(value: 4)
      BTTree.connect(parent: pNode8, left: nil, right: pNode7)
      BTTree.connect(parent: pNode7, left: nil, right: pNode6)
      BTTree.connect(parent: pNode6, left: nil, right: pNode5)
      BTTree.connect(parent: pNode5, left: nil, right: pNode4)

      let root = item.mirror(pNode8)
      
      let res = BTTree.levelOrder(root)
      for e in res {
        print(e)
      }

      print("----")
    } while false
    
    repeat {
      let root = item.mirror(nil)
      
      let res = BTTree.levelOrder(root)
      for e in res {
        print(e)
      }
    } while false
    
    repeat {
      let pNode8 = BTTree(value: 8)
      let root = item.mirror(pNode8)
      
      let res = BTTree.levelOrder(root)
      for e in res {
        print(e)
      }
      print("----")
    } while false
  }
  
    func testMyMirrorTree2() {
    let item = MyMirrorTree2()
    repeat {
      // 测试完全二叉树：除了叶子节点，其他节点都有两个子节点
      //            8
      //        6      10
      //       5 7    9  11
      let pNode8 = BTTree(value: 8)
      let pNode6 = BTTree(value: 6)
      let pNode10 = BTTree(value: 10)
      let pNode5 = BTTree(value: 5)
      let pNode7 = BTTree(value: 7)
      let pNode9 = BTTree(value: 9)
      let pNode11 = BTTree(value: 11)
      BTTree.connect(parent: pNode8, left: pNode6, right: pNode10)
      BTTree.connect(parent: pNode6, left: pNode5, right: pNode7)
      BTTree.connect(parent: pNode10, left: pNode9, right: pNode11)

      let root = item.mirror(pNode8)
      
      let res = BTTree.levelOrder(root)
      for e in res {
        print(e)
      }
      print("----")
      XCTAssert(res.count == 3)
      XCTAssert(res[0] == [8])
      XCTAssert(res[1] == [10, 6])
      XCTAssert(res[2] == [11, 9, 7, 5])
      
    } while false
    
    repeat {
      // 测试二叉树：出叶子结点之外，左右的结点都有且只有一个左子结点
      //            8
      //          7
      //        6
      //      5
      //    4
      let pNode8 = BTTree(value: 8)
      let pNode7 = BTTree(value: 7)
      let pNode6 = BTTree(value: 6)
      let pNode5 = BTTree(value: 5)
      let pNode4 = BTTree(value: 4)
      BTTree.connect(parent: pNode8, left: pNode7, right: nil)
      BTTree.connect(parent: pNode7, left: pNode6, right: nil)
      BTTree.connect(parent: pNode6, left: pNode5, right: nil)
      BTTree.connect(parent: pNode5, left: pNode4, right: nil)
      
      let root = item.mirror(pNode8)
      
      let res = BTTree.levelOrder(root)
      for e in res {
        print(e)
      }

      print("----")

    } while false
    
    repeat {
      // 测试二叉树：出叶子结点之外，左右的结点都有且只有一个左子结点
      //            8
    } while false
    
    repeat {
      // 测试二叉树：出叶子结点之外，左右的结点都有且只有一个右子结点
      //            8
      //             7
      //              6
      //               5
      //                4
      let pNode8 = BTTree(value: 8)
      let pNode7 = BTTree(value: 7)
      let pNode6 = BTTree(value: 6)
      let pNode5 = BTTree(value: 5)
      let pNode4 = BTTree(value: 4)
      BTTree.connect(parent: pNode8, left: nil, right: pNode7)
      BTTree.connect(parent: pNode7, left: nil, right: pNode6)
      BTTree.connect(parent: pNode6, left: nil, right: pNode5)
      BTTree.connect(parent: pNode5, left: nil, right: pNode4)

      let root = item.mirror(pNode8)
      
      let res = BTTree.levelOrder(root)
      for e in res {
        print(e)
      }

      print("----")
    } while false
    
    repeat {
      let root = item.mirror(nil)
      
      let res = BTTree.levelOrder(root)
      for e in res {
        print(e)
      }
    } while false
    
    repeat {
      let pNode8 = BTTree(value: 8)
      let root = item.mirror(pNode8)
      
      let res = BTTree.levelOrder(root)
      for e in res {
        print(e)
      }
      print("----")
    } while false
  }

  
  func testMySymmetricalTree() {
    let item = MySymmetricalTree()
    repeat {
      //            8
      //        6      6
      //       5 7    7 5
      let pNode8 = BTTree(value: 8)
      let pNode61 = BTTree(value: 6)
      let pNode62 = BTTree(value: 6)
      let pNode51 = BTTree(value: 5)
      let pNode71 = BTTree(value: 7)
      let pNode72 = BTTree(value: 7)
      let pNode52 = BTTree(value: 5)
      BTTree.connect(parent: pNode8, left: pNode61, right: pNode62)
      BTTree.connect(parent: pNode61, left: pNode51, right: pNode71)
      BTTree.connect(parent: pNode62, left: pNode72, right: pNode52)
      let result: Bool = item.isSymmetrical(pNode8)
      XCTAssert(result ==  true)
    } while false
    
    repeat {
      //            8
      //        6      9
      //       5 7    7 5
      let pNode8 = BTTree(value: 8)
      let pNode61 = BTTree(value: 6)
      let pNode9 = BTTree(value: 9)
      let pNode51 = BTTree(value: 5)
      let pNode71 = BTTree(value: 7)
      let pNode72 = BTTree(value: 7)
      let pNode52 = BTTree(value: 5)
      BTTree.connect(parent: pNode8, left: pNode61, right: pNode9)
      BTTree.connect(parent: pNode61, left: pNode51, right: pNode71)
      BTTree.connect(parent: pNode9, left: pNode72, right: pNode52)
      let result: Bool = item.isSymmetrical(pNode8)
      XCTAssert(result ==  false)
    } while false
    
    repeat {
      //            8
      //        6      6
      //       5 7    7
      let pNode8 = BTTree(value: 8)
      let pNode61 = BTTree(value: 6)
      let pNode62 = BTTree(value: 6)
      let pNode51 = BTTree(value: 5)
      let pNode71 = BTTree(value: 7)
      let pNode72 = BTTree(value: 7)
      BTTree.connect(parent: pNode8, left: pNode61, right: pNode62)
      BTTree.connect(parent: pNode61, left: pNode51, right: pNode71)
      BTTree.connect(parent: pNode62, left: pNode72, right: nil)
      let result: Bool = item.isSymmetrical(pNode8)
      XCTAssert(result ==  false)

    } while false
    
    repeat {
      //               5
      //              / \
      //             3   3
      //            /     \
      //           4       4
      //          /         \
      //         2           2
      //        /             \
      //       1               1
      let pNode5 = BTTree(value: 5)
      let pNode31 = BTTree(value: 3)
      let pNode32 = BTTree(value: 3)
      let pNode41 = BTTree(value: 4)
      let pNode42 = BTTree(value: 4)
      let pNode21 = BTTree(value: 2)
      let pNode22 = BTTree(value: 2)
      let pNode11 = BTTree(value: 1)
      let pNode12 = BTTree(value: 1)
      BTTree.connect(parent: pNode5, left: pNode31, right: pNode32)
      BTTree.connect(parent: pNode31, left: pNode41, right: nil)
      BTTree.connect(parent: pNode32, left: nil, right: pNode42)
      BTTree.connect(parent: pNode41, left: pNode21, right: nil)
      BTTree.connect(parent: pNode42, left: nil, right: pNode22)
      BTTree.connect(parent: pNode21, left: pNode11, right: nil)
      BTTree.connect(parent: pNode22, left: nil, right: pNode12)
      let result: Bool = item.isSymmetrical(pNode5)
      XCTAssert(result ==  true)
    } while false
    
    repeat {

      //               5
      //              / \
      //             3   3
      //            /     \
      //           4       4
      //          /         \
      //         6           2
      //        /             \
      //       1               1
      let pNode5 = BTTree(value: 5)
      let pNode31 = BTTree(value: 3)
      let pNode32 = BTTree(value: 3)
      let pNode41 = BTTree(value: 4)
      let pNode42 = BTTree(value: 4)
      let pNode6 = BTTree(value: 6)
      let pNode22 = BTTree(value: 2)
      let pNode11 = BTTree(value: 1)
      let pNode12 = BTTree(value: 1)
      BTTree.connect(parent: pNode5, left: pNode31, right: pNode32)
      BTTree.connect(parent: pNode31, left: pNode41, right: nil)
      BTTree.connect(parent: pNode32, left: nil, right: pNode42)
      BTTree.connect(parent: pNode41, left: pNode6, right: nil)
      BTTree.connect(parent: pNode42, left: nil, right: pNode22)
      BTTree.connect(parent: pNode6, left: pNode11, right: nil)
      BTTree.connect(parent: pNode22, left: nil, right: pNode12)
      let result: Bool = item.isSymmetrical(pNode5)
      XCTAssert(result ==  false)
    } while false
    

    repeat {
      //               5
      //              / \
      //             3   3
      //            /     \
      //           4       4
      //          /         \
      //         2           2
      //                      \
      //                       1
      let pNode5 = BTTree(value: 5)
      let pNode31 = BTTree(value: 3)
      let pNode32 = BTTree(value: 3)
      let pNode41 = BTTree(value: 4)
      let pNode42 = BTTree(value: 4)
      let pNode21 = BTTree(value: 2)
      let pNode22 = BTTree(value: 2)
      let pNode12 = BTTree(value: 1)
      BTTree.connect(parent: pNode5, left: pNode31, right: pNode32)
      BTTree.connect(parent: pNode31, left: pNode41, right: nil)
      BTTree.connect(parent: pNode32, left: nil, right: pNode42)
      BTTree.connect(parent: pNode41, left: pNode21, right: nil)
      BTTree.connect(parent: pNode42, left: nil, right: pNode22)
      BTTree.connect(parent: pNode21, left: nil, right: nil)
      BTTree.connect(parent: pNode22, left: nil, right: pNode12)
      let result: Bool = item.isSymmetrical(pNode5)
      XCTAssert(result ==  false)
    } while false
    
    repeat {
      // 只有一个结点
      let pNode1 = BTTree(value: 1)
      let result: Bool = item.isSymmetrical(pNode1)
      XCTAssert(result ==  true)

    } while false
  }
  
  func testMyMatrixClockwisely(){
    let item = MyMatrixClockwisely()
    
    repeat {
      let res = MatrixInt.make(rows: 1, cols: 1, start: 1)
      let list = item.logMatrixClockwisely(res)
      XCTAssertEqual(list, [1])
    } while false
    
    repeat {
      let res = MatrixInt.make(rows: 2, cols: 2, start: 1)
      let list = item.logMatrixClockwisely(res)
      XCTAssertEqual(list, [1,2,4,3])
    } while false
    
    repeat {
      // 1,2,3
      // 4,5,6
      // 7,8,9
      let res = MatrixInt.make(rows: 3, cols: 3, start: 1)
      let list = item.logMatrixClockwisely(res)
      XCTAssertEqual(list, [1, 2, 3, 6,9, 8, 7,4,5])
    } while false
    
    repeat {
      let res = MatrixInt.make(rows: 4, cols: 4, start: 1)
      let list = item.logMatrixClockwisely(res)
      XCTAssertEqual(list, [1, 2, 3, 4, 8, 12, 16, 15,14,13, 9 , 5, 6,7,11, 10])
      print("===")
    } while false
    
    repeat {
      let res = MatrixInt.make(rows: 1, cols: 5, start: 1)
      let list = item.logMatrixClockwisely(res)
      XCTAssertEqual(list, [1, 2, 3, 4,5])
    } while false
    
    repeat {
      let res = MatrixInt.make(rows: 2, cols: 5, start: 1)
      let list = item.logMatrixClockwisely(res)
      XCTAssertEqual(list, [1, 2, 3, 4, 5, 10, 9, 8, 7, 6])
    } while false
    
    repeat {
      let res = MatrixInt.make(rows: 3, cols: 5, start: 1)
      let list = item.logMatrixClockwisely(res)
      XCTAssertEqual(list, [1, 2, 3, 4, 5, 10, 15, 14, 13, 12, 11, 6, 7, 8, 9])
    } while false
    
    
    repeat {
      let res = MatrixInt.make(rows: 5, cols: 1, start: 1)
      let list = item.logMatrixClockwisely(res)
      XCTAssertEqual(list, [1, 2,3,4,5])
    } while false
    
    repeat {
      let res = MatrixInt.make(rows: 5, cols: 2, start: 1)
      let list = item.logMatrixClockwisely(res)
      XCTAssertEqual(list, [1, 2, 4, 6, 8, 10, 9, 7, 5, 3])
    } while false
    
    repeat {
      let res = MatrixInt.make(rows: 5, cols: 3, start: 1)
      let list = item.logMatrixClockwisely(res)
      XCTAssertEqual(list, [1, 2, 3, 6, 9, 12, 15, 14, 13, 10, 7, 4, 5, 8, 11])
    } while false
    
    repeat {
      let res = MatrixInt.make(rows: 5, cols: 4, start: 1)
      let list = item.logMatrixClockwisely(res)
      XCTAssertEqual(list, [1, 2, 3, 4, 8, 12, 16, 20, 19, 18, 17, 13, 9, 5, 6, 7, 11, 15, 14, 10])

    } while false
  }
  
  func testMyStackMinInt() {
    let item: MyStackMinInt  = MyStackMinInt()
    repeat {
      item.push(3)
      XCTAssert(try item.min() ==  3)
      item.push(4)
      XCTAssert(try item.min() ==  3)
      item.push(2)
      XCTAssert(try item.min() ==  2)
      item.push(3)
      XCTAssert(try item.min() ==  2)
      try? item.pop()
      XCTAssert(try item.min() ==  2)
      try? item.pop()
      XCTAssert(try item.min() ==  3)
      try? item.pop()
      XCTAssert(try item.min() ==  3)
      item.push(0)
      XCTAssert(try item.min() ==  0)
    } while false
    
    
  }
  
  func testMyPopOrder() {
    let item: MyPopOrder  = MyPopOrder()
    repeat {
      let push = [1, 2, 3, 4, 5]
      let pop = [4, 5, 3, 2, 1]
      XCTAssert(item.isPopOrder(push, pop) == true)
      
    } while false
    
    repeat {
      let push = [1, 2, 3, 4, 5]
      let pop = [4, 3, 5, 1, 2]
      XCTAssert(item.isPopOrder(push, pop) == false)
    } while false
    
    repeat {
      let push = [1, 2, 3, 4, 5]
      let pop = [3, 5, 4, 1, 2]
      XCTAssert(item.isPopOrder(push, pop) == false)
      
    } while false
    
    repeat {
      let push = [1]
      let pop = [2]
      XCTAssert(item.isPopOrder(push, pop) == false)
    } while false
    repeat {
      
      let push = [1]
      let pop = [1]
      XCTAssert(item.isPopOrder(push, pop) == true)
    } while false

    repeat {
      
      let push = [Int]()
      let pop = [Int]()
      XCTAssert(item.isPopOrder(push, pop) == true)
    } while false
  }
  
  func testMyLevelTree() {
    let item = MyLevelTree()
    repeat {
      //            10
      //         /      \
      //        6        14
      //       /\        /\
      //      4  8     12  16
      let pNode10 = BTTree(value: 10)
      let pNode6 = BTTree(value: 6)
      let pNode14 = BTTree(value: 14)
      let pNode4 = BTTree(value: 4)
      let pNode8 = BTTree(value: 8)
      let pNode12 = BTTree(value: 12)
      let pNode16 = BTTree(value: 16)
      BTTree.connect(parent: pNode10, left: pNode6, right: pNode14)
      BTTree.connect(parent: pNode6, left: pNode4, right: pNode8)
      BTTree.connect(parent: pNode14, left: pNode12, right: pNode16)
      let list = item.level(pNode10)
      
      XCTAssertEqual(list, [10, 6, 14, 4, 8, 12, 16])

    } while false
    
    repeat {
      //               5
      //              /
      //             4
      //            /
      //           3
      //          /
      //         2
      //        /
      //       1
      let pNode5 = BTTree(value: 5)
      let pNode4 = BTTree(value: 4)
      let pNode3 = BTTree(value: 3)
      let pNode2 = BTTree(value: 2)
      let pNode1 = BTTree(value: 1)
      BTTree.connect(parent: pNode5, left: pNode4, right: nil)
      BTTree.connect(parent: pNode4, left: pNode3, right: nil)
      BTTree.connect(parent: pNode3, left: pNode2, right: nil)
      BTTree.connect(parent: pNode2, left: pNode1, right: nil)
       XCTAssert(item.level(pNode5) == [5,4,3,2,1])

      
    } while false
    
    repeat {
      // 1
      //  \
      //   2
      //    \
      //     3
      //      \
      //       4
      //        \
      //         5
      let pNode1 = BTTree(value: 1)
      let pNode2 = BTTree(value: 2)
      let pNode3 = BTTree(value: 3)
      let pNode4 = BTTree(value: 4)
      let pNode5 = BTTree(value: 5)
      BTTree.connect(parent: pNode1, left: nil, right: pNode2)
      BTTree.connect(parent: pNode2, left: nil, right: pNode3)
      BTTree.connect(parent: pNode3, left: nil, right: pNode4)
      BTTree.connect(parent: pNode4, left: nil, right: pNode5)
      XCTAssert(item.level(pNode1) == [1,2,3,4,5])
      
    } while false

    
    repeat {
      // 树中只有1个结点
      let pNode1 = BTTree(value: 1)
      XCTAssert(item.level(pNode1) == [1])
      
    } while false
    
    repeat {
      // 树中没有结点
      XCTAssert(item.level(nil) == [Int]())
      
    } while false
    
  }
  
  
  func testMyLevelTree2() {
    let item = MyLevelTree2()
    repeat {
      //            8
      //        6      10
      //       5 7    9  11
      let pNode8 = BTTree(value: 8)
      let pNode6 = BTTree(value: 6)
      let pNode10 = BTTree(value: 10)
      let pNode5 = BTTree(value: 5)
      let pNode7 = BTTree(value: 7)
      let pNode9 = BTTree(value: 9)
      let pNode11 = BTTree(value: 11)
      BTTree.connect(parent: pNode8, left: pNode6, right: pNode10)
      BTTree.connect(parent: pNode6, left: pNode5, right: pNode7)
      BTTree.connect(parent: pNode10, left: pNode9, right: pNode11)
      let list = item.level(pNode8)
      
      XCTAssertEqual(list, [[8], [6, 10], [5, 7, 9, 11]]
      )
      
    } while false
    
    repeat {
      //               5
      //              /
      //             4
      //            /
      //           3
      //          /
      //         2
      let pNode5 = BTTree(value: 5)
      let pNode4 = BTTree(value: 4)
      let pNode3 = BTTree(value: 3)
      let pNode2 = BTTree(value: 2)
      BTTree.connect(parent: pNode5, left: pNode4, right: nil)
      BTTree.connect(parent: pNode4, left: pNode3, right: nil)
      BTTree.connect(parent: pNode3, left: pNode2, right: nil)
      XCTAssert(item.level(pNode5) == [[5], [4], [3], [2]])
    } while false
    
    repeat {
      //        5
      //         4
      //          3
      //           2
      let pNode5 = BTTree(value: 5)
      let pNode4 = BTTree(value: 4)
      let pNode3 = BTTree(value: 3)
      let pNode2 = BTTree(value: 2)
      BTTree.connect(parent: pNode5, left: nil, right: pNode4)
      BTTree.connect(parent: pNode4, left: nil, right: pNode3)
      BTTree.connect(parent: pNode3, left: nil, right: pNode2)
      XCTAssert(item.level(pNode5) == [[5], [4], [3], [2]])
      
    } while false
    
    
    repeat {
      // 树中只有1个结点
      let pNode1 = BTTree(value: 1)
      XCTAssert(item.level(pNode1) == [[1]])
      
    } while false
    
    repeat {
      // 树中没有结点
      let empty = [[Int]]()
      XCTAssert(item.level(nil) == empty)
      
    } while false
    
  }
  
  func testMyLevelTree3() {
    let item = MyLevelTree3()
    repeat {
      //            8
      //        6      10
      //       5 7    9  11
      let pNode8 = BTTree(value: 8)
      let pNode6 = BTTree(value: 6)
      let pNode10 = BTTree(value: 10)
      let pNode5 = BTTree(value: 5)
      let pNode7 = BTTree(value: 7)
      let pNode9 = BTTree(value: 9)
      let pNode11 = BTTree(value: 11)
      BTTree.connect(parent: pNode8, left: pNode6, right: pNode10)
      BTTree.connect(parent: pNode6, left: pNode5, right: pNode7)
      BTTree.connect(parent: pNode10, left: pNode9, right: pNode11)
      let list = item.level(pNode8)
      
      XCTAssertEqual(list, [[8], [10, 6], [5, 7, 9, 11]]
      )
      
    } while false
    
    repeat {
      //               5
      //              /
      //             4
      //            /
      //           3
      //          /
      //         2
      let pNode5 = BTTree(value: 5)
      let pNode4 = BTTree(value: 4)
      let pNode3 = BTTree(value: 3)
      let pNode2 = BTTree(value: 2)
      BTTree.connect(parent: pNode5, left: pNode4, right: nil)
      BTTree.connect(parent: pNode4, left: pNode3, right: nil)
      BTTree.connect(parent: pNode3, left: pNode2, right: nil)
      XCTAssert(item.level(pNode5) == [[5], [4], [3], [2]])
    } while false
    
    repeat {
      //        5
      //         4
      //          3
      //           2
      let pNode5 = BTTree(value: 5)
      let pNode4 = BTTree(value: 4)
      let pNode3 = BTTree(value: 3)
      let pNode2 = BTTree(value: 2)
      BTTree.connect(parent: pNode5, left: nil, right: pNode4)
      BTTree.connect(parent: pNode4, left: nil, right: pNode3)
      BTTree.connect(parent: pNode3, left: nil, right: pNode2)
      XCTAssert(item.level(pNode5) == [[5], [4], [3], [2]])
      
    } while false
    
    
    repeat {
      // 树中只有1个结点
      let pNode1 = BTTree(value: 1)
      XCTAssert(item.level(pNode1) == [[1]])
      
    } while false
    
    repeat {
      // 树中没有结点
      let empty = [[Int]]()
      XCTAssert(item.level(nil) == empty)
      
    } while false
    
    repeat {
      //                8
      //        4              12
      //     2     6       10      14
      //   1  3  5  7     9 11   13  15
      let pNode8 = BTTree(value: 8)
      let pNode4 = BTTree(value: 4)
      let pNode12 = BTTree(value: 12)
      let pNode2 = BTTree(value: 2)
      let pNode6 = BTTree(value: 6)
      let pNode10 = BTTree(value: 10)
      let pNode14 = BTTree(value: 14)
      let pNode1 = BTTree(value: 1)
      let pNode3 = BTTree(value: 3)
      let pNode5 = BTTree(value: 5)
      let pNode7 = BTTree(value: 7)
      let pNode9 = BTTree(value: 9)
      let pNode11 = BTTree(value: 11)
      let pNode13 = BTTree(value: 13)
      let pNode15 = BTTree(value: 15)
      BTTree.connect(parent: pNode8, left: pNode4, right: pNode12)
      BTTree.connect(parent: pNode4, left: pNode2, right: pNode6)
      BTTree.connect(parent: pNode12, left: pNode10, right: pNode14)
      BTTree.connect(parent: pNode2, left: pNode1, right: pNode3)
      BTTree.connect(parent: pNode6, left: pNode5, right: pNode7)
      BTTree.connect(parent: pNode10, left: pNode9, right: pNode11)
      BTTree.connect(parent: pNode14, left: pNode13, right: pNode15)

      let list = item.level(pNode8)
      XCTAssert(list == [[8],
                         [12, 4],
                         [2, 6, 10, 14],
                         [15, 13, 11, 9, 7, 5, 3, 1]
        ])
    } while false
    
  }
  

  func testMyVerifySquenceOfBST() {
    let item = MyVerifySquenceOfBST()
    repeat {

      //            10
      //         /      \
      //        6        14
      //       /\        /\
      //      4  8     12  16
      let list = [4, 8, 6, 12, 16, 14, 10]
      let result = item.verify(list, 0, list.count - 1)
      XCTAssert(result == true)
    } while false
    
    repeat {

      //           5
      //          / \
      //         4   7
      //            /
      //           6
      let list = [4, 6, 7, 5]
      let result = item.verify(list, 0, list.count - 1)
      XCTAssert(result == true)
    } while false
    
    repeat {
      //               5
      //              /
      //             4
      //            /
      //           3
      //          /
      //         2
      //        /
      //       1
      let list = [1, 2, 3, 4, 5]
      let result = item.verify(list, 0, list.count - 1)
      XCTAssert(result == true)
    } while false
    
    repeat {
      // 1
      //  \
      //   2
      //    \
      //     3
      //      \
      //       4
      //        \
      //         5
      let list = [5, 4, 3, 2, 1]
      let result = item.verify(list, 0, list.count - 1)
      XCTAssert(result == true)
    } while false
    
    repeat {
      // 1
      let list = [1]
      let result = item.verify(list, 0, list.count - 1)
      XCTAssert(result == true)
    } while false
    
    repeat {
         // 1
         let list = [7, 4, 6, 5]
         let result = item.verify(list, 0, list.count - 1)
         XCTAssert(result == false)
       } while false
    
    repeat {
      // 1
      let list = [4, 6, 12, 8, 16, 14, 10]
      let result = item.verify(list, 0, list.count - 1)
      XCTAssert(result == false)
    } while false
    
    repeat {
      // 1
      let list = [Int]()
      let result = item.verify(list, 0, list.count - 1)
      XCTAssert(result == false)
    } while false
  }
  
  func testMyVerifySquenceOfBST2() {
    let item = MyVerifySquenceOfBST2()
    repeat {

      //            10
      //         /      \
      //        6        14
      //       /\        /\
      //      4  8     12  16
      let list = [4, 8, 6, 12, 16, 14, 10]
      let result = item.verify(list, 0, list.count - 1)
      XCTAssert(result == true)
    } while false
    
    repeat {

      //           5
      //          / \
      //         4   7
      //            /
      //           6
      let list = [4, 6, 7, 5]
      let result = item.verify(list, 0, list.count - 1)
      XCTAssert(result == true)
    } while false
    
    repeat {
      //               5
      //              /
      //             4
      //            /
      //           3
      //          /
      //         2
      //        /
      //       1
      let list = [1, 2, 3, 4, 5]
      let result = item.verify(list, 0, list.count - 1)
      XCTAssert(result == true)
    } while false
    
    repeat {
      // 1
      //  \
      //   2
      //    \
      //     3
      //      \
      //       4
      //        \
      //         5
      let list = [5, 4, 3, 2, 1]
      let result = item.verify(list, 0, list.count - 1)
      XCTAssert(result == true)
    } while false
    
    repeat {
      // 1
      let list = [1]
      let result = item.verify(list, 0, list.count - 1)
      XCTAssert(result == true)
    } while false
    
    repeat {
         // 1
         let list = [7, 4, 6, 5]
         let result = item.verify(list, 0, list.count - 1)
         XCTAssert(result == false)
       } while false
    
    repeat {
      // 1
      let list = [4, 6, 12, 8, 16, 14, 10]
      let result = item.verify(list, 0, list.count - 1)
      XCTAssert(result == false)
    } while false
    
    repeat {
      // 1
      let list = [Int]()
      let result = item.verify(list, 0, list.count - 1)
      XCTAssert(result == false)
    } while false
  }

  func testFindTreePath() {
    let item = FindTreePath()
    repeat {
      //            10
      //         /      \
      //        5        12
      //       /\
      //      4  7
      let pNode10 = BTTree(value: 10)
      let pNode5 = BTTree(value: 5)
      let pNode12 = BTTree(value: 12)
      let pNode4 = BTTree(value: 4)
      let pNode7 = BTTree(value: 7)
      BTTree.connect(parent: pNode10, left: pNode5, right: pNode12)
      BTTree.connect(parent: pNode5, left: pNode4, right: pNode7)

      let result = item.find(pNode10, 22)
      XCTAssert(result == [[10,5,7],
                           [10, 12]
        ])
      
    } while false
    
    repeat {
      //            10
      //         /      \
      //        5        12
      //       /\
      //      4  7
      let pNode10 = BTTree(value: 10)
      let pNode5 = BTTree(value: 5)
      let pNode12 = BTTree(value: 12)
      let pNode4 = BTTree(value: 4)
      let pNode7 = BTTree(value: 7)
      BTTree.connect(parent: pNode10, left: pNode5, right: pNode12)
      BTTree.connect(parent: pNode5, left: pNode4, right: pNode7)

      let empty = [[Int]]()
      let result = item.find(pNode10, 15)
      XCTAssert(result == empty)
      
    } while false
    
    repeat {
      //               5
      //              /
      //             4
      //            /
      //           3
      //          /
      //         2
      //        /
      //       1
      // 有一条路径上面的结点和为15
      let pNode5 = BTTree(value: 5)
      let pNode4 = BTTree(value: 4)
      let pNode3 = BTTree(value: 3)
      let pNode2 = BTTree(value: 2)
      let pNode1 = BTTree(value: 1)
      BTTree.connect(parent: pNode5, left: pNode4, right: nil)
      BTTree.connect(parent: pNode4, left: pNode3, right: nil)
      BTTree.connect(parent: pNode3, left: pNode2, right: nil)
      BTTree.connect(parent: pNode2, left: pNode1, right: nil)

      let result = item.find(pNode5, 15)
      XCTAssert(result == [[5,4,3,2,1]])
      
    } while false
    
    repeat {
      // 1
      //  \
      //   2
      //    \
      //     3
      //      \
      //       4
      //        \
      //         5
      // 没有路径上面的结点和为16
      let pNode1 = BTTree(value: 1)
      let pNode2 = BTTree(value: 2)
      let pNode3 = BTTree(value: 3)
      let pNode4 = BTTree(value: 4)
      let pNode5 = BTTree(value: 5)
      BTTree.connect(parent: pNode1, left: nil, right: pNode2)
      BTTree.connect(parent: pNode2, left: nil, right: pNode3)
      BTTree.connect(parent: pNode3, left: nil, right: pNode4)
      BTTree.connect(parent: pNode4, left: nil, right: pNode5)

      let empty = [[Int]]()
      let result = item.find(pNode1, 16)
      XCTAssert(result == empty)
      
    } while false
    
    
    repeat {
      // 1
      let pNode1 = BTTree(value: 1)
      let result = item.find(pNode1, 1)
      XCTAssert(result ==  [[1]])
    } while false
    
    repeat {
      // 1
      let empty = [[Int]]()
      let result = item.find(nil, 0)
      XCTAssert(result == empty)
    } while false
  }
  
  func testMyComplexNodeCopy() {
    let item = MyComplexNodeCopy()
    repeat {
      //          -----------------
      //         \|/              |
      //  1-------2-------3-------4-------5
      //  |       |      /|\             /|\
      //  --------+--------               |
      //          -------------------------
      let pNode1 = ComplexLKNode(value: 1)
      let pNode2 = ComplexLKNode(value: 2)
      let pNode3 = ComplexLKNode(value: 3)
      let pNode4 = ComplexLKNode(value: 4)
      let pNode5 = ComplexLKNode(value: 5)
      ComplexLKNode.connect(pNode1, next: pNode2, slibing: pNode3)
      ComplexLKNode.connect(pNode2, next: pNode3, slibing: pNode5)
      ComplexLKNode.connect(pNode3, next: pNode4, slibing: nil)
      ComplexLKNode.connect(pNode4, next: pNode5, slibing: pNode2)
      
      let r = item.copy(pNode1)
      let rinfo = ComplexLKNode.info(r)
      let pinfo = ComplexLKNode.info(pNode1)
      XCTAssertEqual(rinfo, pinfo)
    } while false
    
    
    repeat {
      // m_pSibling指向结点自身
      //          -----------------
      //         \|/              |
      //  1-------2-------3-------4-------5
      //         |       | /|\           /|\
      //         |       | --             |
      //         |------------------------|
      let pNode1 = ComplexLKNode(value: 1)
      let pNode2 = ComplexLKNode(value: 2)
      let pNode3 = ComplexLKNode(value: 3)
      let pNode4 = ComplexLKNode(value: 4)
      let pNode5 = ComplexLKNode(value: 5)
      ComplexLKNode.connect(pNode1, next: pNode2, slibing: nil)
      ComplexLKNode.connect(pNode2, next: pNode3, slibing: pNode5)
      ComplexLKNode.connect(pNode3, next: pNode4, slibing: pNode3)
      ComplexLKNode.connect(pNode4, next: pNode5, slibing: pNode2)
      
      let r = item.copy(pNode1)
      let rinfo = ComplexLKNode.info(r)
      let pinfo = ComplexLKNode.info(pNode1)
      XCTAssertEqual(rinfo, pinfo)
    } while false
    
    repeat {
      // m_pSibling形成环
      //          -----------------
      //         \|/              |
      //  1-------2-------3-------4-------5
      //          |              /|\
      //          |               |
      //          |---------------|
      let pNode1 = ComplexLKNode(value: 1)
      let pNode2 = ComplexLKNode(value: 2)
      let pNode3 = ComplexLKNode(value: 3)
      let pNode4 = ComplexLKNode(value: 4)
      let pNode5 = ComplexLKNode(value: 5)
      ComplexLKNode.connect(pNode1, next: pNode2, slibing: nil)
      ComplexLKNode.connect(pNode2, next: pNode3, slibing: pNode4)
      ComplexLKNode.connect(pNode3, next: pNode4, slibing: nil)
      ComplexLKNode.connect(pNode4, next: pNode5, slibing: pNode2)
      
      let r = item.copy(pNode1)
      let rinfo = ComplexLKNode.info(r)
      let pinfo = ComplexLKNode.info(pNode1)
      XCTAssertEqual(rinfo, pinfo)
    } while false
    
    repeat {
      // 只有一个结点
      let pNode1 = ComplexLKNode(value: 1)
      ComplexLKNode.connect(pNode1, next: nil, slibing: pNode1)
      
      let r = item.copy(pNode1)
      let rinfo = ComplexLKNode.info(r)
      let pinfo = ComplexLKNode.info(pNode1)
      XCTAssertEqual(rinfo, pinfo)
    } while false
  }
  
  func testMyConvertTree2Link() {
    let item = MyConvertTree2Link()
    repeat {
      //            10
      //         /      \
      //        6        14
      //       /\        /\
      //      4  8     12  16
      let pNode10 = BTTree(value: 10)
      let pNode6 = BTTree(value: 6)
      let pNode14 = BTTree(value: 14)
      let pNode4 = BTTree(value: 4)
      let pNode8 = BTTree(value: 8)
      let pNode12 = BTTree(value: 12)
      let pNode16 = BTTree(value: 16)
      BTTree.connect(parent: pNode10, left: pNode6, right: pNode14)
      BTTree.connect(parent: pNode6, left: pNode4, right: pNode8)
      BTTree.connect(parent: pNode14, left: pNode12, right: pNode16)
      let result = item.convert(pNode10)
      
      let res = BTTree.toDoubleLink(result)
      XCTAssertEqual(res, [[4,6,8,10,12,14,16], [16,14,12,10,8,6,4]])
    } while false
    
    repeat {
      //               5
      //              /
      //             4
      //            /
      //           3
      //          /
      //         2
      //        /
      //       1
      let pNode5 = BTTree(value: 5)
      let pNode4 = BTTree(value: 4)
      let pNode3 = BTTree(value: 3)
      let pNode2 = BTTree(value: 2)
      let pNode1 = BTTree(value: 1)
      BTTree.connect(parent: pNode5, left: pNode4, right: nil)
      BTTree.connect(parent: pNode4, left: pNode3, right: nil)
      BTTree.connect(parent: pNode3, left: pNode2, right: nil)
      BTTree.connect(parent: pNode2, left: pNode1, right: nil)
      let result = item.convert(pNode5)
      let res = BTTree.toDoubleLink(result)
      XCTAssertEqual(res, [[1,2,3,4,5], [5,4,3,2,1]])
      
    } while false
    
    repeat {
      // 1
      //  \
      //   2
      //    \
      //     3
      //      \
      //       4
      //        \
      //         5
      let pNode1 = BTTree(value: 1)
      let pNode2 = BTTree(value: 2)
      let pNode3 = BTTree(value: 3)
      let pNode4 = BTTree(value: 4)
      let pNode5 = BTTree(value: 5)
      BTTree.connect(parent: pNode1, left: nil, right: pNode2)
      BTTree.connect(parent: pNode2, left: nil, right: pNode3)
      BTTree.connect(parent: pNode3, left: nil, right: pNode4)
      BTTree.connect(parent: pNode4, left: nil, right: pNode5)
      let result = item.convert(pNode1)
      let res = BTTree.toDoubleLink(result)
      XCTAssertEqual(res, [[1,2,3,4,5], [5,4,3,2,1]])
      
    } while false
    
    repeat {
      // 1
      let pNode1 = BTTree(value: 1)
      let result = item.convert(pNode1)
      let res = BTTree.toDoubleLink(result)
      XCTAssertEqual(res, [[1], [1]])
    } while false
    
    repeat {
      // 1
      let empty = [[Int]]()
      
      let result = item.convert(nil)
      let res = BTTree.toDoubleLink(result)
      XCTAssertEqual(res, empty)
    } while false

    
  }
  
  func testMyCodableTree() {
    let item = MyCodableTree()
    repeat {
      //            8
      //        6      10
      //       5 7    9  11
      let pNode8 = BTTree(value: 8)
      let pNode6 = BTTree(value: 6)
      let pNode10 = BTTree(value: 10)
      let pNode5 = BTTree(value: 5)
      let pNode7 = BTTree(value: 7)
      let pNode9 = BTTree(value: 9)
      let pNode11 = BTTree(value: 11)
      BTTree.connect(parent: pNode8, left: pNode6, right: pNode10)
      BTTree.connect(parent: pNode6, left: pNode5, right: pNode7)
      BTTree.connect(parent: pNode10, left: pNode9, right: pNode11)
      
      let rs = item.serialize(pNode8)
      XCTAssertEqual(rs, "8,6,5,$,$,7,$,$,10,9,$,$,11,$,$")
      
      let rt = item.deserialize(rs)
      let lrt = BTTree.levelOrder(rt)
      XCTAssertEqual(lrt,[
        [8],
        [6, 10],
        [5, 7, 9, 11]
      ])
    } while false
  }
  
  func testMyPermutation() {
    let item = MyPermutation()
    repeat {
      let res = item.excute("")
      XCTAssertEqual(res, [""])
    } while false
    
    repeat {
      let res = item.excute("a")
      XCTAssertEqual(res, ["a"])
    } while false
    
    repeat {
      let res = item.excute("ab")
      XCTAssertEqual(res, ["ab", "ba"])
    } while false
    
    repeat {
      let res = item.excute("abc")
      XCTAssertEqual(res, ["abc", "acb", "bac", "bca", "cab", "cba"])
    } while false
  }
  
  func testMyMoreThanHalf() {
    let item = MyMoreThanHalf()
    repeat {
      let list = [1, 2, 3, 2, 2, 2, 5, 4, 2]
      let r = item.find(list)
      XCTAssertEqual(r, 2)
    } while false
    
    repeat {
      let list = [1]
      let r = item.find(list)
      XCTAssertEqual(r, 0)
    } while false
    
    repeat {
      let list = [Int]()
      let r = item.find(list)
      XCTAssertEqual(r, 0)
    } while false
  }
  
  func testMyMoreThanHalf2() {
    let item = MyMoreThanHalf2()
    repeat {
      let list = [1, 2, 3, 2, 2, 2, 5, 4, 2]
      let r = item.find(list)
      XCTAssertEqual(r, 2)
    } while false
    
    repeat {
      let list = [1]
      let r = item.find(list)
      XCTAssertEqual(r, 0)
    } while false
    
    repeat {
      let list = [Int]()
      let r = item.find(list)
      XCTAssertEqual(r, 0)
    } while false
  }
  
  func testMyLowestKth() {
    let item = MyLowestKth()
    repeat {
      // k < list.count
      let list = [4, 5, 1, 6, 2, 7, 3, 8]
      let result = item.find(list, 4)
      XCTAssertEqual(result.sorted(), [1, 2, 3, 4])
    } while false
    
    repeat {
      // k = list.count - 1
      let list = [4, 5, 1, 6, 2, 7, 3, 8]
      let result = item.find(list, 8)
      XCTAssertEqual(result.sorted(), [1, 2, 3, 4, 5, 6, 7, 8])
    } while false
    
    repeat {
      // k > list.count - 1
      let list = [4, 5, 1, 6, 2, 7, 3, 8]
      let result = item.find(list, 10)
      XCTAssertEqual(result, Array<Int>())
    } while false
    
    repeat {
      // k > list.count - 1
      let list = [4, 5, 1, 6, 2, 7, 3, 8]
      let result = item.find(list, 0)
      XCTAssertEqual(result, Array<Int>())
    } while false
    
    repeat {
      // k > list.count - 1
      let list = [4, 5, 1, 6, 2, 7, 3, 8]
      let result = item.find(list, 1)
      XCTAssertEqual(result, [1])
    } while false
    
  }
  
  func testMedianFind() {
    let item = MyMiddleFind()

    repeat {
      let r1: Double? = item.getMedian()
      XCTAssertEqual(r1, nil)
    } while false
    
    repeat {
      item.append(5)
      let r1: Double? = item.getMedian()
      XCTAssertEqual(r1, 5.0)
    } while false
    
    repeat {
      item.append(2)
      let r1: Double? = item.getMedian()
      XCTAssertEqual(r1, 3.5)
    } while false
    
    repeat {
      item.append(3)
      let r1: Double? = item.getMedian()
      XCTAssertEqual(r1, 3)
    } while false

    repeat {
      item.append(4)
      let r1: Double? = item.getMedian()
      XCTAssertEqual(r1, 3.5)
    } while false

    repeat {
      item.append(1)
      let r1: Double? = item.getMedian()
      XCTAssertEqual(r1, 3)
    } while false
    
    repeat {
      item.append(6)
      let r1: Double? = item.getMedian()
      XCTAssertEqual(r1, 3.5)
    } while false
    
    repeat {
      item.append(7)
      let r1: Double? = item.getMedian()
      XCTAssertEqual(r1, 4)
    } while false
    
    repeat {
      item.append(0)
      let r1: Double? = item.getMedian()
      XCTAssertEqual(r1, 3.5)
    } while false
    
    repeat {
      item.append(8)
      let r1: Double? = item.getMedian()
      XCTAssertEqual(r1, 4)
    } while false
  }
  
  func testMyMaxSubSum() {
    let item = MyMaxSubSum()
    repeat {
      let list = [1, -2, 3, 10, -4, 7, 2, -5]
      let r = item.get(list)
      XCTAssertEqual(r, 18)
    } while false
    
    repeat {
      let list = [-2, -8, -1, -5, -9]
      let r = item.get(list)
      XCTAssertEqual(r, -1)
    } while false
    
    repeat {
      let list = [2, 8, 1, 5, 9]
      let r = item.get(list)
      XCTAssertEqual(r, 25)
    } while false
    
    repeat {
      let list = [Int]()
      let r = item.get(list)
      XCTAssertEqual(r, Int.min)
    } while false
  }
  
  func testNumberOf1My() {
    let item = NumberOf1My()
    repeat {
      let n = 0
      let r = item.count(n)
      XCTAssertEqual(r, 0)
    } while false
    
    repeat {
      let n = 1
      let r = item.count(n)
      XCTAssertEqual(r, 1)
    } while false
    
    repeat {
      let n = 5
      let r = item.count(n)
      XCTAssertEqual(r, 1)
    } while false
    
    repeat {
      let n = 10
      let r = item.count(n)
      XCTAssertEqual(r, 2)
    } while false
    
    repeat {
      let n = 55
      let r = item.count(n)
      XCTAssertEqual(r, 16)
    } while false
    
    repeat {
      let n = 99
      let r = item.count(n)
      XCTAssertEqual(r, 20)
    } while false
    
    repeat {
      let n = 10000
      let r = item.count(n)
      XCTAssertEqual(r, 4001)
    } while false
    
    repeat {
      let n = 21345
      let r = item.count(n)
      XCTAssertEqual(r, 18821)
    } while false
  }
  
  func testNumberOf1My2() {
    let item = NumberOf1My2()
    repeat {
      let n = 0
      let r = item.count(n)
      XCTAssertEqual(r, 0)
    } while false
    
    repeat {
      let n = 1
      let r = item.count(n)
      XCTAssertEqual(r, 1)
    } while false
    
    repeat {
      let n = 5
      let r = item.count(n)
      XCTAssertEqual(r, 1)
    } while false
    
    repeat {
      let n = 10
      let r = item.count(n)
      XCTAssertEqual(r, 2)
    } while false
    
    repeat {
      let n = 55
      let r = item.count(n)
      XCTAssertEqual(r, 16)
    } while false
    
    repeat {
      let n = 99
      let r = item.count(n)
      XCTAssertEqual(r, 20)
    } while false
    
    repeat {
      let n = 10000
      let r = item.count(n)
      XCTAssertEqual(r, 4001)
    } while false
    
    repeat {
      let n = 21345
      let r = item.count(n)
      XCTAssertEqual(r, 18821)
    } while false
  }
  
  
  func testMySortedList() {
    let item = MySortedList()
    repeat {
      let list = [3, 5, 1, 4, 2]
      let r = item.min(list)
      XCTAssertEqual(r, "12345")
    } while false
    
    repeat {
      let list = [3, 32, 321]
      let r = item.min(list)
      XCTAssertEqual(r, "321323")
    } while false
    
    repeat {
      let list = [3, 323, 32123]
      let r = item.min(list)
      XCTAssertEqual(r, "321233233")
    } while false
    
    repeat {
      let list = [1, 11, 111]
      let r = item.min(list)
      XCTAssertEqual(r, "111111")
    } while false
    
    repeat {
      let list = [321]
      let r = item.min(list)
      XCTAssertEqual(r, "321")
    } while false
    
    repeat {
      let list = [Int]()
      let r = item.min(list)
      XCTAssertEqual(r, "")
    } while false
  }
  
  func testMySortedList2() {
    let item = MySortedList2()
    repeat {
      let list = [3, 5, 1, 4, 2]
      let r = item.min(list)
      XCTAssertEqual(r, "12345")
    } while false

    repeat {
      let list = [3, 32, 321]
      let r = item.min(list)
      XCTAssertEqual(r, "321323")
    } while false

    repeat {
      let list = [3, 323, 32123]
      let r = item.min(list)
      XCTAssertEqual(r, "321233233")
    } while false
    
    repeat {
      let list = [1, 11, 111]
      let r = item.min(list)
      XCTAssertEqual(r, "111111")
    } while false
    
    repeat {
      let list = [321]
      let r = item.min(list)
      XCTAssertEqual(r, "321")
    } while false
    
    repeat {
      let list = [Int]()
      let r = item.min(list)
      XCTAssertEqual(r, "")
    } while false
  }
  
  func testMyTranslation() {
    let item = MyTranslation()
    repeat {
      let n = 0
      let r = item.translation(n)
      XCTAssertEqual(r, 1)
    } while false
    
    repeat {
      let n = 10
      let r = item.translation(n)
      XCTAssertEqual(r, 2)
    } while false
    
    repeat {
      let n = 125
      let r = item.translation(n)
      XCTAssertEqual(r, 3)
    } while false
    
    repeat {
      let n = 126
      let r = item.translation(n)
      XCTAssertEqual(r, 2)
    } while false
    
    repeat {
      let n = 426
      let r = item.translation(n)
      XCTAssertEqual(r, 1)
    } while false
    
    repeat {
      let n = 100
      let r = item.translation(n)
      XCTAssertEqual(r, 2)
    } while false
    
    repeat {
      let n = 101
      let r = item.translation(n)
      XCTAssertEqual(r, 2)
    } while false
    
    repeat {
      let n = 12258
      let r = item.translation(n)
      XCTAssertEqual(r, 5)
    } while false
    
    repeat {
      let n = -100
      let r = item.translation(n)
      XCTAssertEqual(r, 0)
    } while false
  }
  
  func testMyMaxGiftValue() {
    let item = MyMaxGiftValue()
    repeat {
      let list = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
      let r = item.getGiftMaxValue(list)
      XCTAssertEqual(r, 29)
    } while false
    
    repeat {
      let list = [[1, 10, 3, 8], [12, 2, 9, 6], [5, 7, 4, 11], [3, 7, 16, 5]]
      let r = item.getGiftMaxValue(list)
      XCTAssertEqual(r, 53)
    } while false
    
    repeat {
      let list = [[1, 10, 3, 8]]
      let r = item.getGiftMaxValue(list)
      XCTAssertEqual(r, 22)
    } while false
    
    repeat {
      let list = [[1], [12], [5], [3]]
      let r = item.getGiftMaxValue(list)
      XCTAssertEqual(r, 21)
    } while false
    
    repeat {
      let list = [[1]]
      let r = item.getGiftMaxValue(list)
      XCTAssertEqual(r, 1)
    } while false
    
    repeat {
      let list = [[Int]]()
      let r = item.getGiftMaxValue(list)
      XCTAssertEqual(r, 0)
    } while false
  }
  
  func testMyMaxDuplicationSubString() {
    let item = MyMaxDuplicationSubString()
    repeat {
      let s = "abcacfrar"
      let r = item.getDuplicateSubLength(s)
      XCTAssertEqual(r, 4)
    } while false
    
    repeat {
      let s = "acfrarabc"
      let r = item.getDuplicateSubLength(s)
      XCTAssertEqual(r, 4)
    } while false
    
    repeat {
      let s = "arabcacfr"
      let r = item.getDuplicateSubLength(s)
      XCTAssertEqual(r, 4)
    } while false
   
    repeat {
      let s = "aaaa"
      let r = item.getDuplicateSubLength(s)
      XCTAssertEqual(r, 1)
    } while false
    
    repeat {
      let s = "abcdefg"
      let r = item.getDuplicateSubLength(s)
      XCTAssertEqual(r, 7)
    } while false
    
    repeat {
      let s = "aaabbbccc"
      let r = item.getDuplicateSubLength(s)
      XCTAssertEqual(r, 2)
    } while false
    
    repeat {
      let s = "abcdcba"
      let r = item.getDuplicateSubLength(s)
      XCTAssertEqual(r, 4)
    } while false
    
    repeat {
      let s = "abcdaef"
      let r = item.getDuplicateSubLength(s)
      XCTAssertEqual(r, 6)
    } while false
    
    repeat {
      let s = "a"
      let r = item.getDuplicateSubLength(s)
      XCTAssertEqual(r, 1)
    } while false
    
    repeat {
      let s = ""
      let r = item.getDuplicateSubLength(s)
      XCTAssertEqual(r, 0)
    } while false
  }
  
  func testNthUglyNumber() {
    let item = NthUglyNumber()
    repeat {
      let n = 1
      let r = item.ugly(n)
      XCTAssertEqual(r, 1)
    } while false
    repeat {
      let n = 2
      let r = item.ugly(n)
      XCTAssertEqual(r, 2)
    } while false
    repeat {
      let n = 3
      let r = item.ugly(n)
      XCTAssertEqual(r, 3)
    } while false
    repeat {
      let n = 4
      let r = item.ugly(n)
      XCTAssertEqual(r, 4)
    } while false
    repeat {
      let n = 5
      let r = item.ugly(n)
      XCTAssertEqual(r, 5)
    } while false
    repeat {
      let n = 6
      let r = item.ugly(n)
      XCTAssertEqual(r, 6)
    } while false
    repeat {
      let n = 7
      let r = item.ugly(n)
      XCTAssertEqual(r, 8)
    } while false
    repeat {
      let n = 8
      let r = item.ugly(n)
      XCTAssertEqual(r, 9)
    } while false
    repeat {
      let n = 9
      let r = item.ugly(n)
      XCTAssertEqual(r, 10)
    } while false
    repeat {
      let n = 10
      let r = item.ugly(n)
      XCTAssertEqual(r, 12)
    } while false
    repeat {
      let n = 11
      let r = item.ugly(n)
      XCTAssertEqual(r, 15)
    } while false
    repeat {
      let n = 1500
      let r = item.ugly(n)
      XCTAssertEqual(r, 859963392)
    } while false
    repeat {
      let n = 0
      let r = item.ugly(n)
      XCTAssertEqual(r, 0)
    } while false

  }
  
  
  func testFirstNotRepeatChar() {
    let item = FirstNotRepeatChar()
    repeat {
      let s = "google"
      let c = item.only1thCharacter(s)
      XCTAssertEqual(c, "l")
    } while false
    
    repeat {
      let s = "abcdefg"
      let c = item.only1thCharacter(s)
      XCTAssertEqual(c, "a")
    } while false
    
    repeat {
      let s = "aabccdbd"
      let c = item.only1thCharacter(s)
      XCTAssertEqual(c, "\0")
    } while false
    
    repeat {
      let s = ""
      let c = item.only1thCharacter(s)
      XCTAssertEqual(c, "\0")
    } while false
  }
  
  func testFirstNotRepeatChar2() {
    let item = FirstNotRepeatCharInStringStream()
    repeat {
      let r = item.getFirst()
      XCTAssertEqual(r, "\0")
    } while false
    
    repeat {
      item.append("g")
      let r = item.getFirst()
      XCTAssertEqual(r, "g")
    } while false
    
    repeat {
      item.append("o")
      let r = item.getFirst()
      XCTAssertEqual(r, "g")
    } while false
    
    repeat {
      item.append("o")
      let r = item.getFirst()
      XCTAssertEqual(r, "g")
    } while false
    
    repeat {
      item.append("g")
      let r = item.getFirst()
      XCTAssertEqual(r, "\0")
    } while false
    
    repeat {
      item.append("l")
      let r = item.getFirst()
      XCTAssertEqual(r, "l")
    } while false
    
    repeat {
      item.append("e")
      let r = item.getFirst()
      XCTAssertEqual(r, "l")
    } while false
  }
  
  func testMergeSort() {
    
    
    repeat {
      let list = makeRandomList(1)
      print(list)
      let item = MergeSort()
      let r = item.sort(list)
      print(r)
      XCTAssertEqual(r, list.sorted())
    } while false
    
    print("======")
    
    repeat {
      let list = makeRandomList(2)
      print(list)
      let item = MergeSort()
      let r = item.sort(list)
      print(r)
      XCTAssertEqual(r, list.sorted())
    } while false
    
    print("======")
    
    repeat {
      let list = makeRandomList(3)
      print(list)
      let item = MergeSort()
      let r = item.sort(list)
      print(r)
      XCTAssertEqual(r, list.sorted())
    } while false
    
    print("======")
    repeat {
      let list = makeRandomList(5)
      print(list)
      let item = MergeSort()
      let r = item.sort(list)
      print(r)
      XCTAssertEqual(r, list.sorted())
    } while false
    
    print("======")
    
    
    repeat {
      let list = makeRandomList(8)
      print(list)
      let item = MergeSort()
      let r = item.sort(list)
      print(r)
      XCTAssertEqual(r, list.sorted())
    } while false
    
    print("======")
    
    repeat {
      let list = makeRandomList(15)
      print(list)
      let item = MergeSort()
      let r = item.sort(list)
      print(r)
      XCTAssertEqual(r, list.sorted())
    } while false
    
    print("======")
    
  }
  
  func testMyReversePairs() {
    let item = MyReversePairs()
    
    repeat {
      let list = [1, 2, 1, 2, 1]
      let r = item.reversePairsCount(list)
      XCTAssertEqual(r, 3)
    } while false
    
    repeat {
      let list = [1, 2, 3, 4, 7, 6, 5]
      let r = item.reversePairsCount(list)
      XCTAssertEqual(r, 3)
    } while false
    
    repeat {
      let list = [6, 5, 4, 3, 2, 1]
      let r = item.reversePairsCount(list)
      XCTAssertEqual(r, 15)
    } while false

    repeat {
      let list = [1, 2, 3, 4, 5, 6]
      let r = item.reversePairsCount(list)
      XCTAssertEqual(r, 0)
    } while false

    repeat {
      let list = [1]
      let r = item.reversePairsCount(list)
      XCTAssertEqual(r, 0)
    } while false
    
    repeat {
      let list = [1, 2]
      let r = item.reversePairsCount(list)
      XCTAssertEqual(r, 0)
    } while false

    repeat {
      let list = [2, 1]
      let r = item.reversePairsCount(list)
      XCTAssertEqual(r, 1)
    } while false

    repeat {
      let list = [Int]()
      let r = item.reversePairsCount(list)
      XCTAssertEqual(r, 0)
    } while false
  }

  func testFirstCommonNode() {
    let item = FirstCommonNode()
    repeat {
      // 1 - 2 - 3 \
      //            6 - 7
      //     4 - 5 /
      
      let pNode1 = LKNode(1)
      let pNode2 = LKNode(2)
      let pNode3 = LKNode(3)
      let pNode4 = LKNode(4)
      let pNode5 = LKNode(5)
      let pNode6 = LKNode(6)
      let pNode7 = LKNode(7)
      LKNode.connect(pNode1, next: pNode2)
      LKNode.connect(pNode2, next: pNode3)
      LKNode.connect(pNode3, next: pNode6)
      LKNode.connect(pNode4, next: pNode5)
      LKNode.connect(pNode5, next: pNode6)
      LKNode.connect(pNode6, next: pNode7)
      let r = item.solution(pNode1, pNode4)
      XCTAssertEqual(r, pNode6)
      
    } while false
    
    repeat {
      // 没有公共结点
      // 1 - 2 - 3 - 4
      //
      // 5 - 6 - 7
      let pNode1 = LKNode(1)
      let pNode2 = LKNode(2)
      let pNode3 = LKNode(3)
      let pNode4 = LKNode(4)
      let pNode5 = LKNode(5)
      let pNode6 = LKNode(6)
      let pNode7 = LKNode(7)
      LKNode.connect(pNode1, next: pNode2)
      LKNode.connect(pNode2, next: pNode3)
      LKNode.connect(pNode3, next: pNode4)
      LKNode.connect(pNode5, next: pNode6)
      LKNode.connect(pNode6, next: pNode7)
      let r = item.solution(pNode1, pNode5)
      XCTAssertEqual(r, nil)
      
    } while false
    
    repeat {
      // 公共结点是最后一个结点
      // 1 - 2 - 3 - 4 \
      //                7
      //         5 - 6 /
      let pNode1 = LKNode(1)
      let pNode2 = LKNode(2)
      let pNode3 = LKNode(3)
      let pNode4 = LKNode(4)
      let pNode5 = LKNode(5)
      let pNode6 = LKNode(6)
      let pNode7 = LKNode(7)
      LKNode.connect(pNode1, next: pNode2)
      LKNode.connect(pNode2, next: pNode3)
      LKNode.connect(pNode3, next: pNode4)
      LKNode.connect(pNode4, next: pNode7)
      LKNode.connect(pNode5, next: pNode6)
      LKNode.connect(pNode6, next: pNode7)
      let r = item.solution(pNode1, pNode5)
      XCTAssertEqual(r, pNode7)
      
    } while false
    
    repeat {
      // 公共结点是第一个结点
      // 1 - 2 - 3 - 4 - 5
      // 两个链表完全重合

      let pNode1 = LKNode(1)
      let pNode2 = LKNode(2)
      let pNode3 = LKNode(3)
      let pNode4 = LKNode(4)
      let pNode5 = LKNode(5)
      LKNode.connect(pNode1, next: pNode2)
      LKNode.connect(pNode2, next: pNode3)
      LKNode.connect(pNode3, next: pNode4)
      LKNode.connect(pNode4, next: pNode5)
      let r = item.solution(pNode1, pNode1)
      XCTAssertEqual(r, pNode1)
      
    } while false
    
    repeat {
      // 输入的两个链表有一个空链表
      let pNode1 = LKNode(1)
      let pNode2 = LKNode(2)
      let pNode3 = LKNode(3)
      let pNode4 = LKNode(4)
      let pNode5 = LKNode(5)
      LKNode.connect(pNode1, next: pNode2)
      LKNode.connect(pNode2, next: pNode3)
      LKNode.connect(pNode3, next: pNode4)
      LKNode.connect(pNode4, next: pNode5)
      let r = item.solution(nil, pNode1)
      XCTAssertEqual(r, nil)
      
    } while false
    
    repeat {
      // 输入的两个链表有一个空链表
      let r = item.solution(nil, nil)
      XCTAssertEqual(r, nil)
      
    } while false
  }
  
  
  func testMyFindKInSortedListCount() {
    let item = MyFindKInSortedListCount()
    repeat {
      // 查找的数字出现在数组的中间

      let list = [1, 2, 3, 3, 3, 3, 4, 5]
      let r =  item.find(list, 3)
      XCTAssertEqual(r, 4)
    } while false
    
    repeat {
      // 查找的数组出现在数组的开头

      let list = [1, 2, 3, 3, 3, 3, 4, 5]
      let r =  item.find(list, 3)
      XCTAssertEqual(r, 4)
    } while false
    
    
    repeat {
      // 查找的数组出现在数组的结尾

      let list = [1, 2, 3, 3, 3, 3]
      let r =  item.find(list, 3)
      XCTAssertEqual(r, 4)
    } while false
    
    repeat {
      // 查找的数字不存在

      let list = [1, 3, 3, 3, 3, 4, 5]
      let r =  item.find(list, 2)
      XCTAssertEqual(r, -1)
    } while false
    
    repeat {
      // 查找的数字比第一个数字还小，不存在

      let list = [1, 3, 3, 3, 3, 4, 5]
      let r =  item.find(list, 0)
      XCTAssertEqual(r, -1)
    } while false
    
    repeat {
      // 查找的数字比最后一个数字还大，不存在

      let list = [1, 3, 3, 3, 3, 4, 5]
      let r =  item.find(list, 6)
      XCTAssertEqual(r, -1)
    } while false
    
    repeat {
      // 数组中的数字从头到尾都是查找的数字

      let list = [3, 3, 3, 3]
      let r =  item.find(list, 3)
      XCTAssertEqual(r, 4)
    } while false
    
    repeat {
      // 数组中的数字从头到尾都是查找的数字

      let list = [3, 3, 3, 3]
      let r =  item.find(list, 4)
      XCTAssertEqual(r, -1)
    } while false
    
    repeat {
      // 数组中只有一个数字，不是查找的数字

      let list = [3]
      let r =  item.find(list, 4)
      XCTAssertEqual(r, -1)
    } while false
    
    
    repeat {
      // 数组中只有一个数字，是查找的数字

      let list = [3]
      let r =  item.find(list, 3)
      XCTAssertEqual(r, 1)
    } while false
    
    
    repeat {
      // 数组中只有一个数字，是查找的数字

      let list = [Int]()
      let r =  item.find(list, 0)
      XCTAssertEqual(r, -1)
    } while false
  }
  
  func testFindMissNumber() {
    let item = FindMissNumber()
    repeat {
      // 缺失的是第一个数字0

      let numbers = [1, 2, 3, 4, 5]
      let r = item.find(numbers)
      XCTAssertEqual(r, 0)
    } while false
    
    repeat {
      // 缺失的是最后一个数字

      let numbers = [0, 1, 2, 3, 4]
      let r = item.find(numbers)
      XCTAssertEqual(r, 5)
    } while false
    
    repeat {
      // 缺失的是中间某个数字0

      let numbers = [0, 1, 2, 4, 5]
      let r = item.find(numbers)
      XCTAssertEqual(r, 3)
    } while false
    
    
    repeat {
      // 数组中只有一个数字，缺失的是第一个数字0
      let numbers = [1]
      let r = item.find(numbers)
      XCTAssertEqual(r, 0)
      
    } while false
    
    repeat {
      // 数组中只有一个数字，缺失的是最后一个数字1
      let numbers = [0]
      let r = item.find(numbers)
      XCTAssertEqual(r, 1)
      
    } while false
    
    repeat {
      // 空数组
      let numbers = [Int]()
      let r = item.find(numbers)
      XCTAssertEqual(r, -1)
      
    } while false
  }
  
  func testMyNumberEqualIndex() {
    let item = MyNumberEqualIndex()
    repeat {
      let list = [-3, -1, 1, 3, 5]
      let r = item.find(list)
      XCTAssertEqual(r, 3)
    } while false
    
    repeat {
      let list = [0, 1, 3, 5, 6]
      let r = item.find(list)
      XCTAssertEqual(r, 0)
    } while false
    
    repeat {
      let list = [-1, 0, 1, 2, 4]
      let r = item.find(list)
      XCTAssertEqual(r, 4)
    } while false
    
    repeat {
      let list = [-1, 0, 1, 2, 5 ]
      let r = item.find(list)
      XCTAssertEqual(r, -1)
    } while false
    
    repeat {
      let list = [0]
      let r = item.find(list)
      XCTAssertEqual(r, 0)
    } while false
    
    repeat {
      let list = [10]
      let r = item.find(list)
      XCTAssertEqual(r, -1)
    } while false
    
    
    repeat {
      let list = [Int]()
      let r = item.find(list)
      XCTAssertEqual(r, -1)
    } while false
    
  }
  
  func testKthNodeInBSTree() {
    let item = KthNodeInBSTree()
    repeat {
      //            8
      //        6      10
      //       5 7    9  11
      
      let pNode8 = BTTree(value: 8)
      let pNode6 = BTTree(value: 6)
      let pNode10 = BTTree(value: 10)
      let pNode5 = BTTree(value: 5)
      let pNode7 = BTTree(value: 7)
      let pNode9 = BTTree(value: 9)
      let pNode11 = BTTree(value: 11)
      BTTree.connect(parent: pNode8, left: pNode6, right: pNode10)
      BTTree.connect(parent: pNode6, left: pNode5, right: pNode7)
      BTTree.connect(parent: pNode10, left: pNode9, right: pNode11)
      let TestA0 = item.node(pNode8, 0)
      XCTAssertEqual(TestA0, -1)
      let TestA1 = item.node(pNode8, 1)
      XCTAssertEqual(TestA1, 5)
      let TestA2 = item.node(pNode8, 2)
      XCTAssertEqual(TestA2, 6)
      let TestA3 = item.node(pNode8, 3)
      XCTAssertEqual(TestA3, 7)
      let TestA4 = item.node(pNode8, 4)
      XCTAssertEqual(TestA4, 8)
      let TestA5 = item.node(pNode8, 5)
      XCTAssertEqual(TestA5, 9)
      let TestA6 = item.node(pNode8, 6)
      XCTAssertEqual(TestA6, 10)
      let TestA7 = item.node(pNode8, 7)
      XCTAssertEqual(TestA7, 11)
      let TestA8 = item.node(pNode8, 8)
      XCTAssertEqual(TestA8, -1)

    } while false
    
    repeat {
      //               5
      //              /
      //             4
      //            /
      //           3
      //          /
      //         2
      //        /
      //       1
      let pNode5 = BTTree(value: 5)
      let pNode4 = BTTree(value: 4)
      let pNode3 = BTTree(value: 3)
      let pNode2 = BTTree(value: 2)
      let pNode1 = BTTree(value: 1)
      BTTree.connect(parent: pNode5, left: pNode4, right: nil)
      BTTree.connect(parent: pNode4, left: pNode3, right: nil)
      BTTree.connect(parent: pNode3, left: pNode2, right: nil)
      BTTree.connect(parent: pNode2, left: pNode1, right: nil)
      let TestA0 = item.node(pNode5, 0)
      XCTAssertEqual(TestA0, -1)
      let TestA1 = item.node(pNode5, 1)
      XCTAssertEqual(TestA1, 1)
      let TestA2 = item.node(pNode5, 2)
      XCTAssertEqual(TestA2, 2)
      let TestA3 = item.node(pNode5, 3)
      XCTAssertEqual(TestA3, 3)
      let TestA4 = item.node(pNode5, 4)
      XCTAssertEqual(TestA4, 4)
      let TestA5 = item.node(pNode5, 5)
      XCTAssertEqual(TestA5, 5)
      let TestA6 = item.node(pNode5, 6)
      XCTAssertEqual(TestA6, -1)

    } while false
    
    repeat {
      // 1
      //  \
      //   2
      //    \
      //     3
      //      \
      //       4
      //        \
      //         5
      let pNode1 = BTTree(value: 1)
      let pNode2 = BTTree(value: 2)
      let pNode3 = BTTree(value: 3)
      let pNode4 = BTTree(value: 4)
      let pNode5 = BTTree(value: 5)
      BTTree.connect(parent: pNode1, left: nil, right: pNode2)
      BTTree.connect(parent: pNode2, left: nil, right: pNode3)
      BTTree.connect(parent: pNode3, left: nil, right: pNode4)
      BTTree.connect(parent: pNode4, left: nil, right: pNode5)
      let TestA0 = item.node(pNode1, 0)
      XCTAssertEqual(TestA0, -1)
      let TestA1 = item.node(pNode1, 1)
      XCTAssertEqual(TestA1, 1)
      let TestA2 = item.node(pNode1, 2)
      XCTAssertEqual(TestA2, 2)
      let TestA3 = item.node(pNode1, 3)
      XCTAssertEqual(TestA3, 3)
      let TestA4 = item.node(pNode1, 4)
      XCTAssertEqual(TestA4, 4)
      let TestA5 = item.node(pNode1, 5)
      XCTAssertEqual(TestA5, 5)
      let TestA6 = item.node(pNode1, 6)
      XCTAssertEqual(TestA6, -1)

    } while false
    
    repeat {
      // There is only one node in a tree
      let pNode1 = BTTree(value: 1)
      let TestA0 = item.node(pNode1, 0)
      XCTAssertEqual(TestA0, -1)
      let TestA1 = item.node(pNode1, 1)
      XCTAssertEqual(TestA1, 1)
      let TestA2 = item.node(pNode1, 2)
      XCTAssertEqual(TestA2, -1)


    } while false
    
    repeat {
       // empty tree
       let TestA0 = item.node(nil, 0)
       XCTAssertEqual(TestA0, -1)
       let TestA1 = item.node(nil, 1)
       XCTAssertEqual(TestA1, -1)
     } while false
    
  }
  
  func testDeepTree1() {
    let item = DeepTree1()
    repeat {
      //            1
      //         /      \
      //        2        3
      //       /\         \
      //      4  5         6
      //        /
      //       7
      let pNode1 = BTTree(value: 1)
      let pNode2 = BTTree(value: 2)
      let pNode3 = BTTree(value: 3)
      let pNode4 = BTTree(value: 4)
      let pNode5 = BTTree(value: 5)
      let pNode6 = BTTree(value: 6)
      let pNode7 = BTTree(value: 7)
      BTTree.connect(parent: pNode1, left: pNode2, right: pNode3)
      BTTree.connect(parent: pNode2, left: pNode4, right: pNode5)
      BTTree.connect(parent: pNode3, left: nil, right: pNode6)
      BTTree.connect(parent: pNode5, left: pNode7, right: nil)
      let result: Int = item.deep(pNode1)
      XCTAssertEqual(result, 4)
    } while false
    
    repeat {
      //               1
      //              /
      //             2
      //            /
      //           3
      //          /
      //         4
      //        /
      //       5
      let pNode1 = BTTree(value: 1)
      let pNode2 = BTTree(value: 2)
      let pNode3 = BTTree(value: 3)
      let pNode4 = BTTree(value: 4)
      let pNode5 = BTTree(value: 5)
      BTTree.connect(parent: pNode1, left: pNode2, right: nil)
      BTTree.connect(parent: pNode2, left: pNode3, right: nil)
      BTTree.connect(parent: pNode3, left: pNode4, right: nil)
      BTTree.connect(parent: pNode4, left: pNode5, right: nil)
      let result: Int = item.deep(pNode1)
      XCTAssertEqual(result, 5)
      
    } while false
    
    repeat {
      // 1
      //  \
      //   2
      //    \
      //     3
      //      \
      //       4
      //        \
      //         5

      let pNode1 = BTTree(value: 1)
      let pNode2 = BTTree(value: 2)
      let pNode3 = BTTree(value: 3)
      let pNode4 = BTTree(value: 4)
      let pNode5 = BTTree(value: 5)
      BTTree.connect(parent: pNode1, left: nil, right: pNode2)
      BTTree.connect(parent: pNode2, left: nil, right: pNode3)
      BTTree.connect(parent: pNode3, left: nil, right: pNode4)
      BTTree.connect(parent: pNode4, left: nil, right: pNode5)
      let result: Int = item.deep(pNode1)
      XCTAssertEqual(result, 5)

    } while false
    
    repeat {
      // 树中只有1个结点

      let pNode1 = BTTree(value: 1)
      let result: Int = item.deep(pNode1)
      XCTAssertEqual(result, 1)

    } while false
    
    repeat {
      // 树中没有结点

      let result: Int = item.deep(nil)
      XCTAssertEqual(result, 0)

    } while false
    
    
  }
  
  func testDeepTree2() {
    let item = DeepTree2()
    repeat {
      //            1
      //         /      \
      //        2        3
      //       /\         \
      //      4  5         6
      //        /
      //       7
      let pNode1 = BTTree(value: 1)
      let pNode2 = BTTree(value: 2)
      let pNode3 = BTTree(value: 3)
      let pNode4 = BTTree(value: 4)
      let pNode5 = BTTree(value: 5)
      let pNode6 = BTTree(value: 6)
      let pNode7 = BTTree(value: 7)
      BTTree.connect(parent: pNode1, left: pNode2, right: pNode3)
      BTTree.connect(parent: pNode2, left: pNode4, right: pNode5)
      BTTree.connect(parent: pNode3, left: nil, right: pNode6)
      BTTree.connect(parent: pNode5, left: pNode7, right: nil)
      let result: Int = item.deep(pNode1)
      XCTAssertEqual(result, 4)
    } while false
    
    repeat {
      //               1
      //              /
      //             2
      //            /
      //           3
      //          /
      //         4
      //        /
      //       5
      let pNode1 = BTTree(value: 1)
      let pNode2 = BTTree(value: 2)
      let pNode3 = BTTree(value: 3)
      let pNode4 = BTTree(value: 4)
      let pNode5 = BTTree(value: 5)
      BTTree.connect(parent: pNode1, left: pNode2, right: nil)
      BTTree.connect(parent: pNode2, left: pNode3, right: nil)
      BTTree.connect(parent: pNode3, left: pNode4, right: nil)
      BTTree.connect(parent: pNode4, left: pNode5, right: nil)
      let result: Int = item.deep(pNode1)
      XCTAssertEqual(result, 5)
      
    } while false
    
    repeat {
      // 1
      //  \
      //   2
      //    \
      //     3
      //      \
      //       4
      //        \
      //         5

      let pNode1 = BTTree(value: 1)
      let pNode2 = BTTree(value: 2)
      let pNode3 = BTTree(value: 3)
      let pNode4 = BTTree(value: 4)
      let pNode5 = BTTree(value: 5)
      BTTree.connect(parent: pNode1, left: nil, right: pNode2)
      BTTree.connect(parent: pNode2, left: nil, right: pNode3)
      BTTree.connect(parent: pNode3, left: nil, right: pNode4)
      BTTree.connect(parent: pNode4, left: nil, right: pNode5)
      let result: Int = item.deep(pNode1)
      XCTAssertEqual(result, 5)

    } while false
    
    repeat {
      // 树中只有1个结点

      let pNode1 = BTTree(value: 1)
      let result: Int = item.deep(pNode1)
      XCTAssertEqual(result, 1)

    } while false
    
    repeat {
      // 树中没有结点

      let result: Int = item.deep(nil)
      XCTAssertEqual(result, 0)

    } while false
    
    
  }
  
  func testDeepTree3() {
    let item = DeepTree3()
    repeat {
      //            1
      //         /      \
      //        2        3
      //       /\         \
      //      4  5         6
      //        /
      //       7
      let pNode1 = BTTree(value: 1)
      let pNode2 = BTTree(value: 2)
      let pNode3 = BTTree(value: 3)
      let pNode4 = BTTree(value: 4)
      let pNode5 = BTTree(value: 5)
      let pNode6 = BTTree(value: 6)
      let pNode7 = BTTree(value: 7)
      BTTree.connect(parent: pNode1, left: pNode2, right: pNode3)
      BTTree.connect(parent: pNode2, left: pNode4, right: pNode5)
      BTTree.connect(parent: pNode3, left: nil, right: pNode6)
      BTTree.connect(parent: pNode5, left: pNode7, right: nil)
      let result: Int = item.deep(pNode1)
      XCTAssertEqual(result, 4)
    } while false
    
    repeat {
      //               1
      //              /
      //             2
      //            /
      //           3
      //          /
      //         4
      //        /
      //       5
      let pNode1 = BTTree(value: 1)
      let pNode2 = BTTree(value: 2)
      let pNode3 = BTTree(value: 3)
      let pNode4 = BTTree(value: 4)
      let pNode5 = BTTree(value: 5)
      BTTree.connect(parent: pNode1, left: pNode2, right: nil)
      BTTree.connect(parent: pNode2, left: pNode3, right: nil)
      BTTree.connect(parent: pNode3, left: pNode4, right: nil)
      BTTree.connect(parent: pNode4, left: pNode5, right: nil)
      let result: Int = item.deep(pNode1)
      XCTAssertEqual(result, 5)
      
    } while false
    
    repeat {
      // 1
      //  \
      //   2
      //    \
      //     3
      //      \
      //       4
      //        \
      //         5

      let pNode1 = BTTree(value: 1)
      let pNode2 = BTTree(value: 2)
      let pNode3 = BTTree(value: 3)
      let pNode4 = BTTree(value: 4)
      let pNode5 = BTTree(value: 5)
      BTTree.connect(parent: pNode1, left: nil, right: pNode2)
      BTTree.connect(parent: pNode2, left: nil, right: pNode3)
      BTTree.connect(parent: pNode3, left: nil, right: pNode4)
      BTTree.connect(parent: pNode4, left: nil, right: pNode5)
      let result: Int = item.deep(pNode1)
      XCTAssertEqual(result, 5)

    } while false
    
    repeat {
      // 树中只有1个结点

      let pNode1 = BTTree(value: 1)
      let result: Int = item.deep(pNode1)
      XCTAssertEqual(result, 1)

    } while false
    
    repeat {
      // 树中没有结点

      let result: Int = item.deep(nil)
      XCTAssertEqual(result, 0)

    } while false
    
    
  }
  
  func testBalancedBTree1() {
    let item = BalancedBTree1()
    repeat {
      // 完全二叉树
      //             1
      //         /      \
      //        2        3
      //       /\       / \
      //      4  5     6   7
      let pNode1 = BTTree(value: 1)
      let pNode2 = BTTree(value: 2)
      let pNode3 = BTTree(value: 3)
      let pNode4 = BTTree(value: 4)
      let pNode5 = BTTree(value: 5)
      let pNode6 = BTTree(value: 6)
      let pNode7 = BTTree(value: 7)
      BTTree.connect(parent: pNode1, left: pNode2, right: pNode3)
      BTTree.connect(parent: pNode2, left: pNode4, right: pNode5)
      BTTree.connect(parent: pNode3, left: pNode6, right: pNode7)
      let result: Bool = item.isBalance(pNode1)
      XCTAssertEqual(result, true)
    } while false
    
    
    repeat {
      // 不是完全二叉树，但是平衡二叉树
      //             1
      //         /      \
      //        2        3
      //       /\         \
      //      4  5         6
      //        /
      //       7
      let pNode1 = BTTree(value: 1)
      let pNode2 = BTTree(value: 2)
      let pNode3 = BTTree(value: 3)
      let pNode4 = BTTree(value: 4)
      let pNode5 = BTTree(value: 5)
      let pNode6 = BTTree(value: 6)
      let pNode7 = BTTree(value: 7)
      BTTree.connect(parent: pNode1, left: pNode2, right: pNode3)
      BTTree.connect(parent: pNode2, left: pNode4, right: pNode5)
      BTTree.connect(parent: pNode3, left: nil, right: pNode6)
      BTTree.connect(parent: pNode5, left: pNode7, right: nil)
      let result: Bool = item.isBalance(pNode1)
      XCTAssertEqual(result, true)
    } while false
    
    repeat {
      // 不是平衡二叉树
      //             1
      //         /      \
      //        2        3
      //       /\
      //      4  5
      //        /
      //       6
      let pNode1 = BTTree(value: 1)
      let pNode2 = BTTree(value: 2)
      let pNode3 = BTTree(value: 3)
      let pNode4 = BTTree(value: 4)
      let pNode5 = BTTree(value: 5)
      let pNode6 = BTTree(value: 6)
      BTTree.connect(parent: pNode1, left: pNode2, right: pNode3)
      BTTree.connect(parent: pNode2, left: pNode4, right: pNode5)
      BTTree.connect(parent: pNode5, left: pNode6, right: nil)
      let result: Bool = item.isBalance(pNode1)
      XCTAssertEqual(result, false)

    } while false
    
    repeat {
      //               1
      //              /
      //             2
      //            /
      //           3
      //          /
      //         4
      //        /
      //       5
      let pNode1 = BTTree(value: 1)
      let pNode2 = BTTree(value: 2)
      let pNode3 = BTTree(value: 3)
      let pNode4 = BTTree(value: 4)
      let pNode5 = BTTree(value: 5)
      BTTree.connect(parent: pNode1, left: pNode2, right: nil)
      BTTree.connect(parent: pNode2, left: pNode3, right: nil)
      BTTree.connect(parent: pNode3, left: pNode4, right: nil)
      BTTree.connect(parent: pNode4, left: pNode5, right: nil)
      let result: Bool = item.isBalance(pNode1)
      XCTAssertEqual(result, false)

    } while false
    
    repeat {
      // 1
      //  \
      //   2
      //    \
      //     3
      //      \
      //       4
      //        \
      //         5
      let pNode1 = BTTree(value: 1)
      let pNode2 = BTTree(value: 2)
      let pNode3 = BTTree(value: 3)
      let pNode4 = BTTree(value: 4)
      let pNode5 = BTTree(value: 5)
      BTTree.connect(parent: pNode1, left: nil, right: pNode2)
      BTTree.connect(parent: pNode2, left: nil, right: pNode3)
      BTTree.connect(parent: pNode3, left: nil, right: pNode4)
      BTTree.connect(parent: pNode4, left: nil, right: pNode5)
      let result: Bool = item.isBalance(pNode1)
      XCTAssertEqual(result, false)

    } while false
    
    repeat {
      // 树中只有1个结点
      let pNode1 = BTTree(value: 1)
      let result: Bool = item.isBalance(pNode1)
      XCTAssertEqual(result, true)
      
    } while false
    
    repeat {
      // 树中没有结点
      let result: Bool = item.isBalance(nil)
      XCTAssertEqual(result, true)
    } while false

  }
  
  func testBalancedBTree2() {
    let item = BalancedBTree2()
    repeat {
      // 完全二叉树
      //             1
      //         /      \
      //        2        3
      //       /\       / \
      //      4  5     6   7
      let pNode1 = BTTree(value: 1)
      let pNode2 = BTTree(value: 2)
      let pNode3 = BTTree(value: 3)
      let pNode4 = BTTree(value: 4)
      let pNode5 = BTTree(value: 5)
      let pNode6 = BTTree(value: 6)
      let pNode7 = BTTree(value: 7)
      BTTree.connect(parent: pNode1, left: pNode2, right: pNode3)
      BTTree.connect(parent: pNode2, left: pNode4, right: pNode5)
      BTTree.connect(parent: pNode3, left: pNode6, right: pNode7)
      let result: Bool = item.isBalance(pNode1)
      XCTAssertEqual(result, true)
    } while false
    
    
    repeat {
      // 不是完全二叉树，但是平衡二叉树
      //             1
      //         /      \
      //        2        3
      //       /\         \
      //      4  5         6
      //        /
      //       7
      let pNode1 = BTTree(value: 1)
      let pNode2 = BTTree(value: 2)
      let pNode3 = BTTree(value: 3)
      let pNode4 = BTTree(value: 4)
      let pNode5 = BTTree(value: 5)
      let pNode6 = BTTree(value: 6)
      let pNode7 = BTTree(value: 7)
      BTTree.connect(parent: pNode1, left: pNode2, right: pNode3)
      BTTree.connect(parent: pNode2, left: pNode4, right: pNode5)
      BTTree.connect(parent: pNode3, left: nil, right: pNode6)
      BTTree.connect(parent: pNode5, left: pNode7, right: nil)
      let result: Bool = item.isBalance(pNode1)
      XCTAssertEqual(result, true)
    } while false
    
    repeat {
      // 不是平衡二叉树
      //             1
      //         /      \
      //        2        3
      //       /\
      //      4  5
      //        /
      //       6
      let pNode1 = BTTree(value: 1)
      let pNode2 = BTTree(value: 2)
      let pNode3 = BTTree(value: 3)
      let pNode4 = BTTree(value: 4)
      let pNode5 = BTTree(value: 5)
      let pNode6 = BTTree(value: 6)
      BTTree.connect(parent: pNode1, left: pNode2, right: pNode3)
      BTTree.connect(parent: pNode2, left: pNode4, right: pNode5)
      BTTree.connect(parent: pNode5, left: pNode6, right: nil)
      let result: Bool = item.isBalance(pNode1)
      XCTAssertEqual(result, false)
      
    } while false
    
    repeat {
      //               1
      //              /
      //             2
      //            /
      //           3
      //          /
      //         4
      //        /
      //       5
      let pNode1 = BTTree(value: 1)
      let pNode2 = BTTree(value: 2)
      let pNode3 = BTTree(value: 3)
      let pNode4 = BTTree(value: 4)
      let pNode5 = BTTree(value: 5)
      BTTree.connect(parent: pNode1, left: pNode2, right: nil)
      BTTree.connect(parent: pNode2, left: pNode3, right: nil)
      BTTree.connect(parent: pNode3, left: pNode4, right: nil)
      BTTree.connect(parent: pNode4, left: pNode5, right: nil)
      let result: Bool = item.isBalance(pNode1)
      XCTAssertEqual(result, false)
      
    } while false
    
    repeat {
      // 1
      //  \
      //   2
      //    \
      //     3
      //      \
      //       4
      //        \
      //         5
      let pNode1 = BTTree(value: 1)
      let pNode2 = BTTree(value: 2)
      let pNode3 = BTTree(value: 3)
      let pNode4 = BTTree(value: 4)
      let pNode5 = BTTree(value: 5)
      BTTree.connect(parent: pNode1, left: nil, right: pNode2)
      BTTree.connect(parent: pNode2, left: nil, right: pNode3)
      BTTree.connect(parent: pNode3, left: nil, right: pNode4)
      BTTree.connect(parent: pNode4, left: nil, right: pNode5)
      let result: Bool = item.isBalance(pNode1)
      XCTAssertEqual(result, false)
      
    } while false
    
    repeat {
      // 树中只有1个结点
      let pNode1 = BTTree(value: 1)
      let result: Bool = item.isBalance(pNode1)
      XCTAssertEqual(result, true)
      
    } while false
    
    repeat {
      // 树中没有结点
      let result: Bool = item.isBalance(nil)
      XCTAssertEqual(result, true)
    } while false
    
  }
  
  func testFindNumsAppearOnce() {
    let item = FindNumsAppearOnce()
    repeat {
      let list = [2, 4, 3, 6, 3, 2, 5, 5]
      var result: [Int] = item.find(list)
      result = result.sorted()
      XCTAssertEqual(result, [4,6])
    } while false
    
    repeat {
      let list = [4,6]
      var result: [Int] = item.find(list)
      result = result.sorted()
      XCTAssertEqual(result, [4,6])
    } while false
    
    repeat {
      let list = [4, 6, 1, 1, 1, 1]
      var result: [Int] = item.find(list)
      result = result.sorted()
      XCTAssertEqual(result, [4,6])
    } while false
  }
  
  func testFindNumsAppearOnce1() {
    let item = FindNumsAppearOnce1()
    repeat {
      let list = [1, 1, 2, 2, 2, 1, 3]
      var result: [Int] = item.find(list)
      result = result.sorted()
      XCTAssertEqual(result, [3])
    } while false
    
    repeat {
      let list = [4, 3, 3, 2, 2, 2, 3]
      var result: [Int] = item.find(list)
      result = result.sorted()
      XCTAssertEqual(result, [4])
    } while false
    
    repeat {
      let list = [4, 4, 1, 1, 1, 7, 4]
      var result: [Int] = item.find(list)
      result = result.sorted()
      XCTAssertEqual(result, [7])
    } while false
    
    
    repeat {
      let list = [-10, 214, 214, 214]
      var result: [Int] = item.find(list)
      result = result.sorted()
      XCTAssertEqual(result, [-10])
    } while false
    
    repeat {
      let list = [-209, 3467, -209, -209]
      var result: [Int] = item.find(list)
      result = result.sorted()
      XCTAssertEqual(result, [3467])
    } while false
    
    repeat {
      let list = [1024, -1025, 1024, -1025, 1024, -1025, 1023]
      var result: [Int] = item.find(list)
      result = result.sorted()
      XCTAssertEqual(result, [1023])
    } while false
    
    repeat {
      let list = [ -1024, -1024, -1024, -1023]
      var result: [Int] = item.find(list)
      result = result.sorted()
      XCTAssertEqual(result, [-1023])
    } while false
    
    repeat {
      let list = [ -23, 0, 214, -23, 214, -23, 214]
      var result: [Int] = item.find(list)
      result = result.sorted()
      XCTAssertEqual(result, [0])
    } while false
    
    repeat {
      let list = [  0, 3467, 0, 0, 0, 0, 0, 0]
      var result: [Int] = item.find(list)
      result = result.sorted()
      XCTAssertEqual(result, [3467])
    } while false
  }
  
  func testFindNumsAppearOnce2() {
    let item = FindNumsAppearOnce2()
    repeat {
      let list = [1, 1, 2, 2, 2, 1, 3]
      var result: [Int] = item.find(list)
      result = result.sorted()
      XCTAssertEqual(result, [3])
    } while false
    
    repeat {
      let list = [4, 3, 3, 2, 2, 2, 3]
      var result: [Int] = item.find(list)
      result = result.sorted()
      XCTAssertEqual(result, [4])
    } while false
    
    repeat {
      let list = [4, 4, 1, 1, 1, 7, 4]
      var result: [Int] = item.find(list)
      result = result.sorted()
      XCTAssertEqual(result, [7])
    } while false
    
    
    repeat {
      let list = [-10, 214, 214, 214]
      var result: [Int] = item.find(list)
      result = result.sorted()
      XCTAssertEqual(result, [-10])
    } while false
    
    repeat {
      let list = [-209, 3467, -209, -209]
      var result: [Int] = item.find(list)
      result = result.sorted()
      XCTAssertEqual(result, [3467])
    } while false
    
    repeat {
      let list = [1024, -1025, 1024, -1025, 1024, -1025, 1023]
      var result: [Int] = item.find(list)
      result = result.sorted()
      XCTAssertEqual(result, [1023])
    } while false
    
    repeat {
      let list = [ -1024, -1024, -1024, -1023]
      var result: [Int] = item.find(list)
      result = result.sorted()
      XCTAssertEqual(result, [-1023])
    } while false
    
    repeat {
      let list = [ -23, 0, 214, -23, 214, -23, 214]
      var result: [Int] = item.find(list)
      result = result.sorted()
      XCTAssertEqual(result, [0])
    } while false
    
    repeat {
      let list = [  0, 3467, 0, 0, 0, 0, 0, 0]
      var result: [Int] = item.find(list)
      result = result.sorted()
      XCTAssertEqual(result, [3467])
    } while false
  }
  
  func testMyNumberSum() {
    let item = MyNumberSum()
    repeat {
      let list = [1, 2, 4, 7, 11, 15]
      let result = item.find(list, 15)
      XCTAssertEqual(result, [4,11])
    } while false
    
    repeat {
      // 存在和为s的两个数字，这两个数字位于数组的两端
      let list = [1, 2, 4, 7, 11, 16]
      let result = item.find(list, 17)
      XCTAssertEqual(result, [1,16])
    } while false
    
    
    repeat {
      // 存在和为s的两个数字，这两个数字位于数组的两端
      let list = [1, 2, 4, 7, 11, 16]
      let result = item.find(list, 10)
      XCTAssertEqual(result, [Int]())
    } while false

    
    repeat {
      // 存在和为s的两个数字，这两个数字位于数组的两端
      let list = [Int]()
      let result = item.find(list, 10)
      XCTAssertEqual(result, [Int]())
    } while false
    
  }
  func testFindContinuousSequence() {
    let item = FindContinuousSequence()
    repeat {
      let result = item.find(1)
      XCTAssertEqual(result, [[Int]]())
      
    } while false
    repeat {
      let result = item.find(3)
      XCTAssertEqual(result, [[1,2]])
      
    } while false
    repeat {
      let result = item.find(4)
      XCTAssertEqual(result, [[Int]]())
      
    } while false
    repeat {
      let result = item.find(9)
      XCTAssertEqual(result, [[2,3,4],[4,5]])
    } while false
    
    repeat {
      let result = item.find(15)
      XCTAssertEqual(result, [[1, 2, 3, 4, 5], [4, 5, 6], [7, 8]])
    } while false
    
    repeat {
      let result = item.find(100)
      XCTAssertEqual(result, [[9, 10, 11, 12, 13, 14, 15, 16], [18, 19, 20, 21, 22]])
    } while false
  }
  
  func testReverseSentence() {
    let item = ReverseSentence()
    repeat {
      // 功能测试，句子中有多个单词
      let s = "I am a student."
      let result = item.reverse(s)
      XCTAssertEqual(result, "student. a am I")
    } while false
    
    repeat {
      // 功能测试，句子中只有一个单词
      let s = "  Wonderful    "
      let result = item.reverse(s)
      XCTAssertEqual(result, "    Wonderful  ")
    } while false
    repeat {
      // 功能测试，句子中只有一个单词
      
      let s = "Wonderful "
      let result = item.reverse(s)
      XCTAssertEqual(result, " Wonderful")
    } while false
    repeat {
      // 功能测试，句子中只有一个单词

      let s = "Wonderful"
      let result = item.reverse(s)
      XCTAssertEqual(result, "Wonderful")
    } while false
    
    repeat {
      // 鲁棒性测试
      let s = ""
      let result = item.reverse(s)
      XCTAssertEqual(result, "")
    } while false
    
    
  }
  
  func testLeftRotateString() {
    let item = LeftRotateString()
    repeat {
      // 功能测试

      let s = "abcdefg"
      let r = item.rotate(s, 2)
      XCTAssertEqual(r, "cdefgab")
    } while false
    
    repeat {
      // 边界值测试

      let s = "abcdefg"
      let r = item.rotate(s, 1)
      XCTAssertEqual(r, "bcdefga")
    } while false
    
    repeat {
      // 边界值测试

      let s = "abcdefg"
      let r = item.rotate(s, 6)
      XCTAssertEqual(r, "gabcdef")
    } while false
    
    repeat {
      // 鲁棒性测试

      let s = ""
      let r = item.rotate(s, 6)
      XCTAssertEqual(r, "")
    } while false
    
    repeat {
      // 鲁棒性测试

      let s = "abcdefg"
      let r = item.rotate(s, 0)
      XCTAssertEqual(r, "abcdefg")
    } while false
    
    repeat {
      // 鲁棒性测试

      let s = "abcdefg"
      let r = item.rotate(s, 7)
      XCTAssertEqual(r, "abcdefg")
    } while false
    
  }
  
  func testSlideWindow() {
    let item = SlideWindow()
    repeat {
      let list = [2, 3, 4, 2, 6, 2, 5, 1]
      let r = item.slideMaxValues(list, 3)
      XCTAssertEqual(r, [4, 4, 6, 6, 6, 5])
    } while false
    
    repeat {
      let list = [1, 3, -1, -3, 5, 3, 6, 7 ]
      let r = item.slideMaxValues(list, 3)
      XCTAssertEqual(r, [3, 3, 5, 5, 6, 7 ])
    } while false
    
    repeat {
      let list = [1, 3, 5, 7, 9, 11, 13, 15 ]
      let r = item.slideMaxValues(list, 4)
      XCTAssertEqual(r, [7, 9, 11, 13, 15])
    } while false
    
    repeat {
      let list = [16, 14, 12, 10, 8, 6, 4 ]
      let r = item.slideMaxValues(list, 5)
      XCTAssertEqual(r, [16, 14, 12])
    } while false
    
    repeat {
      let list = [10, 14, 12, 11]
      let r = item.slideMaxValues(list, 5)
      XCTAssertEqual(r, [Int]())
    } while false
    
    repeat {
      let list = [10, 14, 12, 11 ]
      let r = item.slideMaxValues(list, 4)
      XCTAssertEqual(r, [14])
    } while false
    
    repeat {
      let list = [10, 14, 12, 11 ]
      let r = item.slideMaxValues(list, 0)
      XCTAssertEqual(r, [Int]())
    } while false
    
    repeat {
      let list = [10, 14, 12, 11 ]
      let r = item.slideMaxValues(list, 10)
      XCTAssertEqual(r, [Int]())
    } while false
    
    repeat {
      let list = [Int]()
      let r = item.slideMaxValues(list, 10)
      XCTAssertEqual(r, [Int]())
    } while false
  }
  
  func testNumbersStreamMax() {
    let item = NumbersStreamMax()
    repeat {
      
      // {2}

      item.append(2)
      XCTAssertEqual(try item.currentMax(), 2)
      
      // {2, 3}

      item.append(3)
      XCTAssertEqual(try item.currentMax(), 3)
      
      // {2, 3, 4}
      item.append(4)
      XCTAssertEqual(try item.currentMax(), 4)


      // {2, 3, 4, 2}
      item.append(2)
      XCTAssertEqual(try item.currentMax(), 4)
      
      // {3, 4, 2}
      try? item.removeFront();
      XCTAssertEqual(try item.currentMax(), 4)

      // {4, 2}
      try? item.removeFront();
      XCTAssertEqual(try item.currentMax(), 4)

      // {2}
      try? item.removeFront();
      XCTAssertEqual(try item.currentMax(), 2)

      // {2, 6}
      item.append(6)
      XCTAssertEqual(try item.currentMax(), 6)

      // {2, 6, 2}
      item.append(2)
      XCTAssertEqual(try item.currentMax(), 6)

      // {2, 6, 2, 5}
      item.append(5)
      XCTAssertEqual(try item.currentMax(), 6)

      // {6, 2, 5}
      try? item.removeFront()
      XCTAssertEqual(try item.currentMax(), 6)

      // {2, 5}
      try? item.removeFront()
      XCTAssertEqual(try item.currentMax(), 5)

      // {5}
      try? item.removeFront()
      XCTAssertEqual(try item.currentMax(), 5)

      // {5, 1}
      item.append(1)
      XCTAssertEqual(try item.currentMax(), 5)


    } while false
  }
  
  func testMyProbability() {
    let item = MyProbability()
    repeat {
      let n = 1
      do {
        let result = try item.get(n)
        print(result)
      } catch {
        
      }
      
      print("--------")
    } while false
    
    repeat {
      let n = 2
      do {
        let result = try item.get(n)
        print(result)
      } catch {
        
      }
      
      print("--------")
    } while false
    
    repeat {
      let n = 3
      do {
        let result = try item.get(n)
        print(result)
      } catch {
        
      }
      
      print("--------")
    } while false
    
    repeat {
      let n = 4
      do {
        let result = try item.get(n)
        print(result)
      } catch {
        
      }
      
      print("--------")
    } while false
    
  }
  
  func testContinuousCard() {
    let item = ContinuousCard()
    repeat {
      let list = [1, 3, 2, 5, 4]
      let r = item.isContinuous(list)
      XCTAssertEqual(r, true)
    } while false
    
    repeat {
      let list = [1, 3, 2, 6, 4]
      let r = item.isContinuous(list)
      XCTAssertEqual(r, false)
    } while false
    
    repeat {
      let list = [0, 3, 2, 6, 4]
      let r = item.isContinuous(list)
      XCTAssertEqual(r, true)
    } while false
    
    repeat {
      let list = [0, 3, 1, 6, 4]
      let r = item.isContinuous(list)
      XCTAssertEqual(r, false)
    } while false
    
    repeat {
      let list = [1, 3, 0, 5, 0]
      let r = item.isContinuous(list)
      XCTAssertEqual(r, true)
    } while false
    
    repeat {
      let list = [1, 3, 0, 7, 0 ]
      let r = item.isContinuous(list)
      XCTAssertEqual(r, false)
    } while false
    
    repeat {
      let list = [1, 0, 0, 5, 0]
      let r = item.isContinuous(list)
      XCTAssertEqual(r, true)
    } while false
    
    repeat {
      let list = [1, 0, 0, 7, 0]
      let r = item.isContinuous(list)
      XCTAssertEqual(r, false)
    } while false
    
    repeat {
      let list = [3, 0, 0, 0, 0]
      let r = item.isContinuous(list)
      XCTAssertEqual(r, true)
    } while false
    
    repeat {
      let list = [0, 0, 0, 0, 0]
      let r = item.isContinuous(list)
      XCTAssertEqual(r, true)
    } while false
    
    repeat {
      let list = [0, 1, 0, 1, 0]
      let r = item.isContinuous(list)
      XCTAssertEqual(r, false)
    } while false
    
    repeat {
      let list = [Int]()
      let r = item.isContinuous(list)
      XCTAssertEqual(r, false)
    } while false
  }
  
  func testLastRemaining() {
    let item = LastRemaining()
    repeat {
      let r = item.remain(4000, 997)
      XCTAssertEqual(r, 1027)
    } while false
    repeat {
      let r = item.remain(0, 0)
      XCTAssertEqual(r, -1)
    } while false
    repeat {
      let r = item.remain(6, 6)
      XCTAssertEqual(r, 3)
    } while false
    repeat {
      let r = item.remain(6, 7)
      XCTAssertEqual(r, 4)
    } while false
    repeat {
      let r = item.remain(5, 2)
      XCTAssertEqual(r, 2)
    } while false
    repeat {
      let r = item.remain(5, 3)
      XCTAssertEqual(r, 3)
    } while false
  }
  
  func testStackMaxProfit() {
    let item = StackMaxProfit()
    
    repeat {
      // 价格递减
      let list = [16, 11, 7, 4, 2, 1 ]
      let r = item.profit(list)
      XCTAssertEqual(r, -1)
    } while false
    
    repeat {
      let list = [Int]()
      let r = item.profit(list)
      XCTAssertEqual(r, 0)
    } while false
    
    repeat {
      let list = [ 2,4 ]
      let r = item.profit(list)
      XCTAssertEqual(r, 2)
    } while false
    
    repeat {
      let list = [ 9, 11, 5, 7, 16, 1, 4, 2 ]
      let r = item.profit(list)
      XCTAssertEqual(r, 11)
    } while false
    
    repeat {
      // 价格全部相同
      let list = [16, 16, 16, 16, 16]
      let r = item.profit(list)
      XCTAssertEqual(r, 0)
    } while false
    
    
    
    repeat {
      // 价格递增

      let list = [1, 2, 4, 7, 11, 16]
      let r = item.profit(list)
      XCTAssertEqual(r, 15)
    } while false
    repeat {
      let list = [4, 1, 3, 2, 5]
      let r = item.profit(list)
      XCTAssertEqual(r, 4)
    } while false
  }
  
//  MARK: - 辅助
  func testBitShift() {
    let item = [1,0,2,3]
    for (idx, v) in item.enumerated() {
      print("idx = \(idx), v = \(v)")
    }
    
    repeat {
      let item = [1,1,1,1]
      for (idx, v) in item.enumerated() {
        print("idx = \(idx), v = \(v)")
      }
      
      var r = 0
      for i in 0 ..< item.count {
        r <<= 1
        r |= item[item.count - 1 - i]
      }
      print(r)
      
    } while false
    
    repeat {
      let item = [1,0,0,0]
      for (idx, v) in item.enumerated() {
        print("idx = \(idx), v = \(v)")
      }
      
      var r = 0
      for i in 0 ..< item.count {
        r <<= 1
        r |= item[item.count - 1 - i]
      }
      print(r)
      
    } while false
    
    repeat {
      let item = [0,1,0,0]
      for (idx, v) in item.enumerated() {
        print("idx = \(idx), v = \(v)")
      }
      
      var r = 0
      for i in 0 ..< item.count {
        r <<= 1
        r |= item[item.count - 1 - i]
      }
      print(r)
      
    } while false
    
    repeat {
      // 基于能进行的位移次数
      let item = [0,0,1,0]
      for (idx, v) in item.enumerated() {
        print("idx = \(idx), v = \(v)")
      }
      
      var r = 0
      for i in (0 ..< item.count).reversed() {
        r <<= 1
        r |= item[i]
      }
      print(r)
    } while false
    
    
  }
  func testMyHeap() {
    repeat {
      let list = [3, 2, 8, 5, 0]
      // 小顶堆
      var item = MyHeap(elements: list, priorityFunction: <)
      
      let r1 = item.dequeue()
      let r2 = item.dequeue()

      XCTAssert(r1 == 0)
      XCTAssert(r2 == 2)

    } while false

    repeat {
      let list = [3, 2, 8, 5, 0]
      // 大顶堆
      var item = MyHeap(elements: list, priorityFunction: >)
      
      let r1 = item.dequeue()
      let r2 = item.dequeue()

      XCTAssert(r1 == 8)
      XCTAssert(r2 == 5)

    } while false

    
    repeat {
      let list = [3]
      // 大顶堆
      var item = MyHeap(elements: list, priorityFunction: <)
      let r1 = item.dequeue()
      XCTAssert(r1 == 3)
    } while false
    
    repeat {
      let list = [2,0]
      // 大顶堆
      var item = MyHeap(elements: list, priorityFunction: <)
      let r1 = item.dequeue()
      XCTAssert(r1 == 0)
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
  
  func testRandom() {
    let range = 0 ... 2
    for _ in 0 ..< 100 {
      let r1 = range.randomElement()
      print(r1)
    }
  }
  
  // 字符转数字
  func testCharacter() {
    let c0: Character = "0"
    let c1: Character = "1"
    if let i0 = c0.asciiValue, let i1 = c1.asciiValue {
      let r = i1 - i0
      XCTAssertEqual(r, 1)
    } else {
      XCTFail()
    }
    
    // int -> char
    let c = Character(Unicode.Scalar.init(49))
    XCTAssertEqual(c, "1")
  }
  
  func testString2Char() {
    let a = "abc"
    let list = a.map({$0 })
    XCTAssertEqual(list, ["a", "b", "c"])
  }
  
  // 数字转 string
  func testInt2String() {
    let a = 5
    let b = String(a)
    XCTAssertEqual(b, "5")
    
    let c = Int(b)
    if c != nil {
      XCTAssertEqual(c!, a)
    }
  }
  
  
  func testMatrixInt() {
    repeat {
      let res = MatrixInt.make(rows: 1, cols: 1, start: 0)
      XCTAssertEqual(res, [[0]])
    } while false
    
    repeat {
      let res = MatrixInt.make(rows: 2, cols: 1, start: 0)
      XCTAssertEqual(res, [[0], [1]])
    } while false
    
    repeat {
      let res = MatrixInt.make(rows: 2, cols: 3, start: 0)
      XCTAssertEqual(res, [[0, 1, 2], [3, 4, 5]])
    } while false
    
    repeat {
      let res = MatrixInt.make(rows: 3, cols: 2, start: 0)
      XCTAssertEqual(res, [[0, 1], [2,3], [4, 5]])
    } while false

  }
  
  func testRange() {
    // r = 0 ..< 0 不走for 循环
    // r = 0 ..< 1 输出1
    // r = 0 ..< 2 输出 0，1； r.reversed 输出 1， 0
    let r = 0 ..< 2
    for i in r.reversed() {
      print(i)
    }
    
    var list = [1,2]
    list.swapAt(0, 0)
    
  }
  
  func testString() {
    let a = "abc"
    for i in Array(a).indices {
      print(i)
    }
  }
  
  func testForEach() {
    var number = 10
    var list = [1,2,3]
    list.forEach { (r) in
      number += r
    }
    XCTAssert(number == 16)
  }
  
  func testArray1() {
    repeat {
      let array = Array<Int>(1...3) // 1,2,3
      XCTAssertEqual(array[0], 1)
      XCTAssertEqual(array[1], 2)
      XCTAssertEqual(array[2], 3)
    } while false
    repeat {
      let array = Array<Int>(1...1) // 1,2,3
      XCTAssertEqual(array.count, 1)
      XCTAssertEqual(array[0], 1)
    } while false
    
    repeat {
      let array = Array<Int>(4...7) // 1,2,3
      XCTAssertEqual(array.count, 7-4+1)
      XCTAssertEqual(array[0], 4)
      XCTAssertEqual(array[1], 5)
      XCTAssertEqual(array[2], 6)
      XCTAssertEqual(array[3], 7)
    } while false
  }
  
  // MARK: - 多线程测试
  func testCustomSerialQueue() {
    let exp = expectation(description: "custom serial queue")
    print("1...\(Thread.current)")
    let sq = DispatchQueue(label: "hello")
    sq.async {
      print("2...\(Thread.current)")

      sq.sync {
        print("3...\(Thread.current)")
      }

      print("4...\(Thread.current)")
      exp.fulfill()
    }
    print("5...\(Thread.current)")
    
    waitForExpectations(timeout: 1) { (error) in
      print(error)
    }
    
    
  }
  
  func testGlobalQueue() {
    print("1...\(Thread.current)")
    let sq = DispatchQueue.global()
    sq.async {
    print("2...\(Thread.current)")

      sq.sync {
        print("3...\(Thread.current)")
      }
    print("4...\(Thread.current)")

    }
    print("5...\(Thread.current)")
  }
  
  func testMyWorkQueue() {
    let exp = expectation(description: "workqueue")
    
    let queue = DispatchQueue(label: "workqueue")
    print("A...\(Thread.current)")
    queue.async {
      print("B..\(Thread.current)")
      queue.async {
        print("B1..\(Thread.current)")
      }
    }
    print("A1...\(Thread.current)")

    queue.asyncAfter(deadline: .now() + .milliseconds(200)) {
      queue.sync {
        print("c..\(Thread.current)")
        exp.fulfill()
      }
    }
    
    queue.asyncAfter(deadline: .now() + .milliseconds(100)) {
      queue.async {
        print("d..\(Thread.current)")
      }
    }
    
    queue.sync {
      print("e..\(Thread.current)")
    }
    
    waitForExpectations(timeout: 3) { (error) in
      print(error)
    }
    
  }
  
  class A {}
  
  struct B { weak var a: A? }
  
  func testAB() {
    var b = B()
    b.a = A()
  }
}
