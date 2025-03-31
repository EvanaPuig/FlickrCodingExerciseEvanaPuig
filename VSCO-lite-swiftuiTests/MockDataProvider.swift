//
//  MockDataProvider.swift
//  VSCO-lite
//
//  Created by Evana Margain Puig on 27/03/25.
//

@testable import VSCO_lite_swiftui

final class MockDataProvider: DataProviderProtocol {
    var mockResult: Result<String, Error>?

    func fetchData(for query: String, completion: @escaping (Result<String, Error>) -> Void) {
        if let result = mockResult {
            completion(result)
        }
    }
}
