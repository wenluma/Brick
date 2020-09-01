//
//  File.swift
//  
//
//  Created by miao gaoliang on 2020/8/12.
//
import Foundation
// 可视化查看树的遍历 https://visualgo.net/zh/bst
open class TreeFacctory {
  static public func treeNode<T>(from list:[T] ) -> TreeNode<T>? {
    if list.isEmpty {
      return nil
    }
    let count = list.count
    let root = TreeNode(value: list.first, left: nil, right: nil)
    var queue = [TreeNode<T>]()
    queue.append(root)
    
    stride(from: 1, to: count, by: 2).forEach { (index) in
      if queue.isEmpty { return }
      let node = queue.remove(at: 0)
      if index < count {
        let tmp = TreeNode(value: list[index])
        node.left = tmp
        queue.append(tmp)
      }
      if index+1 < count {
        let tmp = TreeNode(value: list[index+1])
        node.right = tmp
        queue.append(tmp)
      }
    }
    return root
  }
}

public class BuildTree<T: Comparable & Hashable> {
  private var map = [T: Int]()
  func makeTree(preList: [T], inList: [T]) -> TreeNode<T>? {
    for (index, e) in inList.enumerated() {
      map[e] = index
    }
    
    return _buildTree(preList: preList, inList: inList, preStart: 0, preEnd: preList.count-1, inStart: 0, inEnd: inList.count-1)
  }
  
  private func _buildTree(preList: [T], inList: [T], preStart: Int, preEnd: Int, inStart: Int, inEnd: Int) -> TreeNode<T>? {
    guard !preList.isEmpty, preList.count == inList.count else {
      return nil
    }
    
    if preStart > preEnd || inStart > inEnd {
      return nil
    }
    let root = preList[preStart]
    let rootIndexInOrder = map[root]!
    let leftCount = rootIndexInOrder - inStart
    let rootNode = TreeNode(value: root)
    rootNode.left = _buildTree(preList: preList,
                               inList: inList,
                               preStart: preStart + 1,
                               preEnd: preStart + 1 + leftCount ,
                               inStart: inStart,
                               inEnd: inStart + leftCount - 1)
    rootNode.right = _buildTree(preList: preList,
                                inList: inList,
                                preStart: preStart + leftCount + 1,
                                preEnd: preEnd,
                                inStart: rootIndexInOrder + 1,
                                inEnd: inEnd)
    return rootNode
  }
  
  
  public func makeTree2(preList: [T], inList: [T]) -> TreeNode<T>? {
    guard !preList.isEmpty, preList.count == inList.count else {
      return nil
    }
    let rootNode = TreeNode<T>(value: preList[0])
    var stack = [TreeNode<T>]()
    stack.append(rootNode)
    var inOrderIndex = 0
    for index in 1 ..< preList.count {
      let preValue = preList[index]
      
      var node = stack.last!
      if node.value! != inList[inOrderIndex] {
        let left = TreeNode<T>(value: preValue)
        node.left = left
        stack.append(left)
        print("left = \(preValue)")
      } else {
        while !stack.isEmpty && stack.last!.value! == inList[inOrderIndex] {
          node = stack.removeLast()
          print("remove node = \(node.value!)")
          inOrderIndex += 1
        }
        let right = TreeNode(value: preValue)
        node.right = right
        stack.append(right)
        print("right = \(preValue)")
      }
    }
    return rootNode
  }
  
  public class func testMake<T: Comparable & Hashable>(preList: [T], inList: [T]) -> TreeNode<T>? {
    let builder = BuildTree<T>()
    return builder.makeTree(preList: preList, inList: inList)
  }
  
  public class func testMake2<T: Comparable & Hashable>(preList: [T], inList: [T]) -> TreeNode<T>? {
    let builder = BuildTree<T>()
    return builder.makeTree2(preList: preList, inList: inList)
  }
}


