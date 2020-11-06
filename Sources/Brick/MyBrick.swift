//
//  File.swift
//  
//
//  Created by miao gaoliang on 2020/11/3.
//

import Foundation

/*
 寻找重复出现的数字,在给定的数组中，找出重复出现的数字
 0-n 个数字
 [1,2,3,4,1], 重复数字 1
 [2,4,6,1,2], 重复 2
 解题思路，将利用数字的边界，将数组元素，转换成 index，在进行计算， 可以在 o(1) 的时间操作
 
 实现方式：
 1. 排序
 2. map/array下标 对应
 3. 不停的交互下标，来互换
 4. 不交互下标，分段统计个数
 */
public class DuplicateNumbers  {
  // 如果返回 true 代表 找到重复出现的数数字，false 否则没有， array 索引
  public func isDuplicate(source: [Int], target: inout Int?) -> Bool {
    // 边界，提前返回
    if source.isEmpty || source.count == 1 {
      return false
    }
    
    // 不符合条件的提前返回
    for item in source {
      if item < 0 || item > source.count - 1 {
        return false
      }
    }
    
    var indexs = Array(repeating: 0, count: source.count)
    
    for item in source {
      let value = indexs[item]
      if value > 0 {
        target = item
        return true
      } else {
        indexs[item] = value + 1
      }
    }
    return false
  }
  
}

public class DuplicateNumbers2  {
  // 改变数组，交换下标
  // 改变数组，交换
  func isDuplicate(source: inout [Int], target: inout Int?) -> Bool {
    if source.isEmpty || source.count == 1 {
      return false
    }
    
    for item in source {
      if item < 0 || item > source.count - 1 {
        return false
      }
    }
    
    for idx in source.indices {
      //      s[a] , s[b], 如果s[a] 与 s[b]
      //     s[0] = 1  s[1] = 2, s[2] = 3, s[3] = 2
      while source[idx] != idx {
        if source[idx] == source[source[idx]] {
          target = source[idx]
          return true
        }
        //        source.swapAt(idx, source[idx])
        let tmp = source[idx]
        source[idx] = source[tmp]
        source[tmp] = tmp
      }
    }
    return false
  }
}

// 面试题3（二）：不修改数组找出重复的数字
// 题目：在一个长度为n+1的数组里的所有数字都在1到n的范围内，所以数组中至
// 少有一个数字是重复的。请找出数组中任意一个重复的数字，但不能修改输入的
// 数组。例如，如果输入长度为8的数组{2, 3, 5, 4, 3, 2, 6, 7}，那么对应的
// 输出是重复的数字2或者3。
public class DuplicateNumbers3  {
  // 负数 时，直接为无效； 正数时, 有效值
  func isDuplicate(source: [Int]) -> Int {
    if source.isEmpty || source.count == 1 {
      return -1
    }

    var start = 1
    var end = source.count - 1
    while end >= start {
      let middle = ((end - start) >> 1) + start
      let times = countRange(source, start: start, end: middle)
      if end == start {
        if times > 1 {
          return start
        } else {
          break
        }
      }
      if times > (middle - start + 1) {
        end = middle
      } else {
        start = middle + 1
      }
    }
    return -1
  }
  
  private func countRange(_ source: [Int], start: Int, end: Int) -> Int {
    var count = 0
    for item in source {
      if item >= start , item <= end {
        count += 1
      }
    }
    return count
  }
}

// 面试题4：二维数组中的查找
// 题目：在一个二维数组中，每一行都按照从左到右递增的顺序排序，每一列都按
// 照从上到下递增的顺序排序。请完成一个函数，输入这样的一个二维数组和一个
// 整数，判断数组中是否含有该整数。
public class MatrixFind {
  // 二维数组的columns 是一样的
  public func isExist(source: [[Int]], target: Int) -> Bool {
    if source.isEmpty {
      return false
    }
    
    var col = source[0].count - 1
    var row = 0
    let rows = source.count - 1
    
    while row <= rows , col >= 0 {
      if source[row][col] == target {
        return true
      }
      if source[row][col] > target {
        col -= 1
      } else {
        row += 1
      }
    }
    return false
  }
}

