import JAYSON
import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking

extension URLSession {
    func data(for request: URLRequest, delegate: URLSessionTaskDelegate? = nil) async throws -> (Data, URLResponse) {
        return try await withCheckedThrowingContinuation { continuation in
            self.dataTask(with: request) { data, reponse, error in
                if let error = error {
                    continuation.resume(throwing: error)
                } else {
                    continuation.resume(returning: (data!, reponse!))
                }
            }.resume()
        }
    }
}
#endif

public struct OneDriveRefresh {
    private let recentToken: String
    private let clientId: String
    
    public init(_ recentToken: String, clientId: String) {
        self.recentToken = recentToken
        self.clientId = clientId
    }
    
    public func refresh() async throws -> String? {
        try await startPost()?.0
    }

    public func access() async throws -> String? {
        try await startPost()?.1
    }
    
    func startPost() async throws -> (String?, String?)? {
        let header = ["Content-Type": "application/x-www-form-urlencoded"]
        var conponents = URLComponents()
        
        conponents.queryItems = [
            URLQueryItem(name: "client_id", value: clientId),
            URLQueryItem(name: "refresh_token", value: recentToken),
            URLQueryItem(name: "grant_type", value: "refresh_token"),
        ]
        
        guard let url = URL(string: "https://login.microsoftonline.com/common/oauth2/token") else { return nil }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = header
        request.httpBody = conponents.query?.data(using: .utf8)
        
        let (data, httpResponse) = try await URLSession.shared.data(for: request)
        
        guard let response = httpResponse as? HTTPURLResponse, response.statusCode == 200 else {
            return nil
        }
        
        let json = try JSON(data: data)
        
        return (json["refresh_token"]?.string, json["access_token"]?.string)
    }
}