/// 将二叉树，转成单链表, 前序遍历
public class FlattenTree<T: Comparable & Hashable> {
  // 前序遍历
  public func flatten(root: TreeNode<T>?) -> TreeNode<T>? {
    // 构建前序遍历序列
    var list = [TreeNode<T>]()
    preOrder(root: root, list: &list)
    if list.count == 1 {
      return list.first
    }
    // 展开数组变链表
    var pre: TreeNode = list[0]
    for index in 1 ..< list.count {
      let current = list[index]
      pre.right = current
      pre.left = nil
      pre = current
    }
    return list.first
  }
  
  private func preOrder(root: TreeNode<T>?, list: inout [TreeNode<T>]) {
    guard let root = root else {
      return
    }
    var stack = [TreeNode<T>]()
    var node: TreeNode<T>? = root
    while node != nil || !stack.isEmpty {
      while node != nil {
        stack.append(node!)
        list.append(node!)
        node = node?.left
      }
      node = stack.removeLast()
      node = node?.right
    }
  }
  
  class public func test() {
    let list: [Int] = orderList(lower: 0, upper: 5)
    let node = TreeFacctory.treeNode(from: list)
    let flattenNode = FlattenTree<Int>().flatten(root: node)
    
    var tmp: TreeNode<Int>? = flattenNode
    while tmp != nil {
      print(tmp!.value)
      tmp = tmp!.right
    }
  }
}

class MaxPathSumTree {
  public typealias IntTreeNode = TreeNode<Int>
  
  private var maxSum = Int.min
  func maxSum(_ root: IntTreeNode?) -> Int {
    guard let root = root else { return 0 }
    dfs(root)
    return maxSum
  }
  
  @discardableResult
  private func dfs(_ root: IntTreeNode?) -> Int {
    guard let root = root else { return 0 }
    let left = max(dfs(root.left), 0)
    let right = max(dfs(root.right), 0)
    let current = root.value! + left + right
    maxSum = max(maxSum, current)
    return root.value! + max(left, right)
  }
}

public class InvertTree<T> {
  public func invert(_ root: TreeNode<T>?) -> TreeNode<T>? {
    guard let root = root else {
      return nil
    }
    let left = invert(root.left)
    let right = invert(root.right)
    root.left = right
    root.right = left
    return root
  }
  
  public func invert2(_ root: TreeNode<T>?) -> TreeNode<T>? {
    guard let node = root else { return nil }
    var queue = [TreeNode<T>]()
    queue.append(node)
    while !queue.isEmpty {
      let current = queue.removeFirst()
      let tmp = current.left
      current.left = current.right
      current.right = tmp
      current.left.map({ queue.append($0) })
      current.right.map({ queue.append($0) })
    }
    return node
  }
}

public class TreeNode<T> {
  let value: T?
  var left: TreeNode<T>?
  var right: TreeNode<T>?

  init(value: T? = nil,
       left: TreeNode<T>? = nil,
       right: TreeNode<T>? = nil) {
    self.value = value
    self.left = left
    self.right = right
  }
  
  deinit {
  }
}

extension TreeNode: Hashable {
  public static func == (lhs: TreeNode<T>, rhs: TreeNode<T>) -> Bool {
    lhs.hashValue == rhs.hashValue
  }
  
  public func hash(into hasher: inout Hasher) {
    hasher.combine(ObjectIdentifier(self))
  }
}

func testTreeDepth() {
  let list = orderList(lower: 0, upper: 14)
  //print(list)
  let node = TreeFacctory.treeNode(from: list)

  printLevel(of: node)

  let depth = maxDepth(root: node)
  print(depth)

  let depth2 = maxDepth2(root: node)
  print(depth2)

  let depth3 = maxDepthlevel(root: node)
  print(depth3)

  let depth4 = maxDepthlevel2(root: node)
  print(depth4)
  
  let depth5 = maxDepthlevel3(root: node)
  print(depth5)
}

