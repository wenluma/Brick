//
//  File.swift
//  
//
//  Created by miao gaoliang on 2020/9/8.
//

import Foundation

/// 前缀和, 主要用于处理 区间 求和
public class PrefixSum {
  
  // 连续区间和
  public func range(range: Range<Int>, with list: [Int]) -> Int? {
    guard range.upperBound < list.count, range.lowerBound >= 0 else {
      return nil
    }
    return list[range.upperBound + 1] - list[range.lowerBound]
  }
  // 连续左右区间的和
  public func range(leftIndex: Int, rightIndex: Int, with list: [Int]?) -> Int? {
    guard let list = list, !list.isEmpty,
      leftIndex >= 0,  leftIndex <= rightIndex, rightIndex <= list.count else {
      return nil
    }
    var result = Array(repeating: 0, count: list.count+1)
    var idx = 0
    while idx < list.count {
      result[idx+1] = result[idx] + list[idx]
      idx += 1
    }
    /* 0,1,2,3
     r+1 - left
     */
    return result[rightIndex+1] - result[leftIndex]
  }
  
  // 判断是否存 target = 连续序列和 存在，返回 true，否则 false
  public func has(target: Int, with list: [Int]?) -> Bool {
    guard let list = list, !list.isEmpty else {
      return false
    }
    var result = Array(repeating: 0, count: list.count+1)
    var idx = 0
    while idx < list.count {
      result[idx+1] = result[idx] + list[idx]
      idx += 1
    }
    var i = 0, j = i;
    while i < list.count {
      j = i+1
      while j < list.count {
        if result[j+1] - result[i] == target {
          return true
        }
        j += 1
      }
      i += 1
    }
    return false
  }
  
  // target = 连续序列和，有几次
  public func count(for target: Int, with list: [Int]?) -> Int? {
    guard let list = list, !list.isEmpty else {
      return nil
    }
    var result = Array(repeating: 0, count: list.count+1)
    var idx = 0
    while idx < list.count {
      result[idx+1] = result[idx] + list[idx]
      idx += 1
    }
    var i = 0, j = i;
    var count = 0;
    while i < list.count {
      j = i+1
      while j < list.count {
        if result[j+1] - result[i] == target {
          count += 1
        }
      }
    }
    return count
  }
  
  // 优化版
  public func count2(for target: Int, with list: [Int]?) -> Int? {
    guard let list = list, !list.isEmpty else {
      return nil
    }
    // [target: count]
    var map = [Int : Int]()
    var sum: Int = 0
    var count = 0;
    for item in list {
      sum += item
      let tsum = sum - target
      if let times = map[tsum] {
        count += times
      }
      map[sum] = map[sum, default: 0] + 1
    }
    return count
  }
}
