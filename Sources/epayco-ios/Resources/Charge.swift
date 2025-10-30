//
//  File.swift
//  
//
//  Created by Roberto Meran on 4/5/21.
//

import Foundation

public struct Charge: NetworkManagerDelegate {
    public var publicKey: String
    public var privateKey: String

    public init(_ publicKey: String, _ privateKey: String){
        self.publicKey = publicKey
        self.privateKey = privateKey
    }
    
   
   public func create(newChargeTransactionData: NewChargeTransactionModel) -> ChargeTransactionModel? {
    // Si el usuario no envía extras_epayco, lo agregamos automáticamente
    let extrasEpayco = newChargeTransactionData.extras_epayco ?? ExtrasModel(
        extra1: nil, extra2: nil, extra3: nil, extra4: nil,
        extra6: nil, extra7: nil, extra8: nil, extra9: nil, extra10: nil
    )

    // Creamos una copia del modelo con el campo extras_epayco seguro
    let dataWithExtras = NewChargeTransactionModel(
        token_card: newChargeTransactionData.token_card,
        customer_id: newChargeTransactionData.customer_id,
        doc_type: newChargeTransactionData.doc_type,
        doc_number: newChargeTransactionData.doc_number,
        name: newChargeTransactionData.name,
        last_name: newChargeTransactionData.last_name,
        email: newChargeTransactionData.email,
        bill: newChargeTransactionData.bill,
        description: newChargeTransactionData.description,
        value: newChargeTransactionData.value,
        tax: newChargeTransactionData.tax,
        tax_base: newChargeTransactionData.tax_base,
        currency: newChargeTransactionData.currency,
        dues: newChargeTransactionData.dues,
        address: newChargeTransactionData.address,
        phone: newChargeTransactionData.phone,
        cell_phone: newChargeTransactionData.cell_phone,
        url_response: newChargeTransactionData.url_response,
        url_confirmation: newChargeTransactionData.url_confirmation,
        ip: newChargeTransactionData.ip,
        extras: newChargeTransactionData.extras,
        extras_epayco: extrasEpayco // <-- Aquí siempre va el objeto con extra5: "P48"
    )

    let url = K.urlBase + "/payment/v1/charge/create"
    let networkManager = NetworkManager<ChargeTransactionModel>(url, delegate: self)
    let newTransaction = networkManager.performRequest(httpMethod: "POST", requestBody: dataWithExtras)
    return newTransaction
}
    
    public func create(newChargeTransactionData: NewChargeTransactionModel, splitData: SplitDataModel) -> ChargeTransactionModel? {
        
        let extrasEpayco = newChargeTransactionData.extras_epayco ?? ExtrasModel(
            extra1: nil, extra2: nil, extra3: nil, extra4: nil,
            extra6: nil, extra7: nil, extra8: nil, extra9: nil, extra10: nil
        )
        let url = K.urlBase + "/payment/v1/charge/create"
        let networkManager = NetworkManager<ChargeTransactionModel>(url, delegate: self)
        let newChargeSplitTransactionData = NewChargeSplitTransactionModel(
            token_card: newChargeTransactionData.token_card,
            customer_id: newChargeTransactionData.customer_id,
            doc_type: newChargeTransactionData.doc_type,
            doc_number: newChargeTransactionData.doc_number,
            name: newChargeTransactionData.name,
            last_name: newChargeTransactionData.last_name,
            email: newChargeTransactionData.email,
            bill: newChargeTransactionData.bill,
            description: newChargeTransactionData.description,
            value: newChargeTransactionData.value,
            tax: newChargeTransactionData.tax,
            tax_base: newChargeTransactionData.tax_base,
            currency: newChargeTransactionData.currency,
            dues: newChargeTransactionData.dues,
            address: newChargeTransactionData.address,
            phone: newChargeTransactionData.phone,
            cell_phone: newChargeTransactionData.cell_phone,
            url_response: newChargeTransactionData.url_response,
            url_confirmation: newChargeTransactionData.url_confirmation,
            ip: splitData.ip,
            splitpayment: splitData.splitpayment,
            split_app_id: splitData.split_app_id,
            split_merchant_id: splitData.split_merchant_id,
            split_type: splitData.split_type,
            split_rule: splitData.split_rule,
            split_primary_receiver: splitData.split_primary_receiver,
            split_primary_receiver_fee: splitData.split_primary_receiver_fee,
            split_receivers: splitData.split_receivers,
            extras: nil,
            extras_epayco: extrasEpayco
        )
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
