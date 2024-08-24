import Foundation

enum APIError: Error {
    case invalidURL
    case networkError(Error)
    case decodingError(Error)
}

class URLSessionAPIClient {
    static let shared = URLSessionAPIClient()

    private let baseURL = "https://api.example.com" // Replace with your actual base URL
    private let session: URLSession

    init(session: URLSession = .shared) {
        self.session = session
    }

    func request<T: Decodable>(_ endpoint: String,
                               method: String = "GET",
                               parameters: [String: Any]? = nil) async throws -> T {
        guard let url = URL(string: baseURL + endpoint) else {
            throw APIError.invalidURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = method

        if let parameters = parameters {
            request.httpBody = try? JSONSerialization.data(withJSONObject: parameters)
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }

        do {
            let (data, _) = try await session.data(for: request)
            let decodedResponse = try JSONDecoder().decode(T.self, from: data)
            return decodedResponse
        } catch let error as DecodingError {
            throw APIError.decodingError(error)
        } catch {
            throw APIError.networkError(error)
        }
    }

    // Example GET request
    func get<T: Decodable>(_ endpoint: String) async throws -> T {
        return try await request(endpoint, method: "GET")
    }

    // Example POST request
    func post<T: Decodable>(_ endpoint: String, parameters: [String: Any]) async throws -> T {
        return try await request(endpoint, method: "POST", parameters: parameters)
    }
}
