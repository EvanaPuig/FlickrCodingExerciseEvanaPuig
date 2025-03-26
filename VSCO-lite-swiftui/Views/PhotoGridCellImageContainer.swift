//
//  PhotoGridCellImageContainer.swift
//  VSCO-lite-swiftui
//
//  Created by Evana Margain Puig on 24/03/25.
//

import SwiftUI

struct PhotoGridCellImageContainer: View {
    let photo: Photo
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct CellPhotoView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoGridCellImageContainer(photo: Photo.default)
            .previewLayout(.sizeThatFits)
    }
}
