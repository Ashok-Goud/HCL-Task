//
//  InnofiedUnitTests.swift
//  InnofiedUnitTests
//
//  Created by HYTML00001 on 18/06/24.
//

import XCTest
@testable import Innofied

final class InnofiedUnitTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    //To verify getUserDetail function correctly fetches and parses data from URL
    func testGetUserDetail() {
        // Arrange
        let dataListModel = DataListModel()
        let expectation = self.expectation(description: "Completion handler invoked")
        var fetchSuccess = false
        
        // Act
        dataListModel.getUserDetail {
            success in
            fetchSuccess = success
            expectation.fulfill()
        }
        
        // Assert
        waitForExpectations(timeout: 10, handler: nil)
        XCTAssertTrue(fetchSuccess, "The data fetch should succeed")
        XCTAssertFalse(dataListModel.dataLiatViewModelObj.isEmpty, "The datalistViewModelObj should not be empty after fetching data")
    }

}  



