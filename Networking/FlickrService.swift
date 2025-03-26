//
//  FlickrService.swift
//  VSCO-lite
//
//  Created by Evana Margain Puig on 26/03/25.
//

import Foundation

struct FlickrService {
    
    private struct Constants {
        static let API_KEY = "APIKeyShouldGoHere"
        static let BASE_URL = "https://api.flickr.com/services/rest/"
    }
    
    enum NetworkError: Error {
        case invalidURL
        case requestFailed(Error)
        case decodingError(Error)
    }
    
    func fetchPhotos(searchTerm: String, page: Int = 1, completion: @escaping (Result<[Photo], NetworkError>) -> Void) {
        guard var urlComponents = URLComponents(string: Constants.BASE_URL) else {
            completion(.failure(.invalidURL))
            return
        }

        urlComponents.queryItems = [
            URLQueryItem(name: "method", value: "flickr.photos.search"),
            URLQueryItem(name: "api_key", value: Constants.API_KEY),
            URLQueryItem(name: "text", value: searchTerm),
            URLQueryItem(name: "format", value: "json"),
            URLQueryItem(name: "nojsoncallback", value: "1"),
            URLQueryItem(name: "per_page", value: "20"),
            URLQueryItem(name: "page", value: "\(page)")
        ]

        guard let url = urlComponents.url else {
            completion(.failure(.invalidURL))
            return
        }

        print("🔵 Requesting URL: \(url)")

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(.requestFailed(error)))
                return
            }

            guard let data = data else {
                completion(.failure(.invalidURL))
                return
            }

            do {
                let response = try JSONDecoder().decode(FlickrPhotosInfoResponse.self, from: data)
                completion(.success(response.photosInfo.photos))
            } catch {
                completion(.failure(.decodingError(error)))
            }
        }.resume()
    }

}
