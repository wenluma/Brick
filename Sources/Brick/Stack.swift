//
//  File.swift
//  
//
//  Created by miao gaoliang on 2020/9/16.
//

// https://leetcode-cn.com/problems/valid-parentheses/
// {}[]() 6中括弧，判断是否有效，
// [], {}, (), [(){}] 有效
// [), {) 无效
public class VaildParentheses {
  func check(source: String) -> Bool {
    if source.count % 2 == 1 {
      return false
    }
    // 空，默认true
    if source.isEmpty {
      return true
    }
    
    let map: [Character : Character] = ["}": "{",
                                        "]": "[",
                                        ")": "("]
    var stack = [Character]()
    for c in source {
      if let value = map[c] {
        if stack.isEmpty || value != stack.last {
          return false
        }
        stack.removeLast()
      } else {
        stack.append(c)
      }
    }
    return stack.isEmpty
  }
}

//https://leetcode-cn.com/problems/trapping-rain-water/solution/xiang-xi-tong-su-de-si-lu-fen-xi-duo-jie-fa-by-w-8/
// 接雨水，给定非负数组， 求能接雨水的最大和
public class TrapRainWater {
  // https://leetcode-cn.com/problems/trapping-rain-water/solution/trapping-rain-water-by-ikaruga/
  // 按行算的
  func trap(list: [Int]) -> Int {
    var ans = 0
    var stack = [Int]()
    for (index, item) in list.enumerated() {
      while !stack.isEmpty && item > list[stack.last!] {
        let current = stack.removeLast()
        if stack.isEmpty { break }
        let l = stack.last!
        let r = index
        let h = min(list[r], list[l]) - list[current]
        ans += (r - l - 1) * h
      }
      stack.append(index)
    }
    return ans
  }
  
  // 按列算的
  func trap2(list: [Int]) -> Int {
    if list.count < 2 {
      return 0
    }
    var sum = 0
    var maxLeft = 0, maxRight = 0
    var left = 1
    var right = list.count - 2
    
    for _ in 1 ..< list.count-1 {
      if list[left-1] < list[right+1] {
        // l ->> r
        maxLeft = max(maxLeft, list[left-1])
        let min = maxLeft
        if min > list[left] {
          sum += min - list[left]
        }
        left+=1
      } else {
        //   r ->> l
        maxRight = max(maxRight, list[right+1])
        let min = maxRight
        if min > list[right] {
          sum += min - list[right]
        }
        right -= 1
      }
    }
    
    return sum
  
  }
}

// https://leetcode-cn.com/problems/largest-rectangle-in-histogram/solution/84-by-ikaruga/
// 非负数组，计算能获取到的，最大的面积
public class LargestRectangleArea {
  func area(heights: [Int]) -> Int {
    var list = [Int]()
    list.append(0)
    list.append(contentsOf: heights)
    list.append(0)
    
    var sum = 0
    var stack = [Int]()
    for index in list.startIndex ..< list.endIndex {
      while !stack.isEmpty && list[stack.last!] > list[index] {
        let current = stack.removeLast()
        let left = stack.last! + 1
        let right = index - 1
        let area = (right - left + 1) * list[current]
        sum = max(sum, area)
      }
      stack.append(index)
    }
    return sum
  }
}

// https://leetcode-cn.com/problems/maximal-rectangle/solution/xiang-xi-tong-su-de-si-lu-fen-xi-duo-jie-fa-by-1-8/
/*
 给出二维数组
 输入:
 [
   ["1","0","1","0","0"],
   ["1","0","1","1","1"],
   ["1","1","1","1","1"],
   ["1","0","0","1","0"]
 ]
 输出: 6

 链接：https://leetcode-cn.com/problems/maximal-rectangle
 */
public struct Array2D<T> {
  let row: Int
  let columns: Int
    var container: [T] // row * columns
  init(row: Int, columns: Int, initial: T) {
    self.row = row
    self.columns = columns
    container = Array(repeating: initial, count: row * columns)
  }
  
