import XCTest
@testable import TableView

// PENDING COMPLETION

func matchingPairs(s: String, t: String) -> Int {
    let chars = Array(s)
    var alphabet = [Int](repeating:0, count:26)
    var lhs = 0, maxCount = 0, maxLength = 0
    return 0
}

class MatchingPairsTest: XCTestCase {
    
    func test1() {
        let s1 = "adcnxyzdp", t1 = "abcdxyznp"
        let output = matchingPairs(s:s1, t:t1)
        XCTAssertEqual(output, 8)
    }
    
    func test2() {
        let s2 = "axb", t2 = "ayb"
        let output = matchingPairs(s: s2, t: t2)
        XCTAssertEqual(output, 1)
    }
    
    func test3() {
        let s3 = "xabcydpkgfqwe", t3 = "xcbanepkgfqwd"
        let output = matchingPairs(s: s3, t: t3)
        XCTAssertEqual(output, 10)
    }
    
    func test4() {
        let s = "abcd", t = "adcb"
        let output = matchingPairs(s:s, t:t)
        XCTAssertEqual(output, 4)
    }
    
    func test5() {
        let s = "mno", t = "mno"
        let output = matchingPairs(s:s, t:t)
        XCTAssertEqual(output, 1)
    }
    
    func test6() {
    }
    
    func test7() {
    }
    
    func test8() {
    }
    
    func test9() {
    }
    
    func test10() {
    }
    
    
    
}
