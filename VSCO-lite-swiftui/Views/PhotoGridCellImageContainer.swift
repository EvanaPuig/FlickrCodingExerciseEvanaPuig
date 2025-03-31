//
//  PhotoGridCellImageContainer.swift
//  VSCO-lite-swiftui
//
//  Created by Evana Margain Puig on 24/03/25.
//

import SwiftUI
import Kingfisher

struct PhotoGridCellImageContainer: View {
    var url: URL?
    
    var body: some View {
        if let url = url {
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

struct PhotoGridCellImageContainer_Previews: PreviewProvider {
    static var previews: some View {
        PhotoGridCellImageContainer(url: Photo.previewPhotos.first?.imageURL)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
