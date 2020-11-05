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
  let value: Int
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

