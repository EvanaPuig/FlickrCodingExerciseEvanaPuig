//
//  EmptySection.swift
//  VSCO-lite-swiftui
//
//  Created by Evana Margain Puig on 24/03/25.
//

import SwiftUI

struct EmptySection: View {
    var body: some View {
        Section {
            Text("No content found")
                .foregroundColor(.gray)
        }
    }
}

struct EmptySection_Previews: PreviewProvider {
    static var previews: some View {
        EmptySection()
            .previewLayout(.sizeThatFits)
    }
}
