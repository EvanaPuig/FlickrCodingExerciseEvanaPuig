import Foundation

enum NetworkError: Error {
    case noData
    case requestFailed
}

protocol DataProviderProtocol {
    func fetchData(for query: String, completion: @escaping (Result<String, Error>) -> Void)
}

class DataProvider: DataProviderProtocol {
    
    private struct Constants {
        static let DEFAULT_SEARCH_TERM = "sunset"
    }
    
    private let imageAPI = FlickrAPI()
    
    /// Will fetch data from provided image API
    /// - Parameter searchTerm: Data that contains the `searchTerm` will be returned.
    func fetchData(for searchTerm: String = Constants.DEFAULT_SEARCH_TERM, completion: @escaping (Result<String, Error>) -> Void) {
        let request = imageAPI.fetchImageRequest(searchTerm: searchTerm)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data, let string = String(data: data, encoding: .utf8) else {
                completion(.failure(NetworkError.noData))
                return
            }
            
            completion(.success(string))
        }
        
        task.resume()
    }
}
