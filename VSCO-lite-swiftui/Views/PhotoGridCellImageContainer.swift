//
//  PhotoGridCellImageContainer.swift
//  VSCO-lite-swiftui
//
//  Created by Evana Margain Puig on 24/03/25.
//

import Kingfisher
import SwiftUI

struct PhotoGridCellImageContainer: View {
    let photo: Photo
    
    var body: some View {
        KFImage(photo.imageURL)
           // set photo display characteristics
           .resizable()
           .aspectRatio(contentMode: .fit)
           .cornerRadius(10.0)
    }
}

struct CellPhotoView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoGridCellImageContainer(photo: Photo.default)
            .previewLayout(.sizeThatFits)
    }
}
