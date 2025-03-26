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
    
    private let service = FlickrService()
    
    func searchPhotos() {
        guard !searchText.isEmpty else { return }
        
        isLoading = true
        errorMessage = nil
        
        service.fetchPhotos(searchTerm: searchText) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let photos):
                    self?.photos = photos
                case .failure(let error):
                    self?.errorMessage = "Failed to fetch photos: \(error.localizedDescription)"
                }
            }
        }
    }
}
