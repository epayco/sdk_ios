import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(epayco_iosTests.allTests),
    ]
}
#endif