func testTreeTraversal() {
  /*
                        0
                 1            2
               3    4     5      6
             7  8  9 10 11 12 13  14
   */

  print("中序:  左 根 右")
  let source = orderList(lower: 0, upper: 14)
  let node = TreeFacctory.treeNode(from: source)

  let list = inOrderTraversal(node: node)
  print(list)

  let list2 = inOrderTraveral2(node: node)
  print(list2)

  let list3 = flagInOrderTreeTraversal(node: node)
  print(list3)
  
  print("前序： 根 左 右")
  let list4 = preOrderTraveral(node: node)
  print(list4)

  let list5 = preOrderTraveral2(node: node)
  print(list5)

  print("后： 左右根")
  let post = postOrderTraversal(node: node)
  print(post)

  let post2 = postOrderTraversal2(node: node)
  print(post2)
}

//MARK: - common
public func printLevel<T>(of root: TreeNode<T>?) {
  root.map { (node) -> Void in
    var queue = [TreeNode<T>]()
    var levelQueue = [TreeNode<T>]()
    queue.append(node)
    while !queue.isEmpty {
      levelQueue = queue
      queue.removeAll()
      
      while !levelQueue.isEmpty {
        let tmp = levelQueue.remove(at: 0)
        tmp.left.map({ queue.append($0) })
        tmp.right.map({ queue.append($0) })
        tmp.value.map { print($0, terminator: " ")}
      }
      print()
    }
  }
}

//MARK: - 层遍历 level order
public func levelTraversal<T>(root: TreeNode<T>?) -> [[T]] {
  guard let root = root else {
    return []
  }
  var queue = [TreeNode<T>]()
  var result = [[T]]()
  queue.append(root)
  while !queue.isEmpty {
    var size = queue.count
    var levelArray = [T]()
    for _ in 0..<size {
      let node = queue.removeFirst()
      node.value.map({ levelArray.append($0) })
      node.left.flatMap({ queue.append($0) })
      node.right.flatMap({ queue.append($0) })
    }
    result.append(levelArray)
  }
  return result
}



//MARK: -- 判断是否对称的二叉树

func testSymmetric() {
  /*        1
        3       3
      4           4
   
   
            1
          2    2
        3  4  4  3
   */
  
//  let list1 = [1, 3, 3, 4, nil, nil, 4]
//  let tree1 = treeNode(from: list1)
  
  let list2 = [1,2,2,3,4,4,3]
  let tree2: TreeNode<Int>? = TreeFacctory.treeNode(from: list2)

  let list3 = [1,2,2,3,4,4,5]
  let tree3: TreeNode<Int>? = TreeFacctory.treeNode(from: list3)

//  let check1 = isSymmetric(root: list1)
  let check2 = isSymmetric(root: tree2)
  let check3 = isSymmetric(root: tree3)
  
//  print("check1 = \(check1)")
  print("check2 = \(check2)")
  print("check3 = \(check3)")

}

func isSymmetric<T: Comparable>(root: TreeNode<T>?) -> Bool {
  guard let root = root else {
    return false
  }
  return _isSymmetric(left: root.left, right: root.right)
}
// 递归版本
private func _isSymmetric<T: Comparable>(left: TreeNode<T>?, right: TreeNode<T>?) -> Bool {
  if left == nil && right == nil {
    return true
  }
  
  if left == nil || right == nil {
    return false
  }
  
  guard let left = left, let right = right, left.value == right.value else {
    return false
  }
  
  return _isSymmetric(left: left.left, right: right.right) && _isSymmetric(left: left.right, right: right.left)
}

func isSymmtric2<T: Comparable>(root: TreeNode<T>?) -> Bool {
  guard let root = root else {
    return false
  }
  
  func checkSymmetric(left: TreeNode<T>?, right: TreeNode<T>?) -> Bool {
    if left == nil && right == nil {
      return true
    }
    if left == nil || right == nil {
      return false
    }
    
    var lq = [TreeNode<T>]()
    var rq = [TreeNode<T>]()
    
    lq.append(left!)
    rq.append(right!)
    
    while !lq.isEmpty {
      let l = lq.removeFirst()
      let r = rq.removeFirst()
      
      if l.value != r.value {
        return false
      }
      
      l.left.map({ lq.append($0) })
      r.right.map({ lq.append($0) })
      
      l.right.map({ lq.append($0) })
      r.left.map({ lq.append($0) })

      if lq.count != rq.count {
        return false
      }
    }
    return true
  }
 
  return checkSymmetric(left: root.left, right: root.right)
}


