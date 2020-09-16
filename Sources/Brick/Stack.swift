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
