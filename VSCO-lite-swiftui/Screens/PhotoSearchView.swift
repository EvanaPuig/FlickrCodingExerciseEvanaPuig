//
//  FlickrService.swift
//  VSCO-lite
//
//  Created by Evana Margain Puig on 26/03/25.
//

import SwiftUI
import Kingfisher

struct PhotoSearchView: View {
    
    // @ObservedObject var viewModel: PhotoSearchViewModel
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
                    ScrollView {
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2), spacing: 10) {
                            ForEach(viewModel.photos) { photo in
                                if let url = photo.imageURL {
                                    KFImage(url)
                                        .resizable()
                                        .placeholder {
                                            Color.gray.opacity(0.3) // Placeholder while loading
                                                .frame(height: 150)
                                                .cornerRadius(8)
                                        }
                                        .scaledToFill()
                                        .frame(height: 150)
                                        .clipped()
                                        .cornerRadius(8)
                                }
                            }
                        }
                        .padding()
                    }
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