// 面试题5：替换空格
// 题目：请实现一个函数，把字符串中的每个空格替换成"%20"。例如输入“We are happy.”，
// 则输出“We%20are%20happy.”。
public class ReplaceBlank {
  // 空格 使用 %20 替换
  // 倒序设定，每次改变的是一致的
  // swift 中 将 string -> [Character]
  public func replace(source: String) -> String {
    var blankCount = 0
    for c in source {
      if c == " " {
        blankCount += 1
      }
    }
    
    let originLength = source.count
    let resultLength = source.count + blankCount << 1
    if originLength == resultLength {
      return source
    }
    
    let origin: [Character] = Array(source)
    var result: [Character] = Array(repeating: "x", count: resultLength)
    
    var originIdx = originLength - 1
    var resultIdx = resultLength - 1
    
    while originIdx >= 0 {
      if origin[originIdx] == " " {
        result[resultIdx] = "0"
        resultIdx -= 1
        
        result[resultIdx] = "2"
        resultIdx -= 1
        
        result[resultIdx] = "%"
        resultIdx -= 1
      } else {
        result[resultIdx] = origin[originIdx]
        resultIdx -= 1
      }
      originIdx -= 1
    }
    
    return String(result)
  }
}

// 面试题6：从尾到头打印链表
// 题目：输入一个链表的头结点，从尾到头反过来打印出每个结点的值。 链表反转
public class LKNode {
  private let uuid = UUID()
  var value: Int!
  var next: LKNode?
  init(_ value: Int, next: LKNode? = nil) {
    self.value = value
    self.next = next
  }
  
  // 如果不设置 items
  
  static func makeLKNode(items: [Int]) -> LKNode? {
    let dumpy = LKNode(0)
    var head: LKNode? = dumpy
    for i in items {
        head?.next = LKNode(i)
        head = head?.next
    }
    return dumpy.next
  }
  
  // index head 后的个数，index = 1, node 之后，第一个
  static func get(node: LKNode?, index: Int) -> LKNode? {
    var i = 0
    var current = node
    while i < index {
      current = current?.next
      i += 1
    }
    return current
  }
  
  static func makeRandomLKNode(count: Int) -> LKNode? {
    let dumpy = LKNode(0)
    var head: LKNode? = dumpy
    
    for _ in 0 ..< count {
      let random = Int.random(in: 0...100)
      head?.next = LKNode(random)
      head = head?.next
    }
    return dumpy.next
  }
  
  static func node2Array(node: LKNode?) -> [Int] {
    var items = [Int]()
    var current = node
    while current != nil {
      items.append(current!.value)
      current = current?.next
    }
    return items
  }
}

extension LKNode: Equatable {
  public static func == (lhs: LKNode, rhs: LKNode) -> Bool {
    return lhs.uuid == rhs.uuid
  }

}

// 链表逆序输出
public class LinkRev {
  // 1. 栈存储，push， pop 来完成
  public func reverse(source: LKNode?) -> [Int] {
    var items = [Int]()
    var stack = [LKNode]()
    var current = source
    while current != nil {
      stack.append(current!)
      current = current?.next
    }
    
    while !stack.isEmpty {
      let top = stack.removeLast()
      items.append(top.value)
    }
    return items
  }
}

// 2. 递归
public class LinkRev2 {
  
  public func reverse(source: LKNode?) -> [Int] {
    var items = [Int]()
    reverseNode(node: source, items: &items)
    return items
  }
  
  private func reverseNode(node: LKNode?, items: inout [Int]) {
    guard let node = node else {
      return
    }
    reverseNode(node: node.next, items: &items)
    items.append(node.value)
  }
}

// 链表反转, 迭代方式
public class LinkRev3 {
  public func reverse(source: LKNode?) -> LKNode? {
    // 1 -> 2 -> null
    var current = source
    var pre: LKNode? = nil
    while current != nil {
      let tmp = current?.next
      current?.next = pre
      pre = current
      current = tmp
    }
    return pre
  }
}

// 链表反转递归写法
public class LinkRev4 {
  public func reverse(source: LKNode?) -> LKNode? {
    if source == nil || source?.next == nil {
      return source
    }
    let node = reverse(source: source?.next)
    source?.next?.next = source
    source?.next = nil
    return node
  }
}

public class BTTree {
  let value: Int
  var left: BTTree?
  var right: BTTree?
  var parent: BTTree?
  init(value: Int, left: BTTree? = nil, right: BTTree? = nil, parent: BTTree? = nil) {
    self.value = value
    self.left = left
    self.right = right
  }
  