  public subscript(row: Int, columns: Int) -> T {
    get {
      precondition(row < self.row, "row must less than \(self.row)")
      precondition(columns < self.columns, "columns must less than \(self.columns)")
      let index = row * self.columns + columns
      return container[index]
    }
    set {
      precondition(row < self.row, "row must less than \(self.row)")
      precondition(columns < self.columns, "columns must less than \(self.columns)")
      let index = row * self.columns + columns
      container[index] = newValue
    }
  }
}

public class MaxtriaRectangleArea {
    let bounds = -1
    
    // 入口函数
    func maximalRectangle(_ matrix: [[Character]]) -> Int {
        let cols = addColumns(matrix)
        var maxArea = 0
        for heights in cols {
            let current = rectArea(heights:heights)
            maxArea = max(maxArea, current)
        }
        return maxArea
    }
    
    // 累加
    func addColumns(_ matrix: [[Character]]) -> [[Int]] {
        let colCount = matrix[0].count
        var myHeighs = [[Int]]()
        var heighs = Array(repeating: 0, count: colCount)
        for i in 0 ..< matrix.count {
            for j in 0 ..< colCount {
                let current = matrix[i][j]
                if current == "1" {
                    heighs[j] += 1
                } else {
                    heighs[j] = 0
                }
            }
            myHeighs.append(heighs)
        }
        return myHeighs
    }
    
    // 计算rect 的面积
    func rectArea(heights: [Int]) -> Int {
        var maxArea = 0
        var stack = [Int]()
        stack.append(bounds)
        
        for i in heights.indices {
            print(i)
            while stack.last! != bounds, heights[stack.last!] >= heights[i] {
                let last = stack.removeLast()
                maxArea = max(maxArea, (i - stack.last! - 1) * heights[last])
            }
            stack.append(i)
        }
        
        while stack.last! != bounds {
            maxArea = max(maxArea, heights[stack.removeLast()] * (heights.count - stack.last! - 1))
        }
        return maxArea
    }
}

public class MinStack<T: Comparable> {
  private var queue = [T]()
  private var minQueue = [T]()
  
  func push(_ element: T) {
    queue.append(element)
    if minQueue.isEmpty {
      minQueue.append(element)
    } else {
      if let top = minQueue.last {
        let minValue = Swift.min(top, element)
        minQueue.append(minValue)
      }
    }
  }
  
  @discardableResult
  func pop() -> T {
    minQueue.removeLast()
    return queue.removeLast()
  }
  
  func top() -> T? {
    if queue.isEmpty {
      return nil
    }
    return queue.last
  }
  
  func min() -> T? {
    return minQueue.last
  }
}

//https://leetcode-cn.com/problems/decode-string/solution/zi-fu-chuan-jie-ma-by-leetcode-solution/
// "3[a]2[bc]" => "aaabcbc"
// "3[a2[c]]" => "accaccacc"
// "2[abc]3[cd]ef" => "abcabccdcdcdef"
// "abc3[cd]xyz" => "abccdcdcdxyz"
public class DecodeString {
  func decodeString(_ s: String) -> String {
    var digitStack = [Int]()
    var alphaStack = [String]()

    var ans: String = ""
    var mutil: Int = 0
    for c in s {
      if c.isNumber {
        print("\(c) isNumber")
        if let number = Int(String(c)) {
          mutil = mutil * 10 + number
        }
      } else if c.isLetter {
        ans.append(c)
        print("\(c) isLetter")
      } else if c == "[" {
        digitStack.append(mutil)
        mutil = 0
        alphaStack.append(ans)
        ans = ""
        print("\(c) 左括弧")
      } else {
        print("\(c) 右括弧")
        let last = alphaStack.removeLast()
        let times = digitStack.removeLast()
        ans = last + String(repeating: ans, count: times)
      }
    }
    return ans
  }
}
