//
//  MindDownloaderTests.swift
//  MindDownloaderTests
//
//  Created by Ahmed Samir on 1/7/20.
//  Copyright © 2020 Tania. All rights reserved.
//

import XCTest
import MindDownloader

class MindDownloaderTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testThatMidDownloaderSingletonCanBeInitialized() {
        let midDownloader = MindDownloader.shared
        XCTAssertNotNil(midDownloader, "Not Nil")
    }
    func testThatMidDownloaderSingletonCanBeDeinitialized() {
        var midDownloader: MindDownloader? = MindDownloader.shared
        midDownloader = nil
        XCTAssertNil(midDownloader, "midDownloader should be nil")
    }
    
    func testThatMidDownloaderCanFetchCorrectImage() {
        let midDownloader = MindDownloader.shared
        let url = URL(string: "https://images.unsplash.com/profile-1464495186405-68089dcd96c3?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=128&w=128&s=622a88097cf6661f84cd8942d851d9a2")
        let expectation = self.expectation(description: "image download should succeed")

        var response: Data?
        var isSuccess: Bool?
        midDownloader.fetchData(url: url!) { res  in
            switch res {
            case .success(let data):
                isSuccess = true
                response = data
               expectation.fulfill()
            case.failure(let error):
                isSuccess = false
                print(error)
            }
        }
        waitForExpectations(timeout: 100, handler: nil)
        XCTAssertNotNil(response, "response not nil")
        XCTAssertTrue(isSuccess ?? false , "result should be a success case")
    }
    
    func testThatMidDownloaderCantFetchInCorrectImage() {
        let midDownloader = MindDownloader.shared
        let url = URL(string: "crop&h=128&w=128&s=622a88097cf6661f84cd8942d851d9a2")
        let expectation = self.expectation(description: "image download should fail")

        var response: CustomError?
        var isSuccess: Bool?
        midDownloader.fetchData(url: url!) { res  in
            switch res {
            case .success( _):
                isSuccess = true
            case.failure(let error):
                isSuccess = false
                response = error
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 100, handler: nil)
        XCTAssertNotNil(response, "response not nil")
        XCTAssertFalse(isSuccess ?? true , "result should be a fail case")
    }
}
