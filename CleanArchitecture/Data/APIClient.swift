import Foundation
import Alamofire

class APIClient {
    static let shared = APIClient()

    private let baseURL = "https://api.example.com" // Replace with your actual base URL
    private let session: Session

    init(session: Session = .default) {
        self.session = session
    }

    func request<T: Decodable>(_ endpoint: String,
                               method: HTTPMethod = .get,
                               parameters: Parameters? = nil,
                               headers: HTTPHeaders? = nil) async throws -> T {
        let url = baseURL + endpoint

        let dataTask = session.request(url, method: method, parameters: parameters, headers: headers)
            .validate()
            .serializingDecodable(T.self)

        return try await dataTask.value
    }

    // Example GET request
    func get<T: Decodable>(_ endpoint: String) async throws -> T {
        return try await request(endpoint, method: .get)
    }

    // Example POST request
    func post<T: Decodable>(_ endpoint: String, parameters: Parameters) async throws -> T {
        return try await request(endpoint, method: .post, parameters: parameters)
    }
}
