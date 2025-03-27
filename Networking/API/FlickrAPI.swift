import Foundation

struct FlickrAPI {
    
    private struct Constants {
        static let API_KEY = "APIKeyShouldGoHere"
        static let BASE_URL = "https://api.flickr.com"
    }
    
    /// Creates a URL request for fetching image data from Flickr
    /// - Parameter searchTerm: Images which title, description, or tags contain the `searchTerm` will be returned
    /// - Returns: URLRequest
    func fetchImageRequest(searchTerm: String) -> URLRequest {
        let url = URL(string: Constants.BASE_URL + "/services/rest/")!
        let queryItems = [
            URLQueryItem(name: "api_key", value: Constants.API_KEY),
            URLQueryItem(name: "method", value: "flickr.photos.search"),
            URLQueryItem(name: "text", value: searchTerm),
            URLQueryItem(name: "format", value: "json"),
            URLQueryItem(name: "nojsoncallback", value: "1") // Ensure this is included to prevent JSONP
        ]
        var request = URLRequest(url: url, queryItems: queryItems)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        return request
    }
}
