import XCTest
import Alamofire
@testable import EduManagement_iOS

class APIClientTests: XCTestCase {

    var apiClient: APIClient!

    override func setUp() {
        super.setUp()
        apiClient = APIClient.shared
    }

    override func tearDown() {
        apiClient = nil
        super.tearDown()
    }

    func testGetRequest() async throws {
        // Mock response
        let mockData = """
        {
            "id": 1,
            "name": "Test User"
        }
        """.data(using: .utf8)!

        // Mock URLProtocol
        class MockURLProtocol: URLProtocol {
            override class func canInit(with request: URLRequest) -> Bool {
                return true
            }

            override class func canonicalRequest(for request: URLRequest) -> URLRequest {
                return request
            }

            override func startLoading() {
                self.client?.urlProtocol(self, didReceive: HTTPURLResponse(url: self.request.url!, statusCode: 200, httpVersion: nil, headerFields: nil)!, cacheStoragePolicy: .notAllowed)
                self.client?.urlProtocol(self, didLoad: mockData)
                self.client?.urlProtocolDidFinishLoading(self)
            }

            override func stopLoading() {}
        }

        // Configure URLSession with mock protocol
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        let session = Session(configuration: configuration)

        // Inject mocked session into APIClient
        apiClient = APIClient(session: session)

        // Perform GET request
        do {
            let user: TestUser = try await apiClient.get("/test")
            XCTAssertEqual(user.id, 1)
            XCTAssertEqual(user.name, "Test User")
        } catch {
            XCTFail("Request failed with error: \(error)")
        }
    }

    func testPostRequest() async throws {
        // Mock response
        let mockData = """
        {
            "id": 2,
            "name": "New User"
        }
        """.data(using: .utf8)!

        // Mock URLProtocol
        class MockURLProtocol: URLProtocol {
            override class func canInit(with request: URLRequest) -> Bool {
                return true
            }

            override class func canonicalRequest(for request: URLRequest) -> URLRequest {
                return request
            }

            override func startLoading() {
                self.client?.urlProtocol(self, didReceive: HTTPURLResponse(url: self.request.url!, statusCode: 200, httpVersion: nil, headerFields: nil)!, cacheStoragePolicy: .notAllowed)
                self.client?.urlProtocol(self, didLoad: mockData)
                self.client?.urlProtocolDidFinishLoading(self)
            }

            override func stopLoading() {}
        }

        // Configure URLSession with mock protocol
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        let session = Session(configuration: configuration)

        // Inject mocked session into APIClient
        apiClient = APIClient(session: session)

        // Perform POST request
        let parameters: Parameters = ["name": "New User"]
        do {
            let user: TestUser = try await apiClient.post("/test", parameters: parameters)
            XCTAssertEqual(user.id, 2)
            XCTAssertEqual(user.name, "New User")
        } catch {
            XCTFail("Request failed with error: \(error)")
        }
    }
}

// Test model
struct TestUser: Codable {
    let id: Int
    let name: String
}
