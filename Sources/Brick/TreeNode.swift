//
//  File.swift
//  
//
//  Created by miao gaoliang on 2020/8/12.
//
import Foundation

public class TreeNode<T> {
  var value: T?
  var left: TreeNode<T>?
  var right: TreeNode<T>?

  convenience init(value: T? = nil) {
    self.init(value: value, left: nil, right: nil)
  }
  
  required init(value: T? = nil,
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
    
  public class func treeNode(from list: [Int?]) -> TreeNode<Int>? {
    
    func createNode(list: [Int?], idx: inout Int) -> TreeNode<Int>? {
      idx += 1
      if idx < list.count, let value = list[idx] {
        return TreeNode<Int>(value: value)
      }
      return nil
    }
    
    guard let vaildIndex = list.firstIndex(where: { $0 != nil })  else {
      return nil
    }
    let root = TreeNode<Int>(value: list[vaildIndex])
    var queue = [TreeNode<Int>]()
    queue.append(root)
    var idx = vaildIndex
    while idx < list.count {
      let current = queue.removeFirst()
      if let node = createNode(list: list, idx: &idx) {
        current.left = node
        queue.append(node)
      }
      
      if let node = createNode(list: list, idx: &idx) {
        current.right = node
        queue.append(node)
      }
    }
    queue.removeAll()
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

public class LowestCommentAncestorTree<T: Equatable> {
  // 最近公共祖先
  func lowestCommonAncestor(_ root: TreeNode<T>?, _ p: T, _ q: T) -> TreeNode<T>? {
      if root == nil || p == root?.value || q == root?.value {
          return root
      }
      let left = lowestCommonAncestor(root?.left, p, q)
      let right = lowestCommonAncestor(root?.right, p, q)
      if left != nil && right != nil {
          return root
      }
      if left != nil {
          return left
      }
      if right != nil {
          return right
      }
      return nil
  }
  
}

// 对二叉树编码解码 https://leetcode-cn.com/problems/serialize-and-deserialize-binary-tree/solution/shou-hui-tu-jie-gei-chu-dfshe-bfsliang-chong-jie-f/
public class CoderTree {
  public func serialize(root: TreeNode<Int>?) -> String {
    guard let root = root else {
      return "x,"
    }
    let leftFlag = serialize(root: root.left)
    let rightFlag = serialize(root: root.right)
    let value: String = String(format: "%d,%@%@", root.value!, leftFlag, rightFlag)
    return value
  }
  
  public func bfsSerialize(root: TreeNode<Int>?) -> String {
    var queue = [TreeNode<Int>?]()
    queue.append(root)
    var res = [String]()
    while !queue.isEmpty {
      let node = queue.removeFirst()
      if let node = node {
        res.append(String(node.value!))
        queue.append(node.left)
        queue.append(node.right)
      } else {
        res.append("x")
      }
    }
    return res.joined(separator: ",")
  }
  
  private func nodeFrom(_ str: Substring, flag: String) -> TreeNode<Int>? {
    if str == flag {
      return nil
    } else {
      return TreeNode<Int>(value: Int(str))
    }
  }
  
  public func bfsDeserialize(source: String) -> TreeNode<Int>? {
    let list = split(source: source, separator: ",")
    if list.count <= 1  {
      return nodeFrom(list[0], flag: "x")
    }
    
    let root: TreeNode<Int>? =  nodeFrom(list[0], flag: "x")
    var queue = [TreeNode<Int>?]()
    queue.append(root)
    var nextIdx = 1
    while nextIdx < list.count {
      let node = queue.removeFirst()
      if nextIdx < list.count {
        let left = nodeFrom(list[nextIdx], flag: "x")
        node?.left = left
        queue.append(left)
        nextIdx += 1
      }
      
      if nextIdx < list.count {
        let right = nodeFrom(list[nextIdx], flag: "x")
        node?.right = right
        queue.append(right)
        nextIdx+=1
      }
    }
    queue.removeAll()
    return root
  }
  
  public func deserialize(source: String) -> TreeNode<Int>? {
    var sub = source.split(separator: ",")
    let tree = buildTree(list: &sub)
    return tree
  }
  
  private func buildTree(list: inout [Substring]) -> TreeNode<Int>? {
    let sub: Substring = list.removeFirst()
    if sub == "x" {
      return nil
    }
    let root: TreeNode<Int> = TreeNode(value: Int(sub))
    root.left = buildTree(list: &list)
    root.right = buildTree(list: &list)
    return root
  }
  
  public func split(source: String, separator: Character) -> [Substring] {
    var last: String.IndexDistance = -1
    var offset: String.IndexDistance = 0
    let start = source.startIndex
    var list = [Substring]()
    //a,bd,c,x,d
    repeat {
      let currentIdx = source.index(start, offsetBy: offset)
      if currentIdx >= source.endIndex {
        break
      }
      
      if source[currentIdx] == separator {
        let rs = source.index(start, offsetBy: last + 1)
        let re = source.index(start, offsetBy: offset)
        let substring: Substring = source[rs..<re]
        list.append(substring)
        last = offset
      }
      offset += 1
    } while (offset < source.count)

    return list
  }
}

//https://leetcode-cn.com/problems/house-robber-iii/solution/san-chong-fang-fa-jie-jue-shu-xing-dong-tai-gui-hu/
//337. 打家劫舍 III
public class RobTree {
  // 动态规划，最优子结构， max (爷爷 + 孙子 ， 儿子）
  public func rob(node: TreeNode<Int>?) -> Int {
    guard let node = node else {
      return 0
    }
    let money = node.value! + rob(node: node.left?.left) + rob(node: node.left?.right) + rob(node: node.right?.left) + rob(node: node.right?.right)
    let child = rob(node: node.left) + rob(node: node.right)
    return max(money, child)
  }
  
  var sums = [TreeNode<Int> : Int]()
  
  public func rob2(node: TreeNode<Int>?) -> Int {
    return rob2Internal(node: node)
  }
  
  func rob2Internal(node: TreeNode<Int>?) -> Int {
    guard let node = node else {
      return 0
    }
    if let value = sums[node] {
      return value
    }
    let part1 = node.value! + rob2Internal(node: node.left?.left) + rob2Internal(node: node.left?.right) + rob2Internal(node: node.right?.left) + rob2Internal(node: node.right?.right)
    let part2 = rob2Internal(node: node.left) + rob2Internal(node: node.right)
    let value =  max(part1, part2)
    sums[node] = value
    return value
  }
  
  public func rob3(node: TreeNode<Int>?) -> Int {
    let (rob, not) = rob3Internal(node: node)
    return max(rob, not)
  }
  
  public func rob3Internal(node: TreeNode<Int>?) -> (Int, Int) {
    guard let node = node else {
      return (0, 0)
    }
    let (l0, l1) = rob3Internal(node: node.left)
    let (r0, r1) = rob3Internal(node: node.right)
    let v0 = max(l0, l1) + max(r0, r1)
    let v1 = l0 + r0 + node.value!
    return (v0, v1)
  }
}

// 节点路径，只能从 super -》 child 的方式 来获取 子路径和，满足target 的路径总和
public class PathSumTree {
  
  public func sum(node: TreeNode<Int>?, target: Int) -> Int {
    // [sum: count]
    var map = [Int: Int]()
    map[0] = 0
    return recursionPathSum(node: node, prefixSum: &map, target: target, currentSum: 0)
  }
  
  func recursionPathSum(node: TreeNode<Int>?, prefixSum: inout [Int: Int], target: Int, currentSum: Int) -> Int {
    guard let node = node else {return 0}
    var res = 0
    var current = currentSum + node.value!
    let key = current - target
    res += prefixSum[key, default: 0]
    prefixSum[current] = prefixSum[current, default: 0] + 1
    
    // 3.进入下一层
    res += recursionPathSum(node: node.left, prefixSum: &prefixSum, target: target, currentSum: current)
    res += recursionPathSum(node: node.right, prefixSum: &prefixSum, target: target, currentSum: current)

    // 4.回到本层，恢复状态，去除当前节点的前缀和数量
    prefixSum[current] = prefixSum[current, default: 0] - 1
    return res
  }
  
  public func sum2(node: TreeNode<Int>?, target: Int) -> Int {
    
    func dfs(node: TreeNode<Int>?, list: inout [Int]) -> Int {
      guard let node = node else {
        return 0
      }
      list = list.map({ $0 + node.value! })
      list.append(node.value!)
      
      let count = list.reduce(0) { (times, num) -> Int in
        if num == target {
          return times + 1
        }
        return times
      }
      let all = count + dfs(node: node.left, list: &list) + dfs(node: node.right, list: &list)
      list = list.map({ $0 - node.value! })
      list.removeLast()
      return all
    }
    
    var list = [Int]()
    return dfs(node: node, list: &list)
  }
  
  public func sum3(node: TreeNode<Int>?, target: Int) -> Int {
    var res = 0
    func dfs(node: TreeNode<Int>?, list: [Int]) {
      guard let node = node else {
        return ;
      }
      var vector = list.map({ $0 + node.value! })
      vector.append(node.value!)
      for item in vector {
        if item == target {
          res += 1
        }
      }
      dfs(node: node.left, list: vector)
      dfs(node: node.right, list: vector)
    }
    
    dfs(node: node, list: [])
    return res
  }
  
}


//https://leetcode-cn.com/problems/convert-bst-to-greater-tree/ 二叉树转累加树 binary search tree to greater tree
public class BST2GT {
  var num: Int = 0
  public func convert2GT(node: TreeNode<Int>?) -> TreeNode<Int>? {
    guard let node = node else {
      return nil
    }
    convert2GT(node: node.right)
    var current = node.value! + num
    node.value = current
    num = current
    convert2GT(node: node.left)
    return node
  }
  
  public func convert2GT2(node: TreeNode<Int>?) -> TreeNode<Int>? {
    var stack = [TreeNode<Int>]()
    var current = node
    var root = node
    var num = 0
    while current != nil || !stack.isEmpty {
      while current != nil {
        stack.append(current!)
        current = current?.right
      }
      current = stack.removeLast()
      current.map({ num += $0.value! })
      current?.value = num
      current =  current?.left
    }
    return root
  }
}

// https://leetcode-cn.com/problems/diameter-of-binary-tree/solution/er-cha-shu-de-zhi-jing-by-leetcode-solution/
// 二叉树的，最大直径，转 左，右，子树的最大深度 和
public class DiameterOfBinaryTree {
  var ans: Int = 1
  
  @discardableResult
  func depth(node: TreeNode<Int>?) -> Int {
    guard let node = node else {
      return 0
    }
    let L = depth(node: node.left)
    let R = depth(node: node.right)
    ans = max(ans, L + R + 1)
    return max(L, R) + 1
  }
  
  public func diameter(node: TreeNode<Int>?) -> Int {
    depth(node: node)
    return ans - 1
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