  // 前序遍历定义， 根左右
  static func preOrder(tree: BTTree?) -> [Int] {
    var items = [Int]()
    var current = tree
    var stack = [BTTree]()
    while current != nil || !stack.isEmpty {
      while current != nil {
        stack.append(current!)
        items.append(current!.value)
        current = current!.left
      }
      let top = stack.removeLast()
      current = top.right
    }
    return items
  }
  
  // 中续遍历定义，左根右
  static func inOrder(tree: BTTree?) -> [Int] {
    var stack = [BTTree]()
    var items = [Int]()
    var current: BTTree? = tree
    while current != nil || !stack.isEmpty {
      while current != nil {
        stack.append(current!)
        current = current!.left
      }
      let top = stack.removeLast()
      items.append(top.value)
      current = top.right
    }
    return items
  }
//  // 后续遍历定义 根左右
//  static func postOrder(tree: BTTree?) -> [Int] {
//
//  }
  
  static func connect(parent: BTTree?, left: BTTree?, right: BTTree?) {
    guard let p = parent else {
      return
    }
    p.left = left
    if left != nil {
      left?.parent = p
    }
    
    p.right = right
    if right != nil {
      right?.parent = p
    }
  }
}

// 面试题7：重建二叉树
// 题目：输入某二叉树的前序遍历和中序遍历的结果，请重建出该二叉树。假设输
// 入的前序遍历和中序遍历的结果中都不含重复的数字。例如输入前序遍历序列{1,
// 2, 4, 7, 3, 5, 6, 8}和中序遍历序列{4, 7, 2, 1, 5, 3, 8, 6}，则重建出
// 图2.6所示的二叉树并输出它的头结点。
public class ConstructTree {
  let preOrder: [Int] // preorder
  var map: [Int: Int] = [Int: Int]() // inorder: value - index
  init(preOrder: [Int], inOrder: [Int]) {
    self.preOrder = preOrder
    for (idx, item) in inOrder.enumerated() {
      map[item] = idx
    }
  }
  
  public func build() -> BTTree? {
    core( 0, 0, preOrder.count - 1)
  }
  // left, right 用来计算宽度的
  private func core(_ root: Int,
                    _ left: Int,
                    _ right: Int
                    ) -> BTTree? {
    if left > right {
      return nil
    }
    let rootValue = preOrder[root]
    let i: Int! = map[rootValue]
    let node = BTTree(value: rootValue)
    node.left = core(root + 1, left, i - 1)
    node.right = core(root + i - left + 1, i + 1, right)
    return node
  }
}

// 面试题8：二叉树的下一个结点
// 题目：给定一棵二叉树和其中的一个结点，如何找出中序遍历顺序的下一个结点？
// 树中的结点除了有两个分别指向左右子结点的指针以外，还有一个指向父结点的指针。
public class TreeNextNode {
  public func getNext(node: BTTree?) -> BTTree? {
    if node == nil {
      return nil
    }
    var pNext: BTTree?
    if node?.right != nil {
      // 那么它的下一个节点就是右子树中的最左节点；
      var right = node?.right
      while right?.left != nil {
        right = right?.left
      }
      pNext = right
    } else if node?.parent != nil {
      var current = node
      // 节点为其父节点的左子节点，那么其父节点就是它的下一个节点；
      var parent = node?.parent
      // 节点为其父节点的右子节点，那么需要沿其父指针一直向上遍历，一直找到某个节点是其父节点的左子节点为止，那么这个节点的父节点即是需要寻找的下一个节点
      while parent != nil && current?.value == parent?.right?.value {
        current = parent
        parent = parent?.parent
      }
      pNext = parent
    }
    return pNext
  }
}

// 面试题9：用两个栈实现队列
// 题目：用两个栈实现一个队列。队列的声明如下，请实现它的两个函数appendTail
// 和deleteHead，分别完成在队列尾部插入结点和在队列头部删除结点的功能。
public class MyQueue<T> {
  var pushStack = [T]()
  var popStack = [T]()
  
  func appendTail(_ e: T) {
    while !popStack.isEmpty {
      let top = popStack.removeLast()
      pushStack.append(top)
    }
    pushStack.append(e)
  }
  
