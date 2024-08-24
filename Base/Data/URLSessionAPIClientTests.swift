import XCTest
@testable import EduManagement_iOS

class URLSessionAPIClientTests: XCTestCase {
    var apiClient: URLSessionAPIClient!
    var mockURLSession: URLSession!

    override func setUp() {
        super.setUp()
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        mockURLSession = URLSession(configuration: configuration)
        apiClient = URLSessionAPIClient(session: mockURLSession)
    }

    override func tearDown() {
        apiClient = nil
        mockURLSession = nil
        super.tearDown()
    }

    func testGetRequest() async throws {
        // Given
        let expectedData = """
        {
            "id": 1,
            "name": "Test User"
        }
        """.data(using: .utf8)!

        MockURLProtocol.requestHandler = { request in
            return (HTTPURLResponse(), expectedData)
        }

        // When
        let user: TestUser = try await apiClient.get("/test")

        // Then
        XCTAssertEqual(user.id, 1)
        XCTAssertEqual(user.name, "Test User")
    }

    func testPostRequest() async throws {
        // Given
        let expectedData = """
        {
            "id": 2,
            "name": "New User"
        }
        """.data(using: .utf8)!

        MockURLProtocol.requestHandler = { request in
            return (HTTPURLResponse(), expectedData)
        }

        // When
        let parameters: [String: Any] = ["name": "New User"]
        let user: TestUser = try await apiClient.post("/test", parameters: parameters)

        // Then
        XCTAssertEqual(user.id, 2)
        XCTAssertEqual(user.name, "New User")
    }

    func testInvalidURLError() async {
        // Given
        apiClient = URLSessionAPIClient(session: mockURLSession)
        apiClient.baseURL = "invalid url"

        // When/Then
        do {
            let _: TestUser = try await apiClient.get("/test")
            XCTFail("Expected invalidURL error")
        } catch {
            XCTAssertTrue(error is APIError)
            XCTAssertEqual(error as? APIError, .invalidURL)
        }
    }

    func testNetworkError() async {
        // Given
        let networkError = NSError(domain: NSURLErrorDomain, code: NSURLErrorNotConnectedToInternet, userInfo: nil)
        MockURLProtocol.requestHandler = { request in
            throw networkError
        }

        // When/Then
        do {
            let _: TestUser = try await apiClient.get("/test")
            XCTFail("Expected networkError")
        } catch {
            XCTAssertTrue(error is APIError)
            if case APIError.networkError(let underlyingError) = error {
                XCTAssertEqual(underlyingError as NSError, networkError)
            } else {
                XCTFail("Expected networkError")
            }
        }
    }

    func testDecodingError() async {
        // Given
        let invalidJSON = "Invalid JSON".data(using: .utf8)!
        MockURLProtocol.requestHandler = { request in
            return (HTTPURLResponse(), invalidJSON)
        }

        // When/Then
        do {
            let _: TestUser = try await apiClient.get("/test")
            XCTFail("Expected decodingError")
        } catch {
            XCTAssertTrue(error is APIError)
            XCTAssertTrue(error is APIError)
            if case APIError.decodingError = error {
                // Success
            } else {
                XCTFail("Expected decodingError")
            }
        }
    }
}

// MARK: - Helper

struct TestUser: Codable {
    let id: Int
    let name: String
}

class MockURLProtocol: URLProtocol {
    static var requestHandler: ((URLRequest) throws -> (HTTPURLResponse, Data))?

    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }

    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }

    override func startLoading() {
        guard let handler = MockURLProtocol.requestHandler else {
            fatalError("Handler is unavailable.")
        }

        do {
            let (response, data) = try handler(request)
            client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
            client?.urlProtocol(self, didLoad: data)
            client?.urlProtocolDidFinishLoading(self)
        } catch {
            client?.urlProtocol(self, didFailWithError: error)
        }
    }

    override func stopLoading() {}
}
