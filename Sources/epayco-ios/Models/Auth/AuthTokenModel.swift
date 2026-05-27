import Foundation

public struct AuthTokenModel: Codable {
    public let status: Bool
    public let message: String
    public let bearer_token: String?
    public let data: [String]?
    public let token: String? // Para Apify que devuelve "token"
    
    enum CodingKeys: String, CodingKey {
        case status
        case message
        case bearer_token
        case data
        case token
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.status = (try? container.decode(Bool.self, forKey: .status)) ?? true
        self.message = (try? container.decode(String.self, forKey: .message)) ?? ""
        self.bearer_token = try? container.decode(String.self, forKey: .bearer_token)
        self.data = try? container.decode([String].self, forKey: .data)
        self.token = try? container.decode(String.self, forKey: .token)
    }
}