  func deleteHead() -> T? {
    while !popStack.isEmpty {
      let top = popStack.removeLast()
      pushStack.append(top)
    }
    
    if !pushStack.isEmpty {
      return pushStack.removeLast()
    }
    
    return nil
  }
}

// 面试题10：斐波那契数列
// 题目：写一个函数，输入n，求斐波那契（Fibonacci）数列的第n项。
public class Fibonacci1 {
  // 递归
  func fib(_ n: UInt) -> Int {
    if n <= 0 {
      return 0
    }
    if n == 1 {
      return 1
    }
    return fib(n - 1) + fib(n - 2)
  }
}

public class Fibonacci2 {
  // 迭代
  // 0 - 0
  // 1 - 1
  // f(n) = f(n-1) + f(n-2)
  func fib(_ n: UInt) -> Int {
    if n <= 0 {
      return 0
    }
    if n == 1 {
      return 1
    }
    
    var fn_1 = 1
    var fn_2 = 0
    for _ in 2 ... n {
      let fn = fn_1 + fn_2
      fn_2 = fn_1
      fn_1 = fn
    }
    return fn_1
  }
}

// 面试题11：旋转数组的最小数字
// 题目：把一个数组最开始的若干个元素搬到数组的末尾，我们称之为数组的旋转。
// 输入一个递增排序的数组的一个旋转，输出旋转数组的最小元素。例如数组
// {3, 4, 5, 1, 2}为{1, 2, 3, 4, 5}的一个旋转，该数组的最小值为1。
public class RotationArray {
  func findMin(in list: [Int]) -> Int {
    var left = 0
    var right = list.count - 1
    var middle = left
    while list[left] >= list[right] {
      if right - left == 1 {
        middle = right
        break
      }
      
      let middle = (right + left) >> 1
      if list[left] == list[middle] && list[right] == list[middle] {
        return minInOrder(list, left, right)
      }
      
      if list[middle] > list[left] {
        left = middle
      } else {
        right = middle
      }
    }
    return list[middle]
  }
  
  private func minInOrder(_ source: [Int], _ start: Int , _ end: Int) -> Int {
    var min = source[start]
    for i in start ... end {
      if min > source[i] {
        min = source[i]
      }
    }
    return min
  }
}

// 面试题12：矩阵中的路径
// 题目：请设计一个函数，用来判断在一个矩阵中是否存在一条包含某字符串所有
// 字符的路径。路径可以从矩阵中任意一格开始，每一步可以在矩阵中向左、右、
// 上、下移动一格。如果一条路径经过了矩阵的某一格，那么该路径不能再次进入
// 该格子。例如在下面的3×4的矩阵中包含一条字符串“bfce”的路径（路径中的字
// 母用下划线标出）。但矩阵中不包含字符串“abfb”的路径，因为字符串的第一个
// 字符b占据了矩阵中的第一行第二个格子之后，路径不能再次进入这个格子。
// A B T G
// C F C S
// J D E H

public class MatrixPath {
  var board: [[Character]]
  let word: [Character]
  let rows: Int
  let cols: Int
  init(board: [[Character]], word: String) {
    self.board = board
    self.word = Array(word)
    rows = board.count
    cols = board[0].count
  }
  
  public func check() -> Bool {
    for i in 0 ..< rows {
      for j in 0 ..< cols {
        if dfs(i, j, 0) {
          return true
        }
      }
    }
    return false
  }
  
  private func dfs(_ i: Int, _ j: Int, _ k: Int) -> Bool {
    if i < 0 || i >= rows || j < 0 || j >= cols || board[i][j] != word[k] {
      return false
    }
    if k == word.count - 1 {
      return true
    }
    let tmp = board[i][j]
    board[i][j] = "/"
    let r = dfs(i+1, j, k+1) || dfs(i - 1, j, k+1) || dfs(i, j-1, k+1) || dfs(i, j+1, k+1)
    board[i][j] = tmp
    return r
  }
}

extension MatrixPath {
  class func make2D(source: String, rows: Int, cols: Int) -> [[Character]] {
    var items: [[Character]] = Array(repeating: Array(repeating:"#", count: cols), count: rows)
    var j = 0
    for c in source {
      let col = j % cols
      let row = j / cols
      items[row][col] = c
      j += 1
    }
    return items
  }
}

