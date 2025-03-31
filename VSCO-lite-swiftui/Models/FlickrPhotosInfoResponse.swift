//
//  FlickrPhotosInfoResponse.swift
//  VSCO-lite
//
//  Created by Evana Margain Puig on 25/03/25.
//

struct FlickrPhotosInfoResponse: Codable {
    let photosInfo: FlickrPhotosResponse
    
    enum CodingKeys: String, CodingKey {
        case photosInfo = "photos"
    }
}
