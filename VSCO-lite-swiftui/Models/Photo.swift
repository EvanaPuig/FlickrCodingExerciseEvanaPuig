//
//  Photo.swift
//  VSCO-lite
//
//  Created by Evana Margain Puig on 24/03/25.
//

import Foundation

struct Photo: Codable, Identifiable {
    let title: String
    let url: URL?
    let id: String
    let dateTaken: String
    let height: Int?
    let width: Int?
    let owner: String
    let views: String
    let license: String
    @CodableValue var latitude: String // handle Flickr API returning an Int or a String
    @CodableValue var longitude: String // handle Flickr API returning an Int or a String
    @CodableValue var accuracy: String // handle Flickr API returning an Int or a String
    
    enum CodingKeys: String, CodingKey {
        case title
        case url = "url_z"
        case id = "id"
        case dateTaken = "datetaken"
        case height = "height_z"
        case width = "width_z"
        case owner = "ownername"
        case views
        case license
        case latitude
        case longitude
        case accuracy
    }
    
    // use as preview data for SwiftUI
    static var `default`: Photo {
        Photo(
            title: "Flamingos By The Golden Sunset",
            url: URL(string: "https://live.staticflickr.com/65535/50392963378_b2954d2021_z.jpg"),
            id: "50392963378",
            dateTaken: "2017-08-01 09:14:37",
            height: 427,
            width: 640,
            owner: "126108137@N05",
            views: "13375",
            license: "0",
            latitude: "43.462825",
            longitude: "4.484825",
            accuracy: "13"
        )
    }
}
