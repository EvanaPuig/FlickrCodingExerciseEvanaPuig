//
//  PhotoGrid.swift
//  VSCO-lite-swiftui
//
//  Created by Evana Margain Puig on 24/03/25.
//

import SwiftUI

struct PhotoGrid: View {
    var photos: [Photo]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2), spacing: 10) {
                ForEach(photos) { photo in
                    PhotoGridCell(photo: photo)
                }
            }
            .padding()
        }
    }
}

struct PhotoGrid_Previews: PreviewProvider {
    static var previews: some View {
        PhotoGrid(photos: Photo.previewPhotos)
            .previewLayout(.sizeThatFits)
    }
}
