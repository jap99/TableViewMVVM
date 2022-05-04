import XCTest
@testable import TableView

 
func cipher(_ str: String, _ rf: Int) -> String {
    let uppercase = Array("abcdefghijklmnopqrstuvwxyz")
    let lowercase = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
    let nums = Array("0123456789")
    
    let rf1 = rf % 26
    let rf2 = rf % 10

    let aL = lowercase[rf1...] + lowercase[..<rf1]
    let aU = uppercase[rf1...] + uppercase[..<rf1]
    let n = nums[rf2...] + nums[..<rf2]
    
    let dict = Dictionary(uniqueKeysWithValues: zip(lowercase+uppercase+nums, aL+aU+n))
    return String(str.map { dict[$0] ?? $0 })
}
 
class RotationalCipherTests: XCTestCase {
 
    func test1() {
        XCTAssertEqual(cipher("abyz",2), "cdab")
    }
    
    func test2() {
        XCTAssertEqual(cipher("abyz",20), "uvst")
    }
    
    func test3() {
        XCTAssertEqual(cipher("ABYZ",2), "CDAB")
    }
     
    func test33() {
        XCTAssertEqual(cipher("A",4), "E")
    }
    
    func test4() {
        XCTAssertEqual(cipher("AB-YZ",20), "UV-ST")
    }
     
    func test5() {
        let s = "All-convoYs-9-be:Alert1."
        let e = "Epp-gsrzsCw-3-fi:Epivx5."
        XCTAssertEqual(cipher(s,4), e)
    }
     
    func test6() {
        let s = "abcdZXYzxy-999.@"
        let e = "stuvRPQrpq-999.@"
        XCTAssertEqual(cipher(s,200), e)
    }
    
    func test7() {
        XCTAssertEqual(cipher("R",14), "F")
    }
    
    func test8() {
        let s = "BLMO"
        let e = "VFGI"
        XCTAssertEqual(cipher(s,20), e)
    }
     
    func test9() {
        XCTAssertEqual(cipher("R",14), "F")
        
    }
    
    func test10() {
        XCTAssertEqual(cipher("R",4), "V")
        XCTAssertEqual(cipher("R",30), "V")
    }
    
    
     
}
