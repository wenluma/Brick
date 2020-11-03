import XCTest
@testable import Brick

final class MyBrickTests: XCTestCase {
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
}
