//
//  File.swift
//  
//
//  Created by miao gaoliang on 2020/10/27.
//

import Foundation

extension String {
  // get index for Element.index
  func getIndex(_ i: String.Index) -> Int {
    return distance(from: startIndex, to: i)
  }
  
  subscript(_ i: Int) -> Character {
    get {
      let idx = index(startIndex, offsetBy: i)
       return self[idx]
    }
  }
  
  subscript(_ r: ClosedRange<Int>) -> String {
    let start = index(startIndex, offsetBy: r.lowerBound)
    let end = index(startIndex, offsetBy: r.upperBound)
    return String(self[start ... end])
  }
}

// 3. 无重复字符的最长子串
//https://leetcode-cn.com/problems/longest-substring-without-repeating-characters/solution/hua-dong-chuang-kou-by-powcai/
public class LengthOfLongestSubstring {
  public func subLength(source: String) -> Int {
    var map = [Character: Int]()
    var left = 0
    var len = 0
    for i in source.indices {
      let c = source[i]
      if let v = map[c] {
        left = max(left, v + 1)
      } else {
        let index = source.getIndex(i)
        map[c] = index
        len = max(index - left + 1, len)
      }
    }
    return len
  }
}
/*
 最长回子串，
Input: s = "babad"
Output: "bab"
Note: "aba" is also a valid answer.
 https://leetcode-cn.com/problems/longest-palindromic-substring/solution/zhong-xin-kuo-san-dong-tai-gui-hua-by-liweiwei1419/
*/
public class  LongestPalindromicSubstring {
  // 获取最长子串, dp 空间换时间
  public func subLength(source: String) -> String {
    guard !source.isEmpty, source.count > 1 else {
      return source
    }
    
    var begin = 0
    var len = 0
    
    var dp: [[Bool?]] = Array(repeating: (Array(repeating: nil, count: source.count)), count: source.count)
    for i in source.indices {
      let d = source.getIndex(i)
      dp[d][d] = true
    }
    
    for j in 1 ..< source.count {
      for i in 0 ... j {
        if source[i] != source[j] {
          dp[i][j] = false
        } else {
          if j - i < 3 {
            dp[i][j] = true
          } else {
            dp[i][j] = dp[i+1][j-1]
          }
        }
        
        if let value = dp[i][j], value && j - i + 1 > len {
          len = j - i + 1
          begin = i
        }
      }
    }
    
    return source[begin ... begin + len - 1]
  }
    
  public func isPalindromic(_ source: String) -> Bool {
    if source.isEmpty || source.count == 1 { return false }
    
    var l = 0
    var r = source.count - 1

    while l < r {
      if source[r] != source[l] {
        return false
      }
      l += 1
      r -= 1
    }
    return true
    
  }
}