//MARK: -- DFS

//// 获取它的最大深度 递归 DFS
func maxDepth<T>(root: TreeNode<T>?) -> UInt {
  guard let root = root else {
    return 0
  }
  return max(maxDepth(root: root.left), maxDepth(root: root.right)) + 1
}

//// 非递归的DFS
func maxDepth2<T>(root: TreeNode<T>?) -> UInt {
  guard let root = root else {
    return 0
  }
  var queue = [(UInt, TreeNode<T>)]()
  queue.append((1, root))
  var depth: UInt = 0
  while !queue.isEmpty {
    let (currentDepth, node) = queue.remove(at: 0)
    depth = max(depth, currentDepth)
    node.left.map { queue.append((currentDepth + 1, $0)) }
    node.right.map { queue.append((currentDepth + 1, $0)) }
  }
  return depth
}

//MARK: - BFS
func maxDepthlevel<T>(root: TreeNode<T>?) -> UInt? {
  return root.flatMap { (node) -> UInt? in
    var queue = [TreeNode<T>]()
    var level: UInt = 0
    queue.append(node)
    while !queue.isEmpty {
      var count = queue.count
      while count > 0 {
        let node = queue.remove(at: 0)
        node.left.map({ queue.append($0) })
        node.right.map({ queue.append($0) })
        count -= 1
      }
      level += 1
    }
    return level
  }
}

/// 按层遍历2 BFS
func maxDepthlevel2<T>(root: TreeNode<T>?) -> UInt? {
  return root.flatMap { (node) -> UInt? in
    var queue = [TreeNode<T>]()
    var change = [TreeNode<T>]()
    
    var level: UInt = 0
    queue.append(node)
    while !queue.isEmpty {
      change = queue
      queue.removeAll()
      while !change.isEmpty {
        let node = change.remove(at: 0)
        node.left.map({ queue.append($0) })
        node.right.map({ queue.append($0) })
      }
      level += 1
    }
    return level
  }
}

func maxDepthlevel3<T>(root: TreeNode<T>?) -> UInt? {
  return root.flatMap { (node) -> UInt? in
    var queue = [TreeNode<T>]()
    queue.append(node)
    var depth: UInt = 0
    while !queue.isEmpty {
      var nextLevel = [TreeNode<T>]()
      while !queue.isEmpty {
        let tmp = queue.remove(at: 0)
        tmp.left.map { nextLevel.append($0) }
        tmp.right.map { nextLevel.append($0) }
      }
      queue = nextLevel
      depth += 1
    }
    return depth
  }
}

//MARK: - 遍历
//MARK: in order
// 判断平衡二叉树 left < root < right ,中序有序
func isBalanceBinaryTree<T: Comparable>(root: TreeNode<T>?) -> Bool {
  guard let list = inOrderTraveral2(node: root), !list.isEmpty else {
    return false
  }
  var last: T = list.first!
  for i in 1..<list.count {
    if last < list[i] {
      last = list[i]
    } else {
      return false
    }
  }
  return true
}

func inOrderTraversal<T>(node: TreeNode<T>?) -> [T]? {
  guard let node = node else {
    return nil
  }
  var list = [T]()
  inOrder(node: node, list: &list)
  return list
}

private func inOrder<T>(node: TreeNode<T>?, list: inout [T]) {
  if let node = node {
    node.left.map { inOrder(node: $0, list: &list) }
    node.value.map { list.append($0) }
    node.right.map { inOrder(node: $0, list: &list) }
  }
}

