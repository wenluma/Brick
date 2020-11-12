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

extension LKNode: Equatable, Hashable {
  public static func == (lhs: LKNode, rhs: LKNode) -> Bool {
    return lhs.uuid == rhs.uuid
  }

  public func hash(into hasher: inout Hasher) {
    hasher.combine(uuid.hashValue)
  }
  
}

public class ComplexLKNode {
  private let uuid = UUID()
  var value: Int!
  var next: ComplexLKNode?
  var slibing: ComplexLKNode?
  init(value: Int, _ next: ComplexLKNode? = nil, _ slibing: ComplexLKNode? = nil) {
    self.value = value
    self.next = next
    self.slibing = slibing
  }
  
  static func connect(_ current: ComplexLKNode?,  next: ComplexLKNode?, slibing: ComplexLKNode? ) {
    if current != nil {
      current?.next = next
      current?.slibing = slibing
    }
  }
  
  static func info(_ head: ComplexLKNode?) -> [String] {
    var node = head
    var res = [String]()
    while node != nil {
      var info = "value: \(node!.value)" + "| slibing: "
      if node?.slibing != nil {
        info += "\(node?.slibing?.value)"
      }
      
      info += "| next: "
      if node?.next != nil {
        info += "\(node?.next?.value)"
      }
      res.append(info)

      node = node?.next
    }
    return res
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
  weak var parent: BTTree?
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
  
  static func levelOrder(_ tree: BTTree?) -> [[Int]] {
    var result = [[Int]]()
    if tree == nil {
      return result
    }
    var queue: [BTTree] = [BTTree]()
    var levelQueue = [BTTree]()
    var path = [Int]()
    queue.append(tree!)
    while !queue.isEmpty {
      let top = queue.remove(at: 0)
      if top.left != nil {
        levelQueue.append(top.left!)
      }
      path.append(top.value)
      
      if top.right != nil {
        levelQueue.append(top.right!)
      }
      
      if queue.isEmpty {
        queue.append(contentsOf: levelQueue)
        levelQueue.removeAll()
        result.append(path)
        path.removeAll()
      }
    }
    
    return result
    
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
  // 转双向链表
  static func toDoubleLink(_ root: BTTree?) -> [[Int]] {
    var res = [[Int]]()
    if root == nil {
      return res
    }
    // left 2 right

    var path = [Int]()
    var node = root
    while node != nil {
      path.append(node!.value)
      if node?.right == nil {
        break
      }
      node = node?.right
    }
    res.append(path)
    
    // right 2 left
    path.removeAll()
    while node != nil {
      path.append(node!.value)
      node = node?.left
    }
    res.append(path)
    return res
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
  // 内容空
  case empty
  // 无效输入
  case invaildInput(Int)
  // 无效节点 nil
  case invaildNode
  // 超限制
  case rangeOut(Int)
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

// 面试题18（二）：删除链表中重复的结点
// 题目：在一个排序的链表中，如何删除重复的结点？例如，在图3.4（a）中重复
// 结点被删除之后，链表如图3.4（b）所示。
public class MDeleteDupNode {
  public func delete(head: inout LKNode?) {
    var current = head
    while current != nil && current?.next != nil {
      if current?.value == current?.next?.value {
        var tmp = current?.next
        current?.next = tmp?.next
        tmp = nil
      } else {
        current = current?.next
      }
    }
  }
}

// 面试题20：表示数值的字符串
// 题目：请实现一个函数用来判断字符串是否表示数值（包括整数和小数）。例如，
// 字符串“+100”、“5e2”、“-123”、“3.1416”及“-1E-16”都表示数值，但“12e”、
// “1a3.14”、“1.2.3”、“+-5”及“12e+5.4”都不是

public class MyNumeric {
  public func isNumberic(_ s: String) -> Bool {
    if s.isEmpty {
      return false
    }
    let sc = Array(s)
    var i = 0
    var numeric: Bool = scanInteger(sc, &i)
    if i < sc.count,  sc[i] == "." {
      i += 1
      numeric = scanUnsignedInteger(sc, &i) || numeric
    }
    
    if i < sc.count, sc[i] == "e" || sc[i] == "E" {
      i += 1
      numeric = numeric && scanInteger(sc, &i)
    }
    
    return numeric && i == sc.count
  }
  
  
  private func scanInteger(_ s: [Character], _ i: inout Int) -> Bool {
    
    if i < s.count,  s[i] == "+" || s[i] == "-" {
      i += 1
    }
    return scanUnsignedInteger(s, &i)
  }
  
  private func scanUnsignedInteger(_ s: [Character], _ i: inout Int) -> Bool {
    let start = i
    while i < s.count, s[i] <= "9" && s[i] >= "0" {
      i += 1
    }
    return i > start
  }

}

// 面试题21：调整数组顺序使奇数位于偶数前面
// 题目：输入一个整数数组，实现一个函数来调整该数组中数字的顺序，使得所有
// 奇数位于数组的前半部分，所有偶数位于数组的后半部分。
public class RecordOddEven {
  public func record(_ items: inout [Int]) {
    var start = 0
    var end = items.count - 1
    while start < end {
      while start < end, items[start] & 0x1 == 0x1 {
        start += 1
      }
      
      while start < end, items[end] & 0x1 == 0 {
        end -= 1
      }
      
      if start < end {
//        items.swapAt(start, end)
        let tmp = items[start]
        items[start] = items[end]
        items[end] = tmp
      }
    }
  }
}

// 面试题22：链表中倒数第k个结点
// 题目：输入一个链表，输出该链表中倒数第k个结点。为了符合大多数人的习惯，
// 本题从1开始计数，即链表的尾结点是倒数第1个结点。例如一个链表有6个结点，
// 从头结点开始它们的值依次是1、2、3、4、5、6。这个链表的倒数第3个结点是
// 值为4的结点。

public class TailKthNode {
  public func find(_ node: LKNode?, _ kth: Int) throws -> Int {
    if node == nil {
      throw BrickError.invaildInput(kth)
    }
    if kth <= 0 {
      throw BrickError.invaildInput(kth)
    }
    var current = node
    var kNode: LKNode? = node
    var i = kth - 1
    while i >= 0, current != nil {
      current = current?.next
      i -= 1
    }
    if i >= 0 {
      throw BrickError.rangeOut(kth)
    }
    
    while current != nil {
      current = current?.next
      kNode = kNode?.next
    }
    
    return kNode!.value
  }
}

// 面试题23：链表中环的入口结点
// 题目：一个链表中包含环，如何找出环的入口结点？例如，在图3.8的链表中，
// 环的入口结点是结点3。
public class LinkCircleLoop {
  public func entryNodeFor(_ node: LKNode?) -> LKNode? {
    let meetingNode: LKNode? = findMeetingNode(node)
    if meetingNode == nil {
      return nil
    }
    
    // count in loop
    var i = 1
    var current = meetingNode
    while current?.next != meetingNode  {
      current = current?.next
      i += 1
    }
    
    // 移动环的内节点次数
    var p1 = node
    for _ in 0 ..< i {
      p1 = p1?.next
    }
    
    // 从头开始移动，与p1 相交点，就是入口点
    var p2 = node
    while p1 != nil, p2 != nil, p1 != p2 {
      p1 = p1?.next
      p2 = p2?.next
    }
    return p1
  }
  
  private func findMeetingNode(_ node: LKNode?) -> LKNode? {
    if node == nil {
      return nil
    }
    var slow = node
    var fast = node?.next
    while slow != nil, fast != nil {
      if slow == fast {
        return slow
      }
      slow = slow?.next
      fast = fast?.next
      if fast != nil {
        fast = fast?.next
      }
    }
    return nil
  }
}

// 通过set 来实现，第一次出现重复的，就是入口点
public class LinkCircleLoop2 {
  public func entryNodeFor(_ node: LKNode?) -> LKNode? {
    var set: Set<LKNode?> = Set()
    var current = node
    var meetingNode: LKNode? = nil
    while current != nil {
      if set.contains(current) {
        meetingNode = current
        break
      } else {
        set.insert(current)
      }
      current = current?.next
    }
    return meetingNode
  }
}

// 面试题25：合并两个排序的链表
// 题目：输入两个递增排序的链表，合并这两个链表并使新链表中的结点仍然是按
// 照递增排序的。例如输入图3.11中的链表1和链表2，则合并之后的升序链表如链
// 表3所示。
public class MergeLink {
  
  public func merge(_ n1: LKNode?, _ n2: LKNode?) -> LKNode? {
    var p1 = n1
    var p2 = n2
    let dumy = LKNode(0)
    var current: LKNode? = dumy
    while p1 != nil , p2 != nil {
      if p1!.value < p2!.value {
        current?.next = p1
        p1 = p1?.next
      } else {
        current?.next = p2
        p2 = p2?.next
      }
      current = current?.next
    }
    
    if p1 != nil {
      current?.next = p1
    } else if p2 != nil {
      current?.next = p2
    }
    
    return dumy.next
  }
}

// 面试题26：树的子结构
// 题目：输入两棵二叉树A和B，判断B是不是A的子结构。
public class MySubTree {
  public func hasSub(_ r1: BTTree?, _ r2: BTTree?) -> Bool {
    var result = false
    if r1 != nil, r2 != nil {
      if r1?.value == r2?.value {
        result = tree1HasTree2(r1, r2)
      }
      if !result {
        result = hasSub(r1?.left, r2)
      }
      
      if !result {
        result = hasSub(r1?.right, r2)
      }
    }
    return result
  }
  
  private func tree1HasTree2(_ r1: BTTree?, _ r2: BTTree?) -> Bool {
    if r2 == nil {
      return true
    }
    if r1 == nil {
      return false
    }
    
    if r1?.value != r2?.value {
      return false
    }
    
    return tree1HasTree2(r1?.left, r2?.left) &&  tree1HasTree2(r1?.right, r2?.right)
  }
  
}

// 面试题27：二叉树的镜像
// 题目：请完成一个函数，输入一个二叉树，该函数输出它的镜像。
public class MyMirrorTree {
  
  public func mirror(_ root: BTTree?) -> BTTree? {
    if root == nil {
      return nil
    }
    let left = root?.left
    let right = root?.right
    root?.left = mirror(right)
    root?.right = mirror(left)
    return root
  }
  
}

public class MyMirrorTree2 {
  
  public func mirror(_ root: BTTree?) -> BTTree? {
    if root == nil {
      return nil
    }
    var stack = [BTTree]()
    stack.append(root!)
    
    while !stack.isEmpty {
      let top = stack.removeLast()
      
      let tmp = top.left
      top.left = top.right
      top.right = tmp
      
      if top.left != nil {
        stack.append(top.left!)
      }
      
      if top.right != nil {
        stack.append(top.right!)
      }
    }
    return root
  }
  
}

// 面试题28：对称的二叉树
// 题目：请实现一个函数，用来判断一棵二叉树是不是对称的。如果一棵二叉树和
// 它的镜像一样，那么它是对称的。

public class MySymmetricalTree {
  public func isSymmetrical(_ root: BTTree?) -> Bool {
    return isSymmetricalTree(root, root)
  }
  
  private func isSymmetricalTree(_ l: BTTree?, _ r: BTTree?) -> Bool {
    if l == nil , r == nil {
      return true
    }
    if l == nil || r == nil {
      return false
    }
    if l?.value != r?.value {
      return false
    }
    
    return isSymmetricalTree(l?.left, r?.right) && isSymmetricalTree(l?.right, r?.left)
  }
}


// MARK: - 二维数组
public class MatrixInt {
  static func make(rows: Int, cols: Int, start: Int) -> [[Int]] {
    var res = [[Int]]()
    var k = start
    for _ in 0 ..< rows {
      var path = [Int]()
      for _ in 0 ..< cols {
        path.append(k)
        k += 1
      }
      res.append(path)
    }
    return res
  }
}

// 面试题29：顺时针打印矩阵
// 题目：输入一个矩阵，按照从外向里以顺时针的顺序依次打印出每一个数字。
public class MyMatrixClockwisely {
  public func logMatrixClockwisely(_ items: [[Int]]) -> [Int] {
    var path = [Int]()

    if items.isEmpty {
      return path
    }
    let rows = items.count
    let cols = items[0].count
    var start = 0
    while rows > (start << 1) , cols > (start << 1) {
      clockwisely(items, rows, cols, start, &path)
      start += 1
    }
    
    return path
  }
  
  private func clockwisely(_ items: [[Int]],
                           _ rows: Int,
                           _ cols: Int,
                           _ start: Int,
                           _ path: inout [Int]) {
    let x = cols - 1 - start
    let y = rows - 1 - start
    
    // 左 -》 右
    var i = start
    while i <= x {
      let e = items[start][i]
      path.append(e)
      i += 1
    }
    
    // 上 -》 下
    i = start + 1
    while i <= y {
      let e = items[i][x]
      path.append(e)

      i += 1
    }
    
    // 右 - 左
    i = x - 1
    while y > start, i >= start {
      let e = items[y][i]
      path.append(e)
      i -= 1
    }
    
    // 下 - 上
    i = y - 1
    while x > start, i >= start + 1 {
      let e = items[i][start]
      path.append(e)
      i -= 1
    }
  }
  
}

// 面试题30：包含min函数的栈
// 题目：定义栈的数据结构，请在该类型中实现一个能够得到栈的最小元素的min
// 函数。在该栈中，调用min、push及pop的时间复杂度都是O(1)。
public class MyStackMinInt {
  private var stack = [Int]()
  private var minStack = [Int]()
  
  public func push(_ e: Int ) {
    if empty() {
      minStack.append(e)
    } else {
      if top() > e {
        minStack.append(e)
      } else {
        minStack.append(top())
      }
    }
    stack.append(e)
  }
  
  private func empty() -> Bool {
    stack.isEmpty
  }
  
  
  private func top() -> Int {
     stack.last!
  }
  
  @discardableResult
  public func pop() throws -> Int {
    if empty() {
      throw BrickError.empty
    }
    minStack.removeLast()
    return stack.removeLast()
  }
  
  public func min() throws -> Int {
    if empty() {
      throw BrickError.empty
    }
    return minStack.last!
  }
}

// 面试题31：栈的压入、弹出序列
// 题目：输入两个整数序列，第一个序列表示栈的压入顺序，请判断第二个序列是
// 否为该栈的弹出顺序。假设压入栈的所有数字均不相等。例如序列1、2、3、4、
// 5是某栈的压栈序列，序列4、5、3、2、1是该压栈序列对应的一个弹出序列，但
// 4、3、5、1、2就不可能是该压栈序列的弹出序列。
public class MyPopOrder {
  
  public func isPopOrder(_ pushed: [Int], _ poped: [Int]) -> Bool {
    var stack = [Int]()
    var i = 0
    for item in pushed {
      stack.append(item)
      while !stack.isEmpty, stack.last! == poped[i] {
        stack.removeLast()
        i += 1
      }
    }
    return stack.isEmpty
  }
  
}

// 面试题32（一）：不分行从上往下打印二叉树
// 题目：从上往下打印出二叉树的每个结点，同一层的结点按照从左到右的顺序打印。
public class MyLevelTree {
  
  public func level(_ root: BTTree?) -> [Int] {
    var result = [Int]()

    if root == nil {
      return result
    }
    var queue = [BTTree]()
    queue.append(root!)
    
    while !queue.isEmpty {
      let top = queue.remove(at: 0)
      result.append(top.value)
      
      if top.left != nil {
        queue.append(top.left!)
      }
      
      if top.right != nil {
        queue.append(top.right!)
      }
    }
    return result
  }
  
}

// 面试题32（二）：分行从上到下打印二叉树
// 题目：从上到下按层打印二叉树，同一层的结点按从左到右的顺序打印，每一层
// 打印到一行。
public class MyLevelTree2 {
  
  public func level(_ root: BTTree?) -> [[Int]] {
    var result = [[Int]]()
    if root == nil {
      return result
    }
    var queue = [BTTree]()
    queue.append(root!)
    var path = [Int]()
    var levelQueue = [BTTree]()
    while !queue.isEmpty {
      let top = queue.remove(at: 0)
      path.append(top.value)
      top.left.map({ levelQueue.append($0) })
      top.right.map({ levelQueue.append($0) })
      if queue.isEmpty {
        queue.append(contentsOf: levelQueue)
        levelQueue.removeAll()
        result.append(path)
        path.removeAll()
      }
    }
    return result
  }
  
}

// 面试题32（三）：之字形打印二叉树
// 题目：请实现一个函数按照之字形顺序打印二叉树，即第一行按照从左到右的顺
// 序打印，第二层按照从右到左的顺序打印，第三行再按照从左到右的顺序打印，
// 其他行以此类推。
public class MyLevelTree3 {
  public func level(_ root: BTTree?) -> [[Int]] {
    return level1(root)
  }
  
  // 方式1， 根据奇偶在加入前修改
  private func level1(_ root: BTTree?) -> [[Int]] {
    var res = [[Int]]()
    if root == nil {
      return res
    }
    var path = [Int]()
    var queue = [BTTree]()
    var levelQueue = [BTTree]()
    queue.append(root!)
    var odd = true
    
    while !queue.isEmpty {
      
      while !queue.isEmpty {
        let top = queue.remove(at: 0)
        path.append(top.value)
        top.left.map( { levelQueue.append($0) })
        top.right.map( { levelQueue.append($0) })
      }
      
      queue.append(contentsOf: levelQueue)
      levelQueue.removeAll()
      if odd {
        res.append(path)
      } else {
        res.append(path.reversed())
      }
      path.removeAll()
      odd = !odd
    }
    return res
  }
  
  // 根据奇偶，存数据时，修改
  private func level2(_ root: BTTree?) -> [[Int]] {
    var res = [[Int]]()
    if root == nil {
      return res
    }
    var path = [Int]()
    var queue = [BTTree]()
    var levelQueue = [BTTree]()
    queue.append(root!)
    var odd = true
    
    while !queue.isEmpty {
      let top = queue.remove(at: 0)
      if odd {
        path.append(top.value)
      } else {
        path.insert(top.value, at: 0)
      }
      
      top.left.map({ levelQueue.append($0) })
      top.right.map({ levelQueue.append($0) })
      
      if queue.isEmpty {
        queue.append(contentsOf: levelQueue)
        levelQueue.removeAll()
        res.append(path)
        path.removeAll()
        odd = !odd
      }
    }
    return res
  }
}

// 面试题33：二叉搜索树的后序遍历序列
// 题目：输入一个整数数组，判断该数组是不是某二叉搜索树的后序遍历的结果。
// 如果是则返回true，否则返回false。假设输入的数组的任意两个数字都互不相同。
public class MyVerifySquenceOfBST {
  public func verify(_ list: [Int], _ i: Int, _ j: Int) -> Bool {
    if i > j {
      return false
    }
    return rec(list, i, j)
  }
  
  private func rec(_ list: [Int], _ i: Int, _ j: Int) -> Bool {
    if i >= j {
      return true
    }
    var p = i
    while list[p] < list[j] {
      p += 1
    }
    
    let n = p
    while list[p] > list[j] {
      p += 1
    }
    
    return p == j && rec(list, i, n - 1) && rec(list, n, j - 1)
  }
  
  
}

public class MyVerifySquenceOfBST2 {
  public func verify(_ list: [Int], _ i: Int, _ j: Int) -> Bool {
    if list.isEmpty {
      return false
    }
    var stack = [Int]()
    var root = Int.max
    // 左右根
    // 根 | 右 | 左
    for item in list.reversed() {
      if item > root {
        return false
      }
      while !stack.isEmpty, stack.last! > item {
        root = stack.removeLast()
      }
      stack.append(item)
    }
    return true
  }
}
// 面试题34：二叉树中和为某一值的路径
// 题目：输入一棵二叉树和一个整数，打印出二叉树中结点值的和为输入整数的所
// 有路径。从树的根结点开始往下一直到叶结点所经过的结点形成一条路径。
public class FindTreePath {
  public func find(_ root: BTTree?, _ sum: Int) -> [[Int]] {
    var res = [[Int]]()
    var path = [Int]()
    
    dfs(root, sum, &res, &path)
    return res
  }
  
  private func dfs(_ root: BTTree?, _ sum: Int, _ res: inout [[Int]], _ path: inout [Int]) {
    if root == nil {
      return
    }
    path.append(root!.value)
    
    let next = sum - root!.value
    if next == 0, root?.left == nil, root?.right == nil {
      res.append(path)
    }
    dfs(root?.left, next, &res, &path)
    dfs(root?.right, next, &res, &path)
    path.removeLast()
  }
}

// 面试题35：复杂链表的复制
// 题目：请实现函数ComplexListNode* Clone(ComplexListNode* pHead)，复
// 制一个复杂链表。在复杂链表中，每个结点除了有一个m_pNext指针指向下一个
// 结点外，还有一个m_pSibling 指向链表中的任意结点或者nullptr。
public class MyComplexNodeCopy {
  public func copy(_ node: ComplexLKNode?) -> ComplexLKNode? {
    cloneNode(node)
    connectSiblingNode(node)
    let cloned = reconnectNode(node)
    return cloned
  }
  
  private func cloneNode(_ head: ComplexLKNode?) {
    var node = head
    while node != nil {
      let tmp: ComplexLKNode = ComplexLKNode(value: node!.value, node?.next)
      node?.next = tmp
      node = tmp.next
    }
  }
  
  private func connectSiblingNode(_ head: ComplexLKNode?) {
    var node = head
    while node != nil {
      let cloned = node?.next
      if node?.slibing != nil {
        cloned?.slibing = node?.slibing?.next
      }
      node = cloned?.next
    }
  }
  
  private func reconnectNode(_ head: ComplexLKNode?) -> ComplexLKNode? {
    var node = head
    var clonedHead: ComplexLKNode? = nil
    var clonedNode: ComplexLKNode? = nil
    
    if node != nil {
      clonedHead = node?.next
      clonedNode = node?.next
      node?.next = clonedNode?.next
      node = node?.next
    }
    
    while node != nil {
      clonedNode?.next = node?.next
      clonedNode = clonedNode?.next
      
      node?.next = clonedNode?.next
      node = node?.next
    }
    return clonedHead
  }
}

// 面试题36：二叉搜索树与双向链表
// 题目：输入一棵二叉搜索树，将该二叉搜索树转换成一个排序的双向链表。要求
// 不能创建任何新的结点，只能调整树中结点指针的指向。
public class MyConvertTree2Link {
  // 双向链表
  public func convert(_ pNode: BTTree?) -> BTTree? {
    var link: BTTree? = nil
    
    dfs(pNode, &link)

    var head = link
    while head != nil, head?.left != nil {
      head = head?.left
    }
    return head
  }
  
  private func dfs(_ pNode: BTTree?, _ link: inout BTTree?) {
    if pNode == nil {
      return
    }
    
    var current = pNode
    if current?.left != nil {
      dfs(current?.left, &link)
    }
    
    current?.left = link
    if link != nil {
      link?.right = current
    }
    link = current
    
    if current?.right != nil {
      dfs(current?.right, &link)
    }
  }
}
// 面试题37：序列化二叉树
// 题目：请实现两个函数，分别用来序列化和反序列化二叉树。
public class MyCodableTree {
  public func serialize(_ node: BTTree?) -> String {
    let res = mySerialize(node)
    return res
  }
  
  private func mySerialize(_ node: BTTree?) -> String {
    if node == nil {
      return "$"
    }
    let left = mySerialize(node?.left)
    let right = mySerialize(node?.right)
    return "\(node!.value),\(left),\(right)"
  }
  
  public func deserialize(_ str: String) -> BTTree?  {
    
    var list: [String] = str.components(separatedBy: ",")
    if list.isEmpty {
      return nil
    }
    
    let node = myDeserialize(&list)
    return node
  }

  private func myDeserialize(_ list: inout [String]) -> BTTree? {
    let s = list.remove(at: 0)
    if s == "$" {
      return nil
    }
    
    let iv = Int(s)!
    let node: BTTree? = BTTree(value: iv)
    node?.left = myDeserialize(&list)
    node?.right = myDeserialize(&list)
    return node
  }
  
}

// 面试题38：字符串的排列
// 题目：输入一个字符串，打印出该字符串中字符的所有排列。例如输入字符串abc，
// 则打印出由字符a、b、c所能排列出来的所有字符串abc、acb、bac、bca、cab和cba。

public class MyPermutation {
  public func excute(_ s: String) -> [String] {

    let list = s.map { $0 }
    var used = Array(repeating: false, count: list.count)
    var res = [String]()
    var path = [Character]()
    
    dfs(list, &path, &used, 0, &res)

    return res
    
  }
  
  private func dfs(_ list: [Character],
                   _ path: inout [Character],
                   _ used: inout [Bool],
                   _ idx : Int,
                   _ res: inout [String]) {
    if idx == list.count {
      res.append(String(path))
      return
    }
    
    for i in 0 ..< list.count {
      if !used[i] {
        path.append(list[i])
        used[i] = true
        dfs(list, &path, &used, idx + 1, &res)
        path.removeLast()
        used[i] = false
      }
    }
  }
}

// 面试题39：数组中出现次数超过一半的数字
// 题目：数组中有一个数字出现的次数超过数组长度的一半，请找出这个数字。例
// 如输入一个长度为9的数组{1, 2, 3, 2, 2, 2, 5, 4, 2}。由于数字2在数组中
// 出现了5次，超过数组长度的一半，因此输出2。
public class MyMoreThanHalf {
  // 技巧，不想等就抵消一次
  public func find(_ list: [Int]) -> Int {
    if list.count <= 1 {
      return 0
    }
    var last: Int = list[0]
    var count: Int = 0
    for i in 1 ..< list.count {
      if count == 0 {
        last = list[i]
        count += 1
      } else if list[i] == last {
        count += 1
      } else {
        count -= 1
      }
    }
    return last
  }
}

// 采用排序，之后，取值; 快速排序
public class MyMoreThanHalf2 {
  
  public func find(_ source: [Int]) -> Int {
    var list = source

    if source.count <= 1 {
      return 0
    }
    
    // check
    let middle = list.count >> 1
    var start = 0
    var end = list.count - 1
    
    var index = partition(&list, start, end)
    while index != middle  {
      if index > middle {
        end = index - 1
        index = partition(&list, start, end)
      } else {
        start = index + 1
        index = partition(&list, start, end)
      }
    }
    let result = list[middle]
    if checkMoreThanHalf(list, result) {
      return result
    }
    return 0
  }
  
  private func partition(_ list: inout [Int],
                         _ start: Int,
                         _ end: Int) -> Int {

    var povit = (start ... end).randomElement()!
    list.swapAt(povit, end)
    
    var small = start - 1
    for idx in start ..< end {
      if list[idx] < list[end] {
        small += 1
        if small != idx {
          list.swapAt(small, idx)
        }
      }
    }
    
    small += 1
    list.swapAt(small, end)
    
    return small
  }
  
  private func checkMoreThanHalf(_ list: [Int], _ number: Int) -> Bool {
    let times = list.filter({ $0 == number })
    if list.count - times.count - times.count < 0 {
      return true
    }
    return false
  }
}

// 面试题40：最小的k个数
// 题目：输入n个整数，找出其中最小的k个数。例如输入4、5、1、6、2、7、3、8
// 这8个数字，则最小的4个数字是1、2、3、4。
// 法一：快排，返回 前k个值
// 法二：k个的集合，遍历后续的与集合比较，大的移除并更新， 堆的方式
public class MyLowestKth {
  
  func find(_ source: [Int], _ k: Int) -> [Int] {
    if k > source.count || k <= 0 {
      return [Int]()
    }
    var list = source
    var l = 0
    var r = source.count - 1
    var idx = partition(&list, l, r)
    while idx != k - 1 {
      if idx > k - 1 {
        r = idx - 1
        idx = partition(&list, l, r)
      } else {
        l = idx + 1
        idx = partition(&list, l, r)
      }
    }
    
    let result = Array(list.prefix(k))
    return result
  }
    
  private func randomPivotIndex(_ l: Int, _ r: Int) -> Int {
    let range = l ... r
    let idx = range.randomElement()
    return idx!
  }
  
  private func partition(_ list: inout [Int],
                         _ l: Int,
                         _ r: Int) -> Int {
    if l == r {
      return l
    }
    let pivot = randomPivotIndex(l, r)
    list.swapAt(r, pivot)
    var i = l - 1
    for j in l ... r - 1 {
      if list[j] < list[r] {
        i += 1
        list.swapAt(i, j)
      }
    }
    i += 1
    list.swapAt(i, r)
    return i
  }
  
}


fileprivate extension Int {
  var leftChildIndex: Int { return 2 * self + 1 }
  var rightChildIndex: Int { return 2 * self + 2 }
  var parentIndex: Int { return (self - 1)/2 }
  var isRoot: Bool { return self == 0 }
}
// swift 中实现 堆结构
public struct MyHeap<T> {
  var elements: [T]
  var priorityFunction: (T, T) -> Bool
  
  init(elements: [T], priorityFunction: @escaping (T, T) -> Bool) {
    self.elements = elements
    self.priorityFunction = priorityFunction
    buildHeap()
  }
  
  init(priorityFunction: @escaping (T, T) -> Bool) {
    elements = [T]()
    self.priorityFunction = priorityFunction
  }
  
  var count: Int { return elements.count }
  var isEmpty: Bool { return elements.isEmpty }
  
  var peek: T? {
    return elements.first
  }
  
  private mutating func buildHeap() {
    for i in (0 ..< count).reversed() {
      siftDown(for: i)
    }
    
  }
  
  mutating func enqueue(_ e: T) {
    elements.append(e)
    siftUp(for: count - 1)
  }
  
  @discardableResult
  mutating func dequeue() -> T? {
    if isEmpty {return nil}
    swapElement(elementAt: 0, with: count - 1)
    let last = elements.removeLast()
    if !isEmpty {
      siftDown(for: 0)
    }
    return last
  }
  
  mutating func siftUp(for index: Int) {
    let parent = index.parentIndex
    guard !index.isRoot, isHighestPriority(at: index, than: parent) else {
      return
    }
    swapElement(elementAt: index, with: parent)
    siftUp(for: parent)
  }
  
  mutating func siftDown(for index: Int) {
    let highestIndex = highestPriority(for: index)
    if highestIndex == index {
      return
    }
    swapElement(elementAt: highestIndex, with: index)
    siftDown(for: highestIndex)
  }
  
  private func isHighestPriority(at lhf: Int, than rhf: Int) -> Bool {
    priorityFunction(elements[lhf], elements[rhf])
  }
  
  private func highestPriority(at parentIndex: Int, with childIndex: Int) -> Int {
    guard childIndex < count, isHighestPriority(at: childIndex, than: parentIndex) else {
      return parentIndex
    }
    return childIndex
  }
  
  private func highestPriority(for parent: Int) -> Int {
    let f = highestPriority(at: parent, with: parent.leftChildIndex)
    return highestPriority(at: f, with: parent.rightChildIndex)
  }
  
  mutating func swapElement(elementAt index: Int, with rhf: Int) {
    elements.swapAt(index, rhf)
  }
  
}

// 面试题41：数据流中的中位数
// 题目：如何得到一个数据流中的中位数？如果从数据流中读出奇数个数值，那么
// 中位数就是所有数值排序之后位于中间的数值。如果从数据流中读出偶数个数值，
// 那么中位数就是所有数值排序之后中间两个数的平均值。
//解决思路：构建一个大顶堆存小的一半数，构建一个小顶堆，存大的一半数

public class MyMiddleFind {
  // 小顶堆， 后半部分，大数据
  var minHeap = MyHeap<Int>(priorityFunction: <)
  // 大顶堆, 前半部分小数据
  var maxHeap = MyHeap<Int>(priorityFunction: >)
  
  public func append(_ e: Int) {
    maxHeap.enqueue(e)
    if let top = maxHeap.peek {
      minHeap.enqueue(top)
      maxHeap.dequeue()
    }
    
    if maxHeap.count < minHeap.count {
      if let top = minHeap.peek {
        maxHeap.enqueue(top)
        minHeap.dequeue()
      }
    }
  }
  
  public func getMedian() -> Double? {
    guard !maxHeap.isEmpty else {
      return nil
    }
    
    if maxHeap.count > minHeap.count {
      return Double(maxHeap.peek!)
    }
    
    if let top1 = maxHeap.peek,
      let top2 = minHeap.peek {
      return Double((top1 + top2)) / 2.0
    }
    return nil
  }
  
}
// 面试题42：连续子数组的最大和
// 题目：输入一个整型数组，数组里有正数也有负数。数组中一个或连续的多个整
// 数组成一个子数组。求所有子数组的和的最大值。要求时间复杂度为O(n)。
public class MyMaxSubSum {
  func get(_ list: [Int]) -> Int {

    if list.isEmpty {
      return Int.min
    }
    var sum = 0
    var greatest = Int.min
    
    for i in list {
      if sum <= 0 {
        sum = i
      } else {
        sum += i
      }
      if sum > greatest {
        greatest = sum
      }
    }
    
    return greatest
  }
}

// 面试题43：从1到n整数中1出现的次数
// 题目：输入一个整数n，求从1到n这n个整数的十进制表示中1出现的次数。例如
// 输入12，从1到12这些整数中包含1 的数字有1，10，11和12，1一共出现了5次。
public class NumberOf1My {
  public func count(_ n: Int) -> Int {
    if n <= 0 { return 0 }
    var sum = 0
    for i in 0 ... n {
      sum += oneTimes(i)
    }
    return sum
  }
  
  func oneTimes(_ i: Int) -> Int {
    var n = i
    var times = 0
    while n > 0 {
      if n % 10 == 1 {
        times += 1
      }
      n /= 10
    }
    return times
  }
}

public class NumberOf1My2 {
  public func count(_ n: Int) -> Int {
    if n <= 0 { return 0 }
    var count = 0
    var base = 1 // 从各位开始
    var round = n //
    while round > 0 {
      let weight = round % 10 // 当前位
      round /= 10 // 多少轮， 前一位决定多少轮
      count += base * round // 当前位经理多少次
      
      if weight == 1 {
        count += (n % base) + 1
      } else if weight > 1 {
        count += base // 当前base的次数
      }
      base *= 10
    }
    
    return count
  }
}

// 面试题45：把数组排成最小的数
// 题目：输入一个正整数数组，把数组里所有数字拼接起来排成一个数，打印能拼
// 接出的所有数字中最小的一个。例如输入数组{3, 32, 321}，则打印出这3个数
// 字能排成的最小数字321323。
public class MySortedList {
  func min(_ list: [Int]) -> String {
    if list.isEmpty {
      return ""
    }
    
    var source = list.map({ String($0) })
    source = source.sorted(by: { (lhf, rhf) -> Bool in
      lhf + rhf < rhf + lhf
    })
    
    var res = ""
    for i in source {
      res += i
    }
    return res
  }
}

public class MySortedList2 {
  func min(_ list: [Int]) -> String {
    if list.isEmpty {
      return ""
    }
    
    var source = list.map({ String($0) })
    quickSort(&source, 0, source.count - 1)
    var res = ""
    for i in source {
      res += i
    }
    return res
  }
  
  private func quickSort(_ list: inout [String], _ l: Int, _ r: Int) {
    if l < r {
      let pivot = partition(&list, l, r)
      quickSort(&list, l, pivot - 1)
      quickSort(&list, pivot+1, r)
    }
  }
  
  private func partition(_ list: inout [String],
                         _ l: Int,
                         _ r: Int) -> Int {
    let p = (l ... r).randomElement()!
    list.swapAt(p, r)
    var i = l - 1
    for j in l ..< r {
      if list[j] + list[r] < list[r] + list[j] {
        i += 1
        list.swapAt(i, j)
      }
    }
    i += 1
    list.swapAt(i, r)
    return i
  }
}
