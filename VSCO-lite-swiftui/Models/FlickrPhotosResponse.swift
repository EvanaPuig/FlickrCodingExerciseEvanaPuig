//
//  FlickrPhotosResponse.swift
//  VSCO-lite
//
//  Created by Evana Margain Puig on 25/03/25.
//

struct FlickrPhotosResponse: Codable {
    let photos: [Photo]
    
    enum CodingKeys: String, CodingKey {
        case photos = "photo"
    }
}
