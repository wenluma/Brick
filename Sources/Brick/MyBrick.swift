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
