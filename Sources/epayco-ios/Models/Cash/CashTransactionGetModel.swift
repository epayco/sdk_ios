import Foundation

public struct CashTransactionGetModel: Encodable {
    public let success: Bool
    public let title_response: String
    public let text_response: String
    public let last_action: String
    public let data: CashTransactionGetDataModel?
}

public struct CashTransactionGetDataModel: Encodable {
    public let x_cust_id_cliente: Int?
    public let x_ref_payco: Int?
    public let x_id_factura: String?
    public let x_id_invoice: String?
    public let x_description: String?
    public let x_amount: Int?
    public let x_amount_country: Int?
    public let x_amount_ok: Int?
    public let x_tax: Int?
    public let x_amount_base: Int?
    public let x_currency_code: String?
    public let x_bank_name: String?
    public let x_cardnumber: String?
    public let x_quotas: String?
    public let x_respuesta: String?
    public let x_response: String?
    public let x_approval_code: String?
    public let x_transaction_id: String?
    public let x_fecha_transaccion: String?
    public let x_transaction_date: String?
    public let x_cod_respuesta: String?
    public let x_cod_response: String?
    public let x_response_reason_text: String?
    public let x_cod_transaction_state: String?
    public let x_transaction_state: String?
    public let x_errorcode: String?
    public let x_franchise: String?
    public let x_business: String?
    public let x_customer_doctype: String?
    public let x_customer_document: String?
    public let x_customer_name: String?
    public let x_customer_lastname: String?
    public let x_customer_email: String?
    public let x_customer_phone: String?
    public let x_customer_movil: String?
    public let x_customer_ind_pais: String?
    public let x_customer_country: String?
    public let x_customer_city: String?
    public let x_customer_address: String?
    public let x_customer_ip: String?
    public let x_signature: String?
    public let x_test_request: String?
    public let x_extra1: String?
    public let x_extra2: String?
    public let x_extra3: String?
    public let x_extra4: String?
    public let x_extra5: String?
    public let x_extra6: String?
    public let x_extra7: String?
    public let x_extra8: String?
    public let x_extra9: String?
    public let x_extra10: String?
}
