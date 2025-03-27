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
    
    private let dataProvider = DataProvider()

    // Function to search for photos based on the searchText
    func searchPhotos() {
        // Default to a default term if the search text is empty
        let searchQuery = searchText.isEmpty ? "sunset" : searchText
        
        isLoading = true
        errorMessage = nil
        
        // Call the DataProvider to fetch photos
        dataProvider.fetchData(for: searchQuery) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let response):
                    // Assuming the response is the JSON string and needs to be parsed
                    if let photos = self?.parsePhotos(from: response) {
                        self?.photos = photos
                    } else {
                        self?.errorMessage = "Failed to parse photo data."
                    }
                case .failure(let error):
                    self?.errorMessage = "Failed to fetch photos: \(error.localizedDescription)"
                }
            }
        }
    }
    
    // Utility function to parse the JSON response and extract photos
    private func parsePhotos(from response: String) -> [Photo]? {
        // Assuming the response is a valid JSON string, parse it into an array of photos
        let data = response.data(using: .utf8)
        let decoder = JSONDecoder()
        
        do {
            let decodedResponse = try decoder.decode(FlickrPhotosInfoResponse.self, from: data!)
            return decodedResponse.photosInfo.photos
        } catch {
            return nil
        }
    }
}
