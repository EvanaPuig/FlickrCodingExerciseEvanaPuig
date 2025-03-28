//
//  PhotoGridCell.swift
//  VSCO-lite-swiftui
//
//  Created by Evana Margain Puig on 24/03/25.
//

import SwiftUI

struct PhotoGridCell: View {
    var photo: Photo
    
    var body: some View {
        PhotoGridCellImageContainer(url: photo.imageURL)
    }
}

struct PhotoGridCell_Previews: PreviewProvider {
    static var previews: some View {
        PhotoGridCell(photo: Photo.previewPhotos.first!)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
