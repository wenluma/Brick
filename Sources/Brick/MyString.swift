//
//  File.swift
//  
//
//  Created by miao gaoliang on 2020/10/27.
//

import Foundation

// 3. 无重复字符的最长子串
//https://leetcode-cn.com/problems/longest-substring-without-repeating-characters/solution/hua-dong-chuang-kou-by-powcai/
public class LengthOfLongestSubstring {
  public func subLength(source: String) -> Int {
    var map = [Character : Int]()
    var length: Int = 0
    var left: Int = 0
    for i in source.indices {
      let c: Character = source[i]
      if let index = map[c] {
        left = max(left, index + 1)
      }
      let right = source.distance(from: source.startIndex, to: i)
      map[c] = right
      length = max(right - left + 1, length)
    }
    
    return length
  }
}
