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
