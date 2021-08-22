//
//  File.swift
//  
//
//  Created by Roberto Meran on 4/16/21.
//

import Foundation

struct CashTransactionGetModel: Encodable {
    let success: Bool
    let title_response: String
    let text_response: String
    let last_action: String
    let data: CashTransactionGetDataModel?
}

struct CashTransactionGetDataModel: Encodable {
    let x_cust_id_cliente: Int?
    let x_ref_payco: Int?
    let x_id_factura: String?
    let x_id_invoice: String?
    let x_description: String?
    let x_amount: Int?
    let x_amount_country: Int?
    let x_amount_ok: Int?
    let x_tax: Int?
    let x_amount_base: Int?
    let x_currency_code: String?
    let x_bank_name: String?
    let x_cardnumber: String?
    let x_quotas: String?
    let x_respuesta: String?
    let x_response: String?
    let x_approval_code: String?
    let x_transaction_id: String?
    let x_fecha_transaccion: String?
    let x_transaction_date: String?
    let x_cod_respuesta: String?
    let x_cod_response: String?
    let x_response_reason_text: String?
    let x_cod_transaction_state: String?
    let x_transaction_state: String?
    let x_errorcode: String?
    let x_franchise: String?
    let x_business: String?
    let x_customer_doctype: String?
    let x_customer_document: String?
    let x_customer_name: String?
    let x_customer_lastname: String?
    let x_customer_email: String?
    let x_customer_phone: String?
    let x_customer_movil: String?
    let x_customer_ind_pais: String?
    let x_customer_country: String?
    let x_customer_city: String?
    let x_customer_address: String?
    let x_customer_ip: String?
    let x_signature: String?
    let x_test_request: String?
    let x_extra1: String?
    let x_extra2: String?
    let x_extra3: String?
    let x_extra4: String?
    let x_extra5: String?
    let x_extra6: String?
    let x_extra7: String?
    let x_extra8: String?
    let x_extra9: String?
    let x_extra10: String?
}
