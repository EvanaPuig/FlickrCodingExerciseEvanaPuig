//
//  FlickrService.swift
//  VSCO-lite
//
//  Created by Evana Margain Puig on 26/03/25.
//

import SwiftUI
import Kingfisher

struct PhotoSearchView: View {
    
    @StateObject private var viewModel = PhotoSearchViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(
                    text: $viewModel.searchText,
                    onSearch: {
                        viewModel.searchPhotos()
                    }
                )

                if viewModel.isLoading {
                    ProgressView("Loading...")
                        .progressViewStyle(CircularProgressViewStyle())
                        .frame(maxHeight: .infinity)
                } else if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding()
                } else {
                    PhotoGrid(photos: viewModel.photos)
                }
            }
            .navigationTitle("Flickr Search")
        }
    }
}

struct PhotoSearchView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PhotoSearchView()
        }
    }
}
