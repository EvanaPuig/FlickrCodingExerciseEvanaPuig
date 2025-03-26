//
//  Photo.swift
//  VSCO-lite
//
//  Created by Evana Margain Puig on 24/03/25.
//

import Foundation

struct Photo: Codable, Identifiable {
    let id: String
    let owner: String
    let secret: String
    let server: String
    let title: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case owner = "owner_name"
        case secret
        case server
        case title
    }
    
    // use as preview data for SwiftUI
    static var `default`: Photo {
        Photo(
            id: "50392963378",
            owner: "126108137@N05",
            secret: "b2954d2021",
            server: "65535",
            title: "Flamingos By The Golden Sunset"
        )
    }
}
