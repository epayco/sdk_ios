import Foundation

public struct ChargeTransactionGetModel: Codable {
    public let success: Bool
    public let title_response: String
    public let text_response: String
    public let last_action: String
    public let data: ChargeTransactionDataModel?
}
