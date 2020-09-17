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
  func trap(list: [Int]) -> Int {
    if list.isEmpty {
      return 0
    }
    
    // element is list index
    var stack = [Int]()
    var ans: Int = 0
    
    for (index, item) in list.enumerated() {
      while !stack.isEmpty && item > list[stack.last!] {
        let cur = stack.removeLast()
        if stack.isEmpty {
          break
        }
        let L = stack.last!
        let R = index
        let h = min(list[R], list[L]) - list[cur]
        ans += (R - L - 1) * h
      }
      stack.append(index)
    }
    return ans
  }
}
