//
//  File.swift
//  
//
//  Created by miao gaoliang on 2020/11/3.
//

import Foundation

public func makeRandomList(_ count: Int,
                           _ from: Int = 0,
                           _ to: Int = 100) -> [Int] {
  var list = [Int]()
  var i = 0
  while i < count {
    let range = from ... to
    list.append(range.randomElement()!)
    i += 1
  }
  return list
}

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
  
  static func connect(_ current: LKNode?,  next: LKNode? ) {
    if current != nil {
      current?.next = next
    }
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

extension BTTree: Equatable {
  public static func == (lhs: BTTree, rhs: BTTree) -> Bool {
    Unmanaged.passUnretained(lhs).toOpaque() ==  Unmanaged.passUnretained(rhs).toOpaque()
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
  // 无效数据
  case invaildData
  // 越界
  case overflows
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
    for i in (0 ..< count/2).reversed() {
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

// 面试题46：把数字翻译成字符串
// 题目：给定一个数字，我们按照如下规则把它翻译为字符串：0翻译成"a"，1翻
// 译成"b"，⋯⋯，11翻译成"l"，⋯⋯，25翻译成"z"。一个数字可能有多个翻译。例
// 如12258有5种不同的翻译，它们分别是"bccfi"、"bwfi"、"bczi"、"mcfi"和
// "mzi"。请编程实现一个函数用来计算一个数字有多少种不同的翻译方法。
public class MyTranslation {
  func translation(_ n: Int) -> Int {
    if n < 0 { return 0 }
    if n < 10 {
      return 1
    }
    let str = String(n)
    let cs = Array(str)
    var a = 1, b = 1
    var i = 2
    while cs.count >= i {
      let sub = String(cs[i-2 ..< i])
      let c: Int
      if sub >= "10" && sub <= "25" {
        c = a + b
      } else {
        c = a
      }
      b = a
      a = c
      
      i += 1
    }
    return a
  }
}

// 面试题47：礼物的最大价值
// 题目：在一个m×n的棋盘的每一格都放有一个礼物，每个礼物都有一定的价值
// （价值大于0）。你可以从棋盘的左上角开始拿格子里的礼物，并每次向左或
// 者向下移动一格直到到达棋盘的右下角。给定一个棋盘及其上面的礼物，请计
// 算你最多能拿到多少价值的礼物？
public class MyMaxGiftValue {
  func getGiftMaxValue(_ list: [[Int]]) -> Int {
    var gird = list
    if gird.isEmpty {
      return 0
    }
    
    let rows = gird.count
    let cols = gird[0].count
    
    guard rows > 0, cols > 0 else {
      return 0
    }
    
    // first rows
    var j = 1
    while cols > j {
      gird[0][j] = gird[0][j - 1] + gird[0][j]
      j += 1
    }
    
    // first cols
    var i = 1
    while rows > i {
      gird[i][0] = gird[i - 1][0] + gird[i][0]
      i += 1
    }
    
    i = 1
    while i < rows {
      j = 1
      while j < cols {
        gird[i][j] = max(gird[i-1][j], gird[i][j - 1]) + gird[i][j]
        j += 1
      }
      i += 1
    }
    
    return gird[rows - 1][cols - 1]
  }
}

// 面试题48：最长不含重复字符的子字符串
// 题目：请从字符串中找出一个最长的不包含重复字符的子字符串，计算该最长子
// 字符串的长度。假设字符串中只包含从'a'到'z'的字符。
public class MyMaxDuplicationSubString {
  func getDuplicateSubLength(_ s: String) -> Int {

    var current = 0
    var maxLength = 0
    var position = Array<Int>(repeating: -1, count: 26)
    var start: UInt8!  = Character("a").asciiValue
    var i = 0
    while i < s.count {
      let value: UInt8 = s[i].asciiValue!
      let index = Int(value - start)
      let pre: Int = position[index]
      let distance = i - pre
      if pre < 0 || distance > current {
        current += 1
      } else {
        if current > maxLength {
          maxLength = current
        }
        current = distance
      }
      position[index] = i
      
      i += 1
    }

    if current > maxLength {
      maxLength = current
    }
    
    return maxLength
  }
  

}
// 面试题49：丑数
// 题目：我们把只包含因子2、3和5的数称作丑数（Ugly Number）。求按从小到
// 大的顺序的第1500个丑数。例如6、8都是丑数，但14不是，因为它包含因子7。
// 习惯上我们把1当做第一个丑数。
public class NthUglyNumber {
  public func ugly(_ n: Int) -> Int {
    if n <= 0 {return 0}
    if n == 1 {return 1}
    var dp = Array<Int>(repeating: 1, count: n)
    var a2 = 0, b3 = 0, c5 = 0
    
    for i in 1 ..< n {
      let n2 = dp[a2] * 2
      let n3 = dp[b3] * 3
      let n5 = dp[c5] * 5
      let m1 = min(n2, n3)
      dp[i] = min(m1, n5)
      
      if dp[i] == n2 { a2 += 1}
      if dp[i] == n3 { b3 += 1}
      if dp[i] == n5 { c5 += 1}
    }
    return dp[n - 1]
  }
}

// 面试题50（一）：字符串中第一个只出现一次的字符
// 题目：在字符串中找出第一个只出现一次的字符。如输入"abaccdeff"，则输出
// 'b'。
public class FirstNotRepeatChar {
  public func only1thCharacter(_ s: String) -> Character {
    if s.isEmpty {
      return "\0"
    }
    var counter = Array<Int>(repeating: 0, count: 256)
    var order = [Int]() // Character 的 asicc 码值
    for c in s {
      let ascii = Int(c.asciiValue!)
      counter[ascii] += 1
      if counter[ascii] == 1 {
        order.append(ascii)
      }
    }

    for i in order {
      if counter[i] == 1 {
        return Character(Unicode.Scalar(i)!)
      }
    }
    
    return "\0"
  }
}
// 面试题50（二）：字符流中第一个只出现一次的字符
// 题目：请实现一个函数用来找出字符流中第一个只出现一次的字符。例如，当从
// 字符流中只读出前两个字符"go"时，第一个只出现一次的字符是'g'。当从该字
// 符流中读出前六个字符"google"时，第一个只出现一次的字符是'l'。
public class FirstNotRepeatCharInStringStream {
  var counter = Array<Int>(repeating: 0, count: 256)
  var order = Array<Int>()
  public func append(_ c: Character) {
    if let ascii = c.asciiValue {
      let v = Int(ascii)
      if counter[v] == 0 {
        order.append(v)
      }
      
      if counter[v] < 2 {
        counter[v] += 1
      }
    }
  }
  
  public func getFirst() -> Character {
    for asicc in order {
      if counter[asicc] == 1 {
        return Character(Unicode.Scalar(asicc)!)
      }
    }
    return "\0"
  }
  
}

// 归并排序 https://visualgo.net/en/sorting
public class MergeSort {
  public func sort(_ list: [Int]) -> [Int] {
    /*
     将数组分割 L,R, 持续分割到不可分割，L,R 仅一个元素,开始上升
     合并 L， R， 递归网上合并
     合并完毕之后，更新 list
     */
    var source = list
    core(&source, 0, source.count - 1)
    return source
  }
  
  private func core(_ list: inout [Int],
                    _ l: Int,
                    _ r: Int) {
    if l < r {
      let q = (l + r) / 2
      core(&list, l, q)
      core(&list, q + 1, r)
      merge(&list, l, q, r)
    }
  }
  
  private func merge(_ list: inout [Int],
                     _ l: Int,
                     _ q: Int,
                     _ r: Int) {
    var left = [Int]()
    if l <= q {
      left.append(contentsOf: list[l...q])
    }
    
    var right = [Int]()
    if q + 1 <= r {
      right.append(contentsOf: list[q+1 ... r])
    }
    
    var i = 0
    var j = 0
    var k = l
    while i < left.count, j < right.count {
      if left[i] < right[j] {
        list[k] = left[i]
        i += 1
      } else {
        list[k] = right[j]
        j += 1
      }
      k += 1
    }
    
    while i < left.count {
      list[k] = left[i]
      i += 1
      k += 1
    }
    
    while j < right.count {
      list[k] = right[j]
      j += 1
      k += 1
    }
  }
}

// 面试题51：数组中的逆序对
// 题目：在数组中的两个数字如果前面一个数字大于后面的数字，则这两个数字组
// 成一个逆序对。输入一个数组，求出这个数组中的逆序对的总数。

public class MyReversePairs {
  func reversePairsCount(_ nums: [Int]) -> Int {
    if nums.count < 2 {
      return 0
    }
    var tmp = Array(nums)
    var copy = Array(nums)
    
    return reversePairs(&copy, 0, nums.count - 1, &tmp)
  }
  
  private func reversePairs(_ nums: inout [Int], _ l: Int, _ r: Int, _ tmp: inout [Int]) -> Int {
    if l == r {
      return 0
    }
    let middle = l + (r - l) / 2
    let leftPairs = reversePairs(&nums, l, middle, &tmp)
    let rightPairs = reversePairs(&nums, middle + 1, r, &tmp)
    if nums[middle] < nums[middle + 1] {
      return leftPairs + rightPairs
    }
    let crossPairs = mergeAndCount(&nums, l, r, middle, &tmp)
    return leftPairs + crossPairs + rightPairs
  }
  
  private func mergeAndCount(_ nums: inout [Int], _ l: Int, _ r: Int, _ mid: Int, _ tmp: inout [Int]) -> Int {
    for i in l ... r {
      tmp[i] = nums[i]
    }
    var i = l
    var j = mid + 1
    
    var count = 0
    for k in l ... r {
      if i == mid + 1 {
        nums[k] = tmp[j]
        j += 1
      } else if j == r + 1 {
        nums[k] = tmp[i]
        i += 1
      } else if tmp[i] <= tmp[j] {
        nums[k] = tmp[i]
        i += 1
      } else {
        nums[k] = tmp[j]
        j += 1
        count += (mid - i + 1)
      }
    }
    return count
  }
  
}

// 面试题52：两个链表的第一个公共结点
// 题目：输入两个链表，找出它们的第一个公共结点。
public class FirstCommonNode {
  public func solution(_ l1: LKNode?, _ l2: LKNode?) -> LKNode? {
    // 思路： 统计2链表的长度，长的先走detal 步；
    
    let l1Count = linkCount(l1)
    let l2Count = linkCount(l2)
    var p1 = l1
    var p2 = l2
    if l1Count > l2Count {
      p1 = linkKStep(p1, l1Count - l2Count)
    } else {
      p2 = linkKStep(p2, l2Count - l1Count)
    }
    
    if p1 == nil || p2 == nil {
      return nil
    }
    
    while p1 != nil, p2 != nil, p1?.value != p2?.value {
      p1 = p1?.next
      p2 = p2?.next
    }
    return p1
  }
  
  private func linkKStep(_ node: LKNode?, _ step: Int) -> LKNode? {
    var k = step
    var p = node
    while k > 0 {
      p = p?.next
      k -= 1
    }
    return p
  }
  
  private func linkCount(_ node: LKNode?) -> Int {
    var n1 = node
    var count = 0
    while n1 != nil {
      n1 = n1?.next
      count += 1
    }
    return count
  }
}

// 面试题53（一）：数字在排序数组中出现的次数
// 题目：统计一个数字在排序数组中出现的次数。例如输入排序数组{1, 2, 3, 3,
// 3, 3, 4, 5}和数字3，由于3在这个数组中出现了4次，因此输出4。
public class MyFindKInSortedListCount {
  
  /// 获取列表中k出现的次数
  /// - Parameters:
  ///   - list: sorted list
  ///   - k: number k
  /// - Returns: k show times; NotFound = -1
  public func find(_ list: [Int], _ k: Int) -> Int {

    let first = findFirstKIndex(list, k)
    if first < 0 {
      return -1
    }
    let last = findLastKIndex(list, k)
    return last - first + 1
  }
  
  private func findFirstKIndex(_ list: [Int], _ k: Int) -> Int {
    var low = 0
    var high = list.count - 1
    while low <= high {
      let middle = low + (high - low) / 2
      if list[middle] > k {
        high = middle - 1
      } else if list[middle] < k {
        low = middle + 1
      } else {
        if middle == 0 || list[middle - 1] != k {
          return middle
        } else {
          high = middle - 1
        }
      }
    }
    
    return -1
  }
  
  private func findLastKIndex(_ list: [Int], _ k: Int) -> Int {
    var low = 0
    var high = list.count - 1
    while low <= high {
      let middle = low + (high - low) / 2
      if list[middle] < k {
        low = middle + 1
      } else if list[middle] > k {
        high = middle - 1
      } else {
        if middle == list.count - 1 || list[middle + 1] != k {
          return middle
        } else {
          low = middle + 1
        }
      }
    }
    return -1
  }
}

// 面试题53（二）：0到n-1中缺失的数字
// 题目：一个长度为n-1的递增排序数组中的所有数字都是唯一的，并且每个数字
// 都在范围0到n-1之内。在范围0到n-1的n个数字中有且只有一个数字不在该数组
// 中，请找出这个数字。

public class FindMissNumber {
  
  public func find(_ list: [Int]) -> Int {
    if list.isEmpty {return -1}
    var low = 0
    var high = list.count - 1
    while low <= high {
      let m = low + (high - low) / 2
      if list[m] != m {
        if m == 0 || list[m - 1] == m - 1 {
          return m
        }
        high = m - 1
      } else {
        low = m + 1
      }
    }
    if low == list.count {
      return low
    }
    return -1
  }
}

// 面试题53（三）：数组中数值和下标相等的元素
// 题目：假设一个单调递增的数组里的每个元素都是整数并且是唯一的。请编程实
// 现一个函数找出数组中任意一个数值等于其下标的元素。例如，在数组{-3, -1,
// 1, 3, 5}中，数字3和它的下标相等。

public class MyNumberEqualIndex {
  
  /// 列表中元素与索引相等的值
  /// - Parameter list: 入参数列表
  /// - Returns: 找到返回 > 0 , 未找到 -1
  func find(_ list: [Int]) -> Int {
    if list.isEmpty {
      return -1
    }
    var low = 0
    var high = list.count - 1
    while low <= high {
      let m = low + (high - low) / 2
      if list[m] == m {
        return m
      } else if list[m] < m {
        low = m + 1
      } else {
        high = m - 1
      }
    }
    
    return -1
  }
}

// 面试题54：二叉搜索树的第k个结点
// 题目：给定一棵二叉搜索树，请找出其中的第k大的结点。
public class KthNodeInBSTree {
  func node(_ root: BTTree?, _ k: Int) -> Int {
    if root == nil || k <= 0 {
      return -1
    }
    var f = k
    let r = dfs(root, &f)
    return r?.value ?? -1
  }
  
  private func dfs(_ root: BTTree?,
                   _ k: inout Int) -> BTTree? {
    var target: BTTree? = nil
    if root?.left != nil {
      target = dfs(root?.left, &k)
    }
    
    if target == nil {
      if k == 1 {
        target = root
      }
      k -= 1
    }
    
    if target == nil, root?.right != nil {
      target = dfs(root?.right, &k)
    }
    return target
  }
  
}

// 面试题55（一）：二叉树的深度
// 题目：输入一棵二叉树的根结点，求该树的深度。从根结点到叶结点依次经过的
// 结点（含根、叶结点）形成树的一条路径，最长路径的长度为树的深度。

public  class DeepTree1 {
  func deep(_ root: BTTree?) -> Int {
    let r = dfs(root, 0)
    return r
  }
  
  private func dfs(_ root: BTTree?, _ deep: Int) -> Int {
    if root == nil {
      return deep
    }
    let left = dfs(root?.left, deep + 1)
    let right = dfs(root?.right, deep + 1)
    return max(left, right)
  }
}

public class DeepTree2 {
  func deep(_ root: BTTree?) -> Int {
    return bfs(root)
  }
  
  private func bfs(_ root: BTTree?) -> Int {
    if root == nil {
      return 0
    }
    var queue = [BTTree]()
    var levelQueue = [BTTree]()
    var deep = 0
    queue.append(root!)
    while !queue.isEmpty {
      while !queue.isEmpty {
        let top = queue.removeLast()
        top.left.map({ levelQueue.append($0) })
        top.right.map({ levelQueue.append($0) })
      }
      deep += 1
      queue.append(contentsOf: levelQueue)
      levelQueue.removeAll()
    }
    return deep
  }
}

public class DeepTree3 {
  func deep(_ root: BTTree?) -> Int {
    var deep = 0
    dfs(root, &deep)
    return deep
  }
  
  private func dfs(_ root: BTTree?, _ deep: inout Int){
    if root == nil {
      deep = 0
      return
    }
    var left = 0
    var right = 0
    dfs(root?.left, &left)
    dfs(root?.right, &right)
    deep = 1 + max(left, right)
  }
}

// 面试题55（二）：平衡二叉树
// 题目：输入一棵二叉树的根结点，判断该树是不是平衡二叉树。如果某二叉树中
// 任意结点的左右子树的深度相差不超过1，那么它就是一棵平衡二叉树。
public class BalancedBTree1 {
  public func isBalance(_ root: BTTree?) -> Bool {
    if root == nil {
      return true
    }
    let leftDeep = deep(root?.left)
    let rightDeep = deep(root?.right)
    let d = leftDeep - rightDeep
    if d < -1 || d > 1 {
      return false
    }
    return isBalance(root?.left) && isBalance(root?.right)
  }
  
  private func deep(_ root: BTTree?) -> Int {
    if root == nil {
      return 0
    }
    let left = deep(root?.left)
    let right = deep(root?.right)
    return left > right ? (left + 1) : (right + 1)
  }
}

public class BalancedBTree2 {
  public func isBalance(_ root: BTTree?) -> Bool {
    var deep = 0
    return dfs(root, &deep)
  }
  
  public func dfs(_ root: BTTree?, _ deep: inout Int) -> Bool {
    if root == nil {
      deep = 0
      return true
    }
    var left = 0
    var right = 0
    if dfs(root?.left, &left) && dfs(root?.right, &right) {
      if left - right <= 1 && left - right >= -1 {
        deep = 1 + max(left, right)
        return true
      }
    }
    return false
  }
}

// 面试题56（一）：数组中只出现一次的两个数字
// 题目：一个整型数组里除了两个数字之外，其他的数字都出现了两次。请写程序
// 找出这两个只出现一次的数字。要求时间复杂度是O(n)，空间复杂度是O(1)。
public class FindNumsAppearOnce {
  public func find(_ list: [Int]) -> [Int] {
    if list.count < 2 {
      return [Int]()
    }
    var number = 0
    list.forEach { (item) in
      number ^= item
    }

    var a: Int = 0
    var b: Int = 0
    
    let index: Int = firstBitIndex(number)
    for num in list {
      if num & index == 0 {
        a ^= num
      } else {
        b ^= num
      }
    }
    return [a, b]
  }
  
  private func firstBitIndex(_ num: Int) -> Int {
    var index = 1
    while num & index == 0,  index < 8 * MemoryLayout<Int>.size {
      index <<= 1
    }
    return index
  }
}

// 面试题56（二）：数组中唯一只出现一次的数字
// 题目：在一个数组中除了一个数字只出现一次之外，其他数字都出现了三次。请
// 找出那个吃出现一次的数字。
public class FindNumsAppearOnce1 {
  public func find(_ list: [Int]) -> [Int] {
    if list.count < 4 {
      return [Int]()
    }
    // 思路累加个个位，3次，对3 取余
    let size = MemoryLayout<Int>.size
    var bits = Array<Int>(repeating: 0, count: 8 * size)
    
    for item in list {
      var mask = 1
      for i in 0 ..< bits.count {
        if item & mask != 0 {
          bits[i] += 1
        }
        mask <<= 1
      }
    }
    
//    var mask = 1
//    var sum = 0
//    for i in 0 ..< bits.count {
//      sum |= (bits[i] % 3) * mask
//      mask <<= 1
//    }
    // 高位逆序移位
    var sum = 0
    for i in (0 ..< bits.count).reversed() {
      sum <<= 1
      sum |= (bits[i] % 3)
    }
    
    return [sum]
  }
}

public class FindNumsAppearOnce2 {
  public func find(_ list: [Int]) -> [Int] {
    if list.count < 4 {
      return [Int]()
    }
  
    var x = 0, y = 0
    for num in list {
      x = (x ^ num) & ~y
      y = (y ^ num) & ~x
    }
    return [x]
  }
}

// 面试题57（一）：和为s的两个数字
// 题目：输入一个递增排序的数组和一个数字s，在数组中查找两个数，使得它们
// 的和正好是s。如果有多对数字的和等于s，输出任意一对即可。
public class MyNumberSum {
  func find(_ list: [Int], _ target: Int) -> [Int] {
    if list.count < 2 {
      return [Int]()
    }
    var low = 0
    var high = list.count - 1
    while low <= high {
      let tmp = list[low] + list[high]
      if list[low] + list[high] == target {
        return [list[low], list[high]]
      } else if tmp > target {
        high -= 1
      } else {
        low += 1
      }
    }
    return [Int]()
  }
}

// 面试题57（二）：为s的连续正数序列
// 题目：输入一个正数s，打印出所有和为s的连续正数序列（至少含有两个数）。
// 例如输入15，由于1+2+3+4+5=4+5+6=7+8=15，所以结果打印出3个连续序列1〜5、
// 4〜6和7〜8。
public class FindContinuousSequence {
  func find(_ target: Int) -> [[Int]] {
    if target < 3 {
      return [[Int]]()
    }
    var low = 1
    var high = 2
    let end = 1 +  (target - 1) / 2
    var sum = low + high
    var res = [[Int]]()
    while low < end {
      if sum == target {
        // 数组的连续集合生成
        res.append(Array(low...high))
        sum -= low
        low += 1
      }
      else if sum > target {
        sum -= low
        low += 1
      } else {
        high += 1
        sum += high
      }
    }
    return res
  }
}

// 面试题58（一）：翻转单词顺序
// 题目：输入一个英文句子，翻转句子中单词的顺序，但单词内字符的顺序不变。
// 为简单起见，标点符号和普通字母一样处理。例如输入字符串"I am a student. "，
// 则输出"student. a am I"。
public class ReverseSentence {
  func reverse(_ s: String) -> String {
    var cs: [Character] = Array(s)
    coreReverse(&cs, 0, cs.count - 1)

    var i = 0
    var j = 0
    while j < cs.count {
      if cs[i] == " " {
        i += 1
        j += 1
      } else if cs[j] == " " || j == cs.count {
        coreReverse(&cs, i, j-1)
        i = j
      } else {
        j += 1
        if j == cs.count {
          coreReverse(&cs, i, j-1)
          i = j
        }
      }
    }
    
    return String(cs)
  }
  
  private func coreReverse(_ s: inout [Character], _ left: Int, _ right: Int) {
    if s.isEmpty || s.count < 2 {
      return
    }
    var l = left
    var r = right
    while l < r {
      s.swapAt(l, r)
      l += 1
      r -= 1
    }
  }
}

// 面试题58（二）：左旋转字符串
// 题目：字符串的左旋转操作是把字符串前面的若干个字符转移到字符串的尾部。
// 请定义一个函数实现字符串左旋转操作的功能。比如输入字符串"abcdefg"和数
// 字2，该函数将返回左旋转2位得到的结果"cdefgab"。
public class LeftRotateString {
  func rotate(_ s: String, _ n: Int) -> String {
    if n > s.count {
      return s
    }
    if s.isEmpty {
      return s
    }
    
    var cs = Array(s)
    coreReverse(&cs, 0, n - 1)
    coreReverse(&cs, n, cs.count - 1)
    coreReverse(&cs, 0, cs.count - 1)
    return String(cs)
  }
  
  private func coreReverse(_ s: inout [Character], _ left: Int, _ right: Int) {
    if right - left < 1 {
      return
    }
    var l = left
    var r = right
    while l < r {
      s.swapAt(l, r)
      l += 1
      r -= 1
    }
  }
}

// 面试题59（一）：滑动窗口的最大值
// 题目：给定一个数组和滑动窗口的大小，请找出所有滑动窗口里的最大值。例如，
// 如果输入数组{2, 3, 4, 2, 6, 2, 5, 1}及滑动窗口的大小3，那么一共存在6个
// 滑动窗口，它们的最大值分别为{4, 4, 6, 6, 6, 5}，

public class SlideWindow {
  func slideMaxValues(_ list: [Int], _ k: Int) -> [Int] {
    guard k >= 1, list.count >= k else {
      return [Int]()
    }
    var indexs = [Int]()
    var res = [Int]()
    var i = 0
    while i < k {
      while !indexs.isEmpty, list[indexs.last!] < list[i] {
        indexs.removeLast()
      }
      indexs.append(i)
      i += 1
    }
    
    indexs.first.map({ res.append(list[$0]) })
    while i < list.count {
      if let first = indexs.first, first == i - k {
        indexs.remove(at: 0)
      }
      while !indexs.isEmpty, list[indexs.last!] < list[i] {
        indexs.removeLast()
      }
      indexs.append(i)
      res.append(list[indexs.first!])
      i += 1
    }
    return res
  }
}

// 面试题59（二）：队列的最大值
// 题目：给定一个数组和滑动窗口的大小，请找出所有滑动窗口里的最大值。例如，
// 如果输入数组{2, 3, 4, 2, 6, 2, 5, 1}及滑动窗口的大小3，那么一共存在6个
// 滑动窗口，它们的最大值分别为{4, 4, 6, 6, 6, 5}，

public class NumbersStreamMax {
  var index = 0
  var queue = [InternalData]()
  var maxQueue = [InternalData]()
  
  public func append(_ number: Int) {
    while !maxQueue.isEmpty, maxQueue.last!.number <= number {
      maxQueue.removeLast()
    }
    let info = InternalData(index: index, number: number)
    queue.append(info)
    maxQueue.append(info)
    index += 1
  }
  
  public func removeFront() throws {
    if maxQueue.isEmpty {
      throw BrickError.empty
    }
    
    if maxQueue.first?.index == queue.first?.index {
      maxQueue.removeFirst()
    }
    queue.remove(at: 0)
  }
  
  public func currentMax() throws -> Int {
    if maxQueue.isEmpty {
      throw BrickError.empty
    }
    return maxQueue.first!.number
  }
  
  struct InternalData {
    let index: Int
    let number: Int
  }
}

// 面试题60：n个骰子的点数
// 题目：把n个骰子扔在地上，所有骰子朝上一面的点数之和为s。输入n，打印出s
// 的所有可能的值出现的概率。
public class MyProbability {
  let maxValue = 6
  // 采用 map 的结果返回，方便测试
  func get(_ number: Int) throws -> [Int: Double] {
    if number < 1 {
      throw BrickError.invaildInput(number)
    }
    let len = maxValue * number + 1
    var probalit: [[Int]] = Array(repeating: Array(repeating: 0, count: len), count: 2)
    
    var flag = 0
    for i in 1 ... maxValue {
      probalit[flag][i] = 1
    }
    
    // 骰子的个数
    var k = 2
    while k <= number {
      
      for i in 0 ..< k {
        probalit[1 - flag][i] = 0
      }
      // 当k个骰子的 和，， 和为索引，value 为 次数
      for i in k ... maxValue * k {
        // clean
        probalit[1 - flag][i] = 0
        
        // 和为i 时，出现的次数，由上一次的 1-6构成
        let upBound = min(i, maxValue)
        for j in 1 ... upBound {
          probalit[1 - flag][i] += probalit[flag][i - j]
        }
      }
      
      // 交互数据
      flag = 1 - flag
      // 更新k
      k += 1
    }
    
    let total = pow(Double(maxValue), Double(number))
    var result = [Int: Double]()
    for i in number ... maxValue * number {
      let s: Int = probalit[flag][i]
      let ratio = Double(s) / total
      result[i] = ratio
    }
    return result
  }
}

// 面试题61：扑克牌的顺子
// 题目：从扑克牌中随机抽5张牌，判断是不是一个顺子，即这5张牌是不是连续的。
// 2〜10为数字本身，A为1，J为11，Q为12，K为13，而大、小王可以看成任意数字。

public class ContinuousCard {
  // 思路转换，将大小王 = 0， 除此之外，不能出现重复 ，false
  // max - min < 5
  public func isContinuous(_ numbers: [Int]) -> Bool {
    if numbers.isEmpty {
      return false
    }
    var only = Set<Int>()
    var low = 14
    var up = -1
    for i in numbers {
      if i > 0 {
        low = min(low, i)
        up = max(up, i)
        if only.contains(i) {
          return false
        }
        only.insert(i)
      }
    }
    
    if up - low >= 5 {
      return false
    }
    return true
  }
}
 
// 面试题62：圆圈中最后剩下的数字
// 题目：0, 1, ⋯, n-1这n个数字排成一个圆圈，从数字0开始每次从这个圆圈里
// 删除第m个数字。求出这个圆圈里剩下的最后一个数字。
public class LastRemaining {
  func remain(_ n: Int, _ m: Int) -> Int {
    if n < 1 || m < 1 {
      return -1
    }
    var p = 0
    for i in 2 ... n {
      p = (p + m) % i
    }
    return p
  }
}

// 面试题63：股票的最大利润
// 题目：假设把某股票的价格按照时间先后顺序存储在数组中，请问买卖交易该股
// 票可能获得的利润是多少？例如一只股票在某些时间节点的价格为{9, 11, 8, 5,
// 7, 12, 16, 14}。如果我们能在价格为5的时候买入并在价格为16时卖出，则能
// 收获最大的利润11。
public class StackMaxProfit {
  func profit(_ list: [Int]) -> Int {
    if list.count < 2 {
      return 0
    }

    var cost = list[0]
    var profit = list[1] - list[0]
    var i = 2
    while i < list.count {
      cost = min(list[i - 1], cost)
      profit = max(profit, list[i] - cost)
      i += 1
    }
    return profit
  }
}

// 面试题64：求1+2+⋯+n
// 题目：求1+2+⋯+n，要求不能使用乘除法、for、while、if、else、switch、case
// 等关键字及条件判断语句（A?B:C）。

public class One2NSum {
  @discardableResult
  func sum(_ n: Int, _ s: inout Int) -> Bool {
    let b = n > 0 && sum(n - 1,  &s)
    s += n
    return b
  }
}

// 面试题65：不用加减乘除做加法
// 题目：写一个函数，求两个整数之和，要求在函数体内不得使用＋、－、×、÷
// 四则运算符号。
public class MyAdd {
  func add(_ n1: Int, _ n2: Int) -> Int {
    var num1 = n1
    var num2 = n2
    var sum = 0
    var carray = 0
    repeat {
      // 相同位相加 结果与 异或 相同
      sum = num1 ^ num2
      // 产生进位
      carray = (num1 & num2) << 1
      num1 = sum
      num2 = carray
    } while num2 != 0
    
    return num1
    
  }
}

// 面试题66：构建乘积数组
// 题目：给定一个数组A[0, 1, ⋯, n-1]，请构建一个数组B[0, 1, ⋯, n-1]，其
// 中B中的元素B[i] =A[0]×A[1]×⋯ ×A[i-1]×A[i+1]×⋯×A[n-1]。不能使用除法。
public class BuildProductionArray {
  func mutil(_ list: [Double], _ out: inout [Double]) {
    if list.count < 2 {
      out = list
      return
    }
    
    out[0] = 1
    // 前半段 list0 * list1 * list2 ... * list[i -1]
    for i in 1 ..< list.count {
      out[i] = out[i - 1] * list[i - 1]
    }

    // 后半段 list[i + 1] ..* list[n-1]
    var f: Double = 1
    for i in (0 ... list.count - 2).reversed() {
      f *= list[i + 1]
      out[i] *= f
    }
  }
}

// 面试题67：把字符串转换成整数
// 题目：请你写一个函数StrToInt，实现把字符串转换成整数这个功能。当然，不
// 能使用atoi或者其他类似的库函数。
public class MyStrToInt {
  func transfer(_ info: String) throws -> Int32 {
    let str = info.trimmingCharacters(in: CharacterSet.whitespaces)
    if str.isEmpty {
      throw BrickError.empty
    }
    
    let cs = Array(str)
    var sign: Int32 = 1
    var i = 0
    var res: Int32 = 0, bndry = Int32.max / 10
    let zero = Character("0").asciiValue!
    if cs[i] == "-" {
      sign = -1
      i += 1
    } else if cs[i] == "+" {
      i += 1
    }
    for j in i ..< cs.count {
      if cs[j] < "0" || cs[j] > "9" {
        throw BrickError.invaildData
      }
      let c = Int32(cs[j].asciiValue! - zero)
      if res > bndry || (res == bndry && c > 7) {
        if sign > 0 {
          return Int32.max
        } else {
          return Int32.min
        }
      }
      res  = res * 10 + c
    }
    return sign * res
  }
}

// 面试题68：树中两个结点的最低公共祖先
// 题目：输入两个树结点，求它们的最低公共祖先。
public class MyLowestCommonAncestor {
  func lowestCommonNode(_ root: BTTree?, _ p: BTTree?, _ q: BTTree?) -> BTTree? {
    if root == nil || p == nil || q == nil {
      return nil
    }
    
    var pathP = [BTTree]()
    var pathQ = [BTTree]()
    nodePath(root, p, &pathP)
    nodePath(root, q, &pathQ)
    let node = commonAncestor(pathQ, pathP)
    return node
  }
  
  @discardableResult
  private func nodePath(_ root: BTTree?, _ node: BTTree?, _ path: inout [BTTree]) -> Bool {

    if root == node {
      return true
    }
    
    if root == nil {
      return false
    }
    
    path.append(root!)
    
    var found = false
    found = nodePath(root?.left, node, &path)
    if !found {
      found = nodePath(root?.right, node, &path)
    }
    
    if !found {
      path.removeLast()
    }
    return found
  }
  
  private func commonAncestor(_ path1: [BTTree], _ path2: [BTTree]) -> BTTree? {
    var ancestor: BTTree? = nil
    var i = 0, j = 0
    while i < path1.count, j < path2.count, path1[i] == path2[j] {
      ancestor = path2[j]
      i += 1
      j += 1
    }
    
    return ancestor
  }
}


//给你一棵以 root 为根的二叉树和一个整数 target ，请你删除所有值为 target 的 叶子节点 。
//
//注意，一旦删除值为 target 的叶子节点，它的父节点就可能变成叶子节点；如果新叶子节点的值恰好也是 target ，那么这个节点也应该被删除。
//
//也就是说，你需要重复此过程直到不能继续删除。

//链接：https://leetcode-cn.com/problems/delete-leaves-with-a-given-value
public class DeleteLeafNode {
  public func deleteLeafNode(node: BTTree?, target: Int) -> BTTree? {
    if node == nil {
      return nil
    }
    node?.left = deleteLeafNode(node: node?.left, target: target)
    node?.right = deleteLeafNode(node: node?.right, target: target)
    
    if node?.left == nil, node?.right == nil, node?.value == target {
      return nil
    }
    return node
  }
}

// s1, pattern ，pattern ，在s1 中找到与 pattern 最大长度的匹配
// Case 1： A = "Ahbesara", B = "behavior" => 2
public class LongestMatch {
  public func matchLength(_ s1: String, _ pattern: String) -> Int {
    if s1.isEmpty || pattern.isEmpty {
      return 0
    }
    
    var longest = Int.min
    for i in 0 ..< s1.count {
      let count = checkLength(s1, pattern, from: i)
      if count > longest {
        longest = count
      }
    }
    return longest
  }
  
  private func checkLength(_ s1: String, _ pattern: String, from: Int) -> Int {
    var j = 0
    var count = 0
    var i = from
    while i < s1.count, j < pattern.count, s1[i] == pattern[j]  {
      count += 1
      i += 1
      j += 1
    }
    return count
  }
}

/*
 题目：
 给出一个元素无序的数组，求出使得其左边的数都小于它，右边的数都大于等于它的所有数字。
 举例：
 （1）1,2,3,1,2,0,5,6 ： 输出5,6
 （2）1,2,3,1,2,0,5,5 ： 输出5（第一个5）
 （3）1,2,3,4,5,6,7 ： 输出1,2,3,4,5,6,7
 
 思路：
 使用一个数组nArrMin[i]来保存[i,nLen-1]区间内的最小值。
 使用一个变量nMax保存区间[0,i-1]的最大值。
 对于第i个数，如果它满足nArr[i]大于左边的最大数nMax 且 小于右边的最小数nArrMin[i]，则该数即为所求。
 复杂度：时间：O（n），空间O（n）
 */

public class MyFindKNumber {
  func findKth(list: [Int]) -> [Int] {
    if list.isEmpty {
      return [Int]()
    }
    
    var rightMinList: [Int] = Array(repeating: Int.max, count: list.count)
    rightMinList[list.count - 1] = list.last!
    // build 1 - n-2, 的最大值集合
    // 0  1  2  3
    // i ~ n-1 的最小值
    for i in (0 ..< list.count-1).reversed() {
      rightMinList[i] = min(rightMinList[i + 1], list[i])
    }
    
    var leftMax = Int.min
    var res = [Int]()
    for i in 0 ..< list.count {
      if list[i] > leftMax {
        if list[i] <= rightMinList[i] {
          res.append(list[i])
        }
        leftMax = list[i]
      }
    }
    return res
  }
}

//1414. 和为 K 的最少斐波那契数字数目
/*
 给你数字 k ，请你返回和为 k 的斐波那契数字的最少数目，其中，每个斐波那契数字都可以被使用多次。

 斐波那契数字定义为：

 F1 = 1
 F2 = 1
 Fn = Fn-1 + Fn-2 ， 其中 n > 2 。
 数据保证对于给定的 k ，一定能找到可行解。
 https://leetcode-cn.com/problems/find-the-minimum-number-of-fibonacci-numbers-whose-sum-is-k/solution/he-wei-k-de-zui-shao-fei-bo-na-qi-shu-zi-shu-mu-by/
 */
public class KSumFibo {
  public func kSum(_ k: Int) -> Int {
    
    var fibo = [Int]()
    fibo.append(1)
    fibo.append(1)

    var f1 = 1
    var f2 = 1
    while f1 + f2 <= k {
      let tmp = f1 + f2
      fibo.append(tmp)
      f2 = f1
      f1 = tmp
    }
    
    var ans = 0
    var sum = k
    for i in (0 ... fibo.count-1).reversed() {
      if fibo[i] <= sum {
        ans += 1
        sum -= fibo[i]
      }
    }
    return ans
  }
}
/*
 给定 n 个非负整数表示每个宽度为 1 的柱子的高度图，计算按此排列的柱子，下雨之后能接多少雨水。

  

 示例 1：
 输入：height = [0,1,0,2,1,0,1,3,2,1,2,1]
 输出：6
 解释：上面是由数组 [0,1,0,2,1,0,1,3,2,1,2,1] 表示的高度图，在这种情况下，可以接 6 个单位的雨水（蓝色部分表示雨水）。

 提示：

 n == height.length
 0 <= n <= 3 * 104
 0 <= height[i] <= 105
 
 链接：https://leetcode-cn.com/problems/trapping-rain-water
 */
public class MyRainTrap1 {
  /*
   算法
   找到数组中从下标 i 到最左端最高的条形块高度 \text{left\_max}left_max。
   找到数组中从下标 i 到最右端最高的条形块高度 \text{right\_max}right_max。
   扫描数组 \text{height}height 并更新答案：
   累加 \min(\text{max\_left}[i],\text{max\_right}[i]) - \text{height}[i]min(max_left[i],max_right[i])−height[i] 到 ansans 上
   */
  
  func trap(_ hights: [Int]) -> Int {
    if hights.isEmpty {
      return 0
    }
    
    var leftMax = Array<Int>(repeating: 0, count: hights.count)
    var rightMax = Array<Int>(repeating: 0, count: hights.count)
    // leftMax
    leftMax[0] = hights[0]
    var i = 1
    while i < hights.count {
      leftMax[i] = max(hights[i], leftMax[i - 1])
      i += 1
    }
    
    i = hights.count - 2
    rightMax[hights.count - 1] = hights.last!
    while i >= 0 {
      let tmp = max(hights[i], rightMax[i + 1])
      rightMax[i] = tmp
      i -= 1
    }
    
    i = 0
    var ans = 0
    while i < hights.count {
      let tmp = min(leftMax[i], rightMax[i]) - hights[i]
      if tmp > 0 {
        ans += tmp
      }
      i += 1
    }
    return ans
  }
}

public class MyRainTrap2 {
    
  /*
   方法 4：使用双指针
   直观想法

   int left = 0, right = height.length - 1;
       int ans = 0;
       int left_max = 0, right_max = 0;
       while (left < right) {
           if (height[left] < height[right]) {
               if (height[left] >= left_max) {
                   left_max = height[left];
               } else {
                   ans += (left_max - height[left]);
               }
               ++left;
           } else {
               if (height[right] >= right_max) {
                   right_max = height[right];
               } else {
                   ans += (right_max - height[right]);
               }
               --right;
           }
       }
       return ans;
   */
  
  func trap(_ heights: [Int]) -> Int {
    if heights.isEmpty {
      return 0
    }
    var left = 0
    var right = heights.count - 1
    var ans = 0
    var leftMax = 0
    var rightMax = 0
    while left < right {
      if heights[left] < heights[right] {
        if heights[left] >= leftMax {
          leftMax = heights[left]
        } else {
          ans += (leftMax - heights[left])
        }
        left += 1
      } else {
        if heights[right] >= rightMax {
          rightMax = heights[right]
        } else {
          ans += rightMax - heights[right]
        }
        right -= 1
      }
    }
    return ans
  }
}

/*
 给定一个长度为n的小写字符数组，一次操作是删除一个最小字母，如有多个删除最靠左的。要求输出操作k次后的字符串。
输入：abaacd, k = 3
输出： bcd
 基本思路，统计出，数组中每个字符个个数，与k做比较
 */

public class DeleteKChars {
  private let len = 26
  private let base = Character("a").asciiValue!

  
  private struct DeleteInfo {
    let deleteIndex: [Int]
    let stopIndex: Int
    var stopCount: Int
  }
  
  func delete(_ s: String, _ k: Int) -> String {
    if s.count <= k {
      return ""
    }
    
    let cs = Array(s)
    let times: [Int] = charToTimes(cs: cs)
    let deleteInfo = buildDeleteCharsInfo(times, k: k)
    let result = rebuildString(cs, deleteInfo)
    return result
  }
  
  // 统计各种字符出现的次数
  private func charToTimes(cs: [Character]) -> [Int] {
    var times: [Int] = Array<Int>(repeating: 0, count: len)
    let list = cs.map{ return Int($0.asciiValue! - base) }
    for i in list {
      times[i] += 1
    }
    return times
  }
  // 构建要删除的信息
  private func buildDeleteCharsInfo(_ times: [Int], k: Int) -> DeleteInfo {
    var deleteChars: [Int] = [Int]()
    var i = 0
    var count = k
    var stop = -1
    while i < len {
      let tmp = count - times[i]
      if tmp >= 0 {
        count = tmp
        deleteChars.append(i)
      } else {
        stop = i
        break
      }
      i += 1
    }
    var stopCount = 0
    if stop > 0 {
      stopCount = count
    }
    return DeleteInfo(deleteIndex: deleteChars, stopIndex: stop, stopCount: stopCount)
  }
  
  // 重新连接字符串
  private func rebuildString(_ cs: [Character], _ info: DeleteInfo) -> String {
    var result = ""
    var deleteInfo = info
    for c in cs {
      let diff = Int(c.asciiValue! - base)
      if deleteInfo.deleteIndex.contains(diff) {
        continue
      } else if diff == deleteInfo.stopIndex {
        if deleteInfo.stopCount > 0 {
          deleteInfo.stopCount -= 1
          continue
        }
      }
      result += String(c)
    }
    
    return result
  }
}