// 面试题13：机器人的运动范围
// 题目：地上有一个m行n列的方格。一个机器人从坐标(0, 0)的格子开始移动，它
// 每一次可以向左、右、上、下移动一格，但不能进入行坐标和列坐标的数位之和
// 大于k的格子。例如，当k为18时，机器人能够进入方格(35, 37)，因为3+5+3+7=18。
// 但它不能进入方格(35, 38)，因为3+5+3+8=19。请问该机器人能够到达多少个格子？
public class RobotMoveRange {
  private var visited: [[Bool]]
  private let m: Int
  private let n: Int
  private let k: Int
  init(_ k: Int, _ m: Int, _ n: Int) {
    self.m = m
    self.n = n
    self.k = k
    visited = Array(repeating: Array(repeating: false, count: n), count: m)
  }
 
  func move() -> Int {
    return dfs(i: 0, j: 0)
  }
  
  private func dfs(i: Int, j: Int) -> Int {
    if i >= m || j >= n || visited[i][j] || (bitSum(i) + bitSum(j)) > k {
      return 0
    }
    visited[i][j] = true
    return 1 + dfs(i: i+1, j: j) + dfs(i: i, j: j+1)
  }
  
  private func bitSum(_ s: Int) -> Int {
    var current = s
    var sum = 0
    while current > 0 {
      sum += current % 10
      current = current / 10
    }
    return sum
  }
  
}

// 面试题14：剪绳子
// 题目：给你一根长度为n绳子，请把绳子剪成m段（m、n都是整数，n>1并且m≥1）。
// 每段的绳子的长度记为k[0]、k[1]、⋯⋯、k[m]。k[0]*k[1]*⋯*k[m]可能的最大乘
// 积是多少？例如当绳子的长度是8时，我们把它剪成长度分别为2、3、3的三段，此
// 时得到最大的乘积18。

public class CutRope {
  public func cut(_ n: Int) -> Int {
    if n <= 3 {
      return n - 1
    }
    let a: Int = n / 3
    let b = n % 3
    let dec = Decimal(3)
    if b == 0 {
      let d = pow(dec, a)
      return NSDecimalNumber(decimal: d).intValue
    } else if b == 1 {
      let d = pow(dec, a - 1) * 4
      return NSDecimalNumber(decimal: d).intValue
    } else {
      let d = pow(dec, a) * 2
      return NSDecimalNumber(decimal: d).intValue
    }
  }
}

// 面试题15：二进制中1的个数
// 题目：请实现一个函数，输入一个整数，输出该数二进制表示中1的个数。例如
// 把9表示成二进制是1001，有2位是1。因此如果输入9，该函数输出2。
public class BitCount {
  public func number(_ n: Int) -> Int {
    var count = 0
    var check = 0x01
    var idx = 0
    while idx < 64 {
      if check & n > 0 {
        count += 1
      }
      check = check << 1
      idx += 1
    }
    return count
  }
}

public class BitCount2 {
  // n- 1 & n 消除掉 1 位 1
  public func number(_ n: Int) -> Int {
    var current = n
    var count = 0
    while current != 0 {
      count += 1
      current &= current - 1
    }
    return count
  }
}

// 面试题16：数值的整数次方
// 题目：实现函数double Power(double base, int exponent)，求base的exponent
// 次方。不得使用库函数，同时不需要考虑大数问题。
public class MyPower {
  func pow(_ base: Double, _ exponent: Int) throws ->  Double {
    if base.isZero, exponent < 0 {
      throw NSError(domain: "invald pow", code: 0, userInfo: nil)
    }
    
    let absexp: UInt = UInt(abs(exponent))
    let r = cal(base, absexp)
    if exponent < 0 {
      return 1.0 / r
    }
    return r
  }
  
  private func cal(_ base: Double, _ exp: UInt) -> Double {
    var r = 1.0
    for _ in 0 ..< exp {
      r = base * r
    }
    return r
  }
}

// 面试题17：打印1到最大的n位数
// 题目：输入数字n，按顺序打印出从1最大的n位十进制数。比如输入3，则
// 打印出1、2、3一直到最大的3位数即999。
enum BrickError: Error {
  case invaildInput(Int)
}

