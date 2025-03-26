//
//  PhotoGridCell.swift
//  VSCO-lite-swiftui
//
//  Created by Evana Margain Puig on 24/03/25.
//

import SwiftUI

struct PhotoGridCell: View {
    
    @ObservedObject var viewModel: ViewModel
    
    let photo: Photo
    
    var body: some View {
        ZStack {
            // Show a progress view until the photo overlays it
            ProgressView()
            // Display the photo
            PhotoGridCellImageContainer(photo: photo)
                // set up for tap navigation
                .onTapGesture {
                    // do whatever is needed on tap
                }
        }
        .padding()
    }
}

struct PhotoGridCell_Previews: PreviewProvider {
    static var previews: some View {
        PhotoGridCell(viewModel: ViewModel(), photo: Photo.default)
    }
}
