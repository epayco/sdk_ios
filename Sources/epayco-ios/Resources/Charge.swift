//
//  File.swift
//  
//
//  Created by Roberto Meran on 4/5/21.
//

import Foundation

struct Charge: NetworkManagerDelegate {
    var publicKey: String
    var privateKey: String

    init(_ publicKey: String, _ privateKey: String){
        self.publicKey = publicKey
        self.privateKey = privateKey
    }
    
    public func create(newChargeTransactionData: NewChargeTransactionModel) -> ChargeTransactionModel? {
        let url = K.urlBase + "/payment/v1/charge/create"
        let networkManager = NetworkManager<ChargeTransactionModel>(url, delegate: self)
        let newTransaction = networkManager.performRequest(httpMethod: "POST", requestBody: newChargeTransactionData)
        
        return newTransaction
    }
    
    public func create(newChargeTransactionData: NewChargeTransactionModel, splitData: SplitDataModel) -> ChargeTransactionModel? {
        let url = K.urlBase + "/payment/v1/charge/create"
        let networkManager = NetworkManager<ChargeTransactionModel>(url, delegate: self)
        let newChargeSplitTransactionData = NewChargeSplitTransactionModel(token_card: newChargeTransactionData.token_card, customer_id: newChargeTransactionData.customer_id, doc_type: newChargeTransactionData.doc_type, doc_number: newChargeTransactionData.doc_number, name: newChargeTransactionData.name, last_name: newChargeTransactionData.last_name, email: newChargeTransactionData.email, bill: newChargeTransactionData.bill, description: newChargeTransactionData.description, value: newChargeTransactionData.value, tax: newChargeTransactionData.tax, tax_base: newChargeTransactionData.tax_base, currency: newChargeTransactionData.currency, dues: newChargeTransactionData.dues, address: newChargeTransactionData.address, phone: newChargeTransactionData.phone, cell_phone: newChargeTransactionData.cell_phone, url_response: newChargeTransactionData.url_response, url_confirmation: newChargeTransactionData.url_confirmation, ip: "10.0.0.1", splitpayment: splitData.splitpayment, split_app_id: splitData.split_app_id, split_merchant_id: splitData.split_merchant_id, split_type: splitData.split_type, split_rule: splitData.split_rule, split_primary_receiver: splitData.split_primary_receiver, split_primary_receiver_fee: splitData.split_primary_receiver_fee, split_receivers: splitData.split_receivers, extras: nil)
        let newTransaction = networkManager.performRequest(httpMethod: "POST", requestBody: newChargeSplitTransactionData)
        
        return newTransaction
    }
    
    public func getTransaction(refPayco: String) -> ChargeTransactionGetModel? {
        let url = K.baseUrlSecure + "/restpagos/transaction/response.json?ref_payco=" + refPayco + "&public_key=" + self.publicKey
        let networkManager = NetworkManager<ChargeTransactionGetModel>(url, delegate: self)
        let foundTransaction = networkManager.performRequest(httpMethod: "GET", requestBody: "")
        
        return foundTransaction
    }
}
