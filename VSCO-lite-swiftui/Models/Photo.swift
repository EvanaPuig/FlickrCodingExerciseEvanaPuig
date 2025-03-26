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
        case owner
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
    
    static var `previewPhotos`: [Photo] {
            [
                Photo(
                    id: "50728793393",
                    owner: "123653963@N02",
                    secret: "6fac389f5c",
                    server: "65535",
                    title: "Nuts."
                ),
                Photo(
                    id: "50731915118",
                    owner: "116475418@N03",
                    secret: "06965bda40",
                    server: "65535",
                    title: "Grandpa's house (winter)"
                ),
                Photo(
                    id: "50730266153",
                    owner: "158685238@N03",
                    secret: "c40619fc56",
                    server: "65535",
                    title: "DSC29544 Makro 2020- in Explore #3  18.12.20"
                ),
                Photo(
                    id: "50732064026",
                    owner: "37834207@N06",
                    secret: "0049e2746a",
                    server: "65535",
                    title: "Blue-gray Gnatcatcher  Legacy Park Malibu Southern California_143"
                ),
                Photo(
                    id: "50731748603",
                    owner: "144273526@N06",
                    secret: "62e36cff30",
                    server: "65535",
                    title: "Table Mountain"
                ),
                Photo(
                    id: "50733608946",
                    owner: "95566715@N08",
                    secret: "b27b930403",
                    server: "65535",
                    title: "Hintersee"
                ),
                Photo(
                    id: "50732421891",
                    owner: "131793185@N08",
                    secret: "808c3a69df",
                    server: "65535",
                    title: "l o c o m o t i v e"
                ),
                Photo(
                    id: "50728842728",
                    owner: "64659159@N02",
                    secret: "16e23aa717",
                    server: "65535",
                    title: "Night of 1000 Candles 2020 (in Explore - Thanks!)"
                ),
                Photo(
                    id: "50732168417",
                    owner: "183705039@N08",
                    secret: "384fa66419",
                    server: "65535",
                    title: "Boat and Sunset"
                ),
                Photo(
                    id: "50730950288",
                    owner: "119400285@N07",
                    secret: "daecced5cd",
                    server: "65535",
                    title: "End of the Road"
                ),
                Photo(
                    id: "50728256067",
                    owner: "129588807@N08",
                    secret: "9a27940f04",
                    server: "65535",
                    title: "Window Pain"
                )                
            ]
        }
}

extension Photo {
    var imageURL: URL? {
        return URL(string: "https://live.staticflickr.com/\(server)/\(id)_\(secret).jpg")
    }
}

