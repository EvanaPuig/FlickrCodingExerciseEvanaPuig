//
//  PhotoSearchViewModelTests.swift
//  VSCO-lite
//
//  Created by Evana Margain Puig on 27/03/25.
//

import XCTest
@testable import VSCO_lite_swiftui

final class PhotoSearchViewModelTests: XCTestCase {
    var viewModel: PhotoSearchViewModel!
    var mockDataProvider: MockDataProvider!

    override func setUp() {
        super.setUp()
        mockDataProvider = MockDataProvider()
        viewModel = PhotoSearchViewModel(dataProvider: mockDataProvider)
    }

    override func tearDown() {
        viewModel = nil
        mockDataProvider = nil
        super.tearDown()
    }

    func testSearchPhotos_Success() {
        let jsonResponse = """
        {
            "photosInfo": {
                "photos": [
                    { "id": "1", "title": "Sunset", "url": "https://example.com/sunset.jpg" }
                ]
            }
        }
        """

        mockDataProvider.mockResult = .success(jsonResponse)
        
        let expectation = self.expectation(description: "Photos updated")
        
        viewModel.searchPhotos()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            print("Photos count:", self.viewModel.photos.count)
            print("First photo title:", self.viewModel.photos.first?.title ?? "nil")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 2.0)
    }

    func testSearchPhotos_Failure() {
        mockDataProvider.mockResult = .failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Network error"]))

        let expectation = self.expectation(description: "Error handled")
        
        viewModel.searchPhotos()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertNotNil(self.viewModel.errorMessage)
            XCTAssertEqual(self.viewModel.errorMessage, "Failed to fetch photos: Network error")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 2.0)
    }

    func testSearchPhotos_InvalidJSON() {
        let invalidJSONResponse = "{ invalid json }"

        mockDataProvider.mockResult = .success(invalidJSONResponse)

        let expectation = self.expectation(description: "Invalid JSON handled")
        
        viewModel.searchPhotos()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertEqual(self.viewModel.errorMessage, "Failed to parse photo data.")
            XCTAssertTrue(self.viewModel.photos.isEmpty)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 2.0)
    }
}
