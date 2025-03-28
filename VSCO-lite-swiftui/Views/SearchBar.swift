//
//  SearchBar.swift
//  VSCO-lite
//
//  Created by Evana Margain Puig on 24/03/25.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    var onSearch: () -> Void
    
    var body: some View {
        TextField("Search Flickr Photos", text: $text, onCommit: {
            onSearch()
        })
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding()
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""), onSearch: {})
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

