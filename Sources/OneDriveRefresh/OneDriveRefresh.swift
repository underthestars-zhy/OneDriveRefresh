import SwiftyJSON
import Foundation

public struct OneDriveRefresh {
    private let recentToken: String
    private let clientId: String
    
    public init(_ recentToken: String, clientId: String) {
        self.recentToken = recentToken
        self.clientId = clientId
    }
    
    public func refresh() async throws -> String? {
        try await startPost()
    }
    
    func startPost() async throws -> String? {
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
        
        return json["refresh_token"].string
    }
}
