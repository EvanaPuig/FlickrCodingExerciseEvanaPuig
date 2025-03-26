//
//  PhotoGrid.swift
//  VSCO-lite-swiftui
//
//  Created by Evana Margain Puig on 24/03/25.
//

import SwiftUI

struct PhotoGrid: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var columnsAdaptive = [GridItem(.adaptive(minimum: 150, maximum: 300))]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columnsAdaptive, content: {
                ForEach(viewModel.photos) {
                    photo in
                    PhotoGridCell(viewModel: viewModel, photo: photo)
                }
            })
        }
        .padding()
    }
}

struct PhotoGrid_Previews: PreviewProvider {
    static var previews: some View {
        PhotoGrid(viewModel: ViewModel())
    }
}
