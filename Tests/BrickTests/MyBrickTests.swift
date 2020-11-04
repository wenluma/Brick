import XCTest
@testable import Brick

final class MyBrickTests: XCTestCase {
  // 改变索引
  func testDupicateNumbers() {
    let item = DuplicateNumbers()

    repeat {
      let s0 = [1,3,4,5,8,0,1,9,6,0]
      var target: Int? = nil
      let result = item.isDuplicate(source: s0, target: &target)
      XCTAssertTrue(result)
      XCTAssertEqual(target, 1)
    } while false
    
    repeat {
      let s0 = [0]
      var target: Int? = nil
      let result = item.isDuplicate(source: s0, target: &target)
      XCTAssertFalse(result)
      XCTAssertEqual(target, nil)
    } while false
    
    repeat {
      // 内容边界
      let s0 = [0,4]
      var target: Int? = nil
      let result = item.isDuplicate(source: s0, target: &target)
      XCTAssertFalse(result)
      XCTAssertEqual(target, nil)
    } while false
  }
  
  // 交互位置
  func testDupicateNumbers2() {
    let item = DuplicateNumbers2()

    repeat {
      var s0 = [1,3,4,5,8,0,1,9,6,0]
      var target: Int? = nil
      let result = item.isDuplicate(source: &s0, target: &target)
      XCTAssertTrue(result)
      XCTAssertEqual(target, 1)
    } while false
    
    repeat {
      var s0 = [0]
      var target: Int? = nil
      let result = item.isDuplicate(source: &s0, target: &target)
      XCTAssertFalse(result)
      XCTAssertEqual(target, nil)
    } while false
    
    repeat {
      // 内容边界
      var s0 = [0,4]
      var target: Int? = nil
      let result = item.isDuplicate(source: &s0, target: &target)
      XCTAssertFalse(result)
      XCTAssertEqual(target, nil)
    } while false
  }
  
  func testDupicateNumbers3() {
    let item = DuplicateNumbers3()

    repeat {
      let s0 = [2, 3, 5, 4, 3, 2, 6, 7]
      let result: Int = item.isDuplicate(source: s0)
      let duplicates = [2,3]
      XCTAssertTrue(duplicates.contains(result), "result = \(result)")
    } while false
    
    repeat {
      let s0 = [3, 2, 1, 4, 4, 5, 6, 7]
      let result = item.isDuplicate(source: s0)
      let duplicates = [4]
      XCTAssertTrue(duplicates.contains(result), "result = \(result)")
    } while false
    
    repeat {
      // 内容边界
      let s0 = [1, 2, 3, 4, 5, 6, 7, 1, 8]
      let result = item.isDuplicate(source: s0)
      let duplicates = [1]
      XCTAssertTrue(duplicates.contains(result), "result = \(result)")
    } while false
  }
}