public class MaxNDigit {
  func excute(n: Int) throws {
    if n <= 0 {
      throw BrickError.invaildInput(n)
    }
    
    var items = Array<Int8>(repeating: 0, count: n)
    while !increment(items: &items) {
      printNumber(items: items)
    }
    print("===\n")
  }
  
  private func printNumber(items: [Int8]) {
    var isBegin0 = true
    let len = items.count
    var str = ""
    for i in 0 ..< len {
      if isBegin0 && items[i] != 0 {
        isBegin0 = false
      }
      
      if !isBegin0 {
        str.append(String(items[i]))
      }
    }
    print("\(str),  ")
  }
  
  private func increment(items: inout [Int8]) -> Bool {
    var isOverflow = false
    var carray: Int8 = 0
    let len = items.count
    
    var i = len - 1
    while i >= 0 {
      var nsum: Int8 = items[i] + carray
      if i == len - 1 {
        nsum += 1
      }
      
      if nsum >= 10 {
        if i == 0 {
          isOverflow = true
        } else {
          nsum -= 10
          carray = 1
          items[i] = nsum
        }
      } else {
        items[i] = nsum
        break
      }
      i -= 1
    }
    
    return isOverflow
  }
}

public class MaxNDigit2 {
  func excute(n: Int) throws {
    if n <= 0 {
      throw BrickError.invaildInput(n)
    }
    var items = Array<Int8>(repeating: 0, count: n)
    
    for i in 0 ... 9 {
      items[0] = Int8(i)
      recursively(items: &items, index: 0)
    }
    print("===\n")
  }
  
  private func recursively(items: inout [Int8], index: Int) {
    if index == items.count - 1 {
      printNumber(items: items)
      return
    }
    let range: ClosedRange<Int8> = 0 ... 9
    for i in range {
      items[index + 1] = i
      recursively(items: &items, index: index + 1)
    }
  }
  
  private func printNumber(items: [Int8]) {
    var isBegin0 = true
    let len = items.count
    var str = ""
    for i in 0 ..< len {
      if isBegin0 && items[i] != 0 {
        isBegin0 = false
      }
      
      if !isBegin0 {
        str.append(String(items[i]))
      }
    }
    if !str.isEmpty {
      print("\(str),  ")
    }
  }
}

// 46. 全排列
/*
 给定一个 没有重复 数字的序列，返回其所有可能的全排列。

 输入: [1,2,3]
 输出:
 [
   [1,2,3],
   [1,3,2],
   [2,1,3],
   [2,3,1],
   [3,1,2],
   [3,2,1]
 ]
 链接：https://leetcode-cn.com/problems/permutations
46. 全排列
 */
public class Permutations {
  public func permute(_ nums: [Int]) -> [[Int]] {
    var res = [[Int]]()
    if nums.isEmpty {
      return res
    }
    
    var used: [Bool] = Array(repeating: false, count: nums.count)
    var path = [Int]()
    
    dfs(nums, 0, &path, &used, &res)

    print(res)
    return res
  }
  
  private func dfs(_ nums: [Int], _ depth: Int, _ path: inout [Int], _ used: inout [Bool], _ res: inout [[Int]]) {
    if depth == nums.count {
      res.append(path)
      return
    }
    
    for i in 0 ..< nums.count {
      if !used[i] {
        path.append(nums[i])
        used[i] = true
        print("递归前： path = \(path)")
        dfs(nums, depth + 1, &path, &used, &res)
        used[i] = false
        path.removeLast()
        print("递归后： path = \(path)")
      }
    }
  }
}

// 面试题18（一）：在O(1)时间删除链表结点
// 题目：给定单向链表的头指针和一个结点指针，定义一个函数在O(1)时间删除该
// 结点。
public class MDeleteNode {
  public func delete(head: inout LKNode?, beDeleted: inout LKNode?) {
    // 中间
    if beDeleted?.next != nil {
      let next = beDeleted?.next
      beDeleted?.value = next?.value
      beDeleted?.next = next?.next
      print("中间：\(next?.value)")
    } else if head == beDeleted {
      let tmp = head?.next
      head?.next = nil
      // 头
      head = tmp
      print("头部：\(tmp?.value)")

    } else {
      // 尾巴
      var current = head
      while current?.next != beDeleted {
        current = current?.next
      }
      current?.next = nil
      print("尾部：\(current?.value)")

    }
  }
}





