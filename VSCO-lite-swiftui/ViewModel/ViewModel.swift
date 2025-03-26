//
//  ViewModel.swift
//  VSCO-lite
//
//  Created by Evana Margain Puig on 24/03/25.
//

import Combine
import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    
    // TODO: will contain the photos fetched from Flickr
    @Published var photos: [Photo] = Photo.previewPhotos
    
    @Published var searchText: String = ""
    
    init() {
    }
    
}