func inOrderTraveralx<T>(node: TreeNode<T>?) -> [T]? {
  guard let root = node else {
    return nil
  }
  var queue = [TreeNode<T>]()
  var current: TreeNode<T>? = root
  var result = [T]()
  while current != nil || !queue.isEmpty {
    while current != nil {
      current.map({ queue.append($0) })
      current = current?.left
    }
    current = queue.removeLast()
    current?.value.map({ result.append($0) })
    current = current?.right
  }
  return result
}

func inOrderTraveral2<T>(node: TreeNode<T>?) -> [T]? {
  /*
   1. 判断 current ！= nil
   2. current add to list
   3. 一直追溯left 到 left = nil; current add to list
   4. list revome last, current = last;
   5. save current value
   6. update current = current.right， 下一轮循环
   */
  guard let root = node else {
    return nil
  }
  var result = [T]()
  var queue = [TreeNode<T>]()
  var current: TreeNode<T>?
  current = root
  while current != nil || !queue.isEmpty {
    while current != nil {
      current.map { queue.append($0) }
      current = current?.left
    }
    current = queue.removeLast()
    current?.value.map { result.append($0) }
    current = current?.right
  }
  return result
}

//MARK: pre order
func preOrderTraveral<T>(node: TreeNode<T>?) -> [T]? {
  guard let root = node else {
    return nil
  }
  var list = [T]()
  _preOrder(node: root, list: &list)
  return list
}

private func _preOrder<T>(node: TreeNode<T>, list: inout [T]) {
  node.value.map { list.append($0) }
  node.left.map({ _preOrder(node: $0, list: &list) })
  node.right.map({ _preOrder(node: $0, list: &list) })
}

func preOrderTraveral2<T>(node: TreeNode<T>?) -> [T]? {
  /*
   1. 边界条件
   2. 变量 current, queue,
   3. 循环条件
   */
  guard let root = node else {
    return nil
  }
  var result = [T]()
  var queue = [TreeNode<T>]()
  var current: TreeNode<T>?
  current = root
  while current != nil || !queue.isEmpty {
    current?.value.map({ result.append($0) })
    current.map({ queue.append($0) })
    while current != nil {
      current = current?.left.flatMap({
        queue.append($0);
        $0.value.map({ result.append($0) })
        return $0
      })
    }
    current = queue.removeLast()
    current = current?.right
  }
  return result
}

//MARK: - post order
func postOrderTraversal<T>(node: TreeNode<T>?) -> [T]? {
  guard let root = node else {
    return nil
  }
  var list = [T]()
  _postOrder(node: root, list: &list)
  return list
}

private func _postOrder<T>(node: TreeNode<T>, list: inout [T]) {
  node.left.map({ _postOrder(node: $0, list: &list) })
  node.right.map({ _postOrder(node: $0, list: &list) })
  node.value.map({ list.append($0) })
}

func postOrderTraversal2<T>(node: TreeNode<T>?) -> [T]? {
  guard let root = node else {
    return nil
  }
  var queue = [TreeNode<T>]()
  var result = [T]()
  var current: TreeNode<T>?
  current = root
  while current != nil || !queue.isEmpty {
    current.map({ queue.append($0) })
    current?.value.map({ result.append($0) })

    while current != nil {
      current = current?.right.map({
        queue.append($0);
        $0.value.map({ result.append($0) })
        return $0
      })
    }
    current = queue.removeLast()
    current = current?.left
  }
  return result.reversed()
}

//MARK: - 应付各种遍历操作
enum VisitState: Int {
  case none
  case visited
}
// 将访问过的元素进行标记
func flagInOrderTreeTraversal<T>(node: TreeNode<T>?) -> [T]? {
  guard let root = node else {
    return nil
  }
  var list = [(VisitState, TreeNode<T>)]()
  list.append((.none, root))
  var result = [T]()
  while !list.isEmpty {
    let (state, tmp) = list.removeLast()
    switch state {
    case .none:
      tmp.right.map({ list.append((.none, $0)) })
      list.append((.visited, tmp))
      tmp.left.map({ list.append((.none, $0)) })
    default:
      tmp.value.map({ result.append($0) })
    }
  }
  return result
}
