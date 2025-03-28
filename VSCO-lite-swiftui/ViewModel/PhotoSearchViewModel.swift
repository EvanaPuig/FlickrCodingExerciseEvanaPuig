//
//  ViewModel.swift
//  VSCO-lite
//
//  Created by Evana Margain Puig on 24/03/25.
//

import Combine
import Foundation
import SwiftUI

class PhotoSearchViewModel: ObservableObject {
    
    @Published var photos: [Photo] = Photo.previewPhotos
    @Published var searchText: String = ""
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let dataProvider: DataProviderProtocol

    // Dependency injection (defaulting to real DataProvider)
    init(dataProvider: DataProviderProtocol = DataProvider()) {
        self.dataProvider = dataProvider
    }

    func searchPhotos() {
        let searchQuery = searchText.isEmpty ? "sunset" : searchText
        
        isLoading = true
        errorMessage = nil
        
        dataProvider.fetchData(for: searchQuery) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let response):
                    if let photos = self?.parsePhotos(from: response) {
                        self?.photos = photos
                    } else {
                        self?.photos = []
                        self?.errorMessage = "Failed to parse photo data."
                    }
                case .failure(let error):
                    self?.errorMessage = "Failed to fetch photos: \(error.localizedDescription)"
                }
            }
        }
    }

    private func parsePhotos(from response: String) -> [Photo]? {
        guard let data = response.data(using: .utf8) else { return nil }
        let decoder = JSONDecoder()
        do {
            let decodedResponse = try decoder.decode(FlickrPhotosInfoResponse.self, from: data)
            return decodedResponse.photosInfo.photos
        } catch {
            return nil
        }
    }
}
