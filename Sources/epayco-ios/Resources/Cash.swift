//
//  File.swift
//  
//
//  Created by Roberto Meran on 4/5/21.
//

import Foundation

struct Cash: NetworkManagerDelegate {
    var publicKey: String
    var privateKey: String
    var test: Bool

    init(_ publicKey: String, _ privateKey: String, _ test: Bool){
        self.publicKey = publicKey
        self.privateKey = privateKey
        self.test = test
    }
    
    public func create(paymentMethod: String, newCashTransactionData: NewCashTransactionModel) -> CashTransactionModel? {
        let url = K.baseUrlSecure + "/restpagos/v2/efectivo/" + paymentMethod
        let networkManager = NetworkManager<CashTransactionModel>(url, delegate: self)
        let cashCreateData = NewCashTransactionCallModel(factura: newCashTransactionData.invoice, descripcion: newCashTransactionData.description, valor: newCashTransactionData.value, iva: newCashTransactionData.tax, baseiva: newCashTransactionData.taxBase, moneda: newCashTransactionData.currency, tipo_persona: newCashTransactionData.personType, tipo_doc: newCashTransactionData.docType, documento: newCashTransactionData.docNumber, nombres: newCashTransactionData.name, apellidos: newCashTransactionData.lastName, email: newCashTransactionData.email, celular: newCashTransactionData.cellPhone, fechaexpiracion: newCashTransactionData.endDate, url_respuesta: newCashTransactionData.responseUrl, url_confirmacion: newCashTransactionData.confirmationUrl, metodoconfirmacion: newCashTransactionData.confirmationMethod, public_key: self.publicKey, enpruebas: self.test, ip: newCashTransactionData.ip, lenguaje: "swift")
        let newCashTransaction = networkManager.performRequest(httpMethod: "POST", requestBody: cashCreateData)
        
        return newCashTransaction
    }
    
    public func create(paymentMethod: String, newCashTransactionData: NewCashTransactionModel, splitData: SplitDataModel) -> CashTransactionModel? {
        let url = K.baseUrlSecure + "/restpagos/v2/efectivo/" + paymentMethod
        let networkManager = NetworkManager<CashTransactionModel>(url, delegate: self)
        let cashCreateData = NewCashTransactionSplitCallModel(factura: newCashTransactionData.invoice, descripcion: newCashTransactionData.description, valor: newCashTransactionData.value, iva: newCashTransactionData.tax, baseiva: newCashTransactionData.taxBase, moneda: newCashTransactionData.currency, tipo_persona: newCashTransactionData.personType, tipo_doc: newCashTransactionData.docType, documento: newCashTransactionData.docNumber, nombres: newCashTransactionData.name, apellidos: newCashTransactionData.lastName, email: newCashTransactionData.email, celular: newCashTransactionData.cellPhone, fechaexpiracion: newCashTransactionData.endDate, url_respuesta: newCashTransactionData.responseUrl, url_confirmacion: newCashTransactionData.confirmationUrl, metodoconfirmacion: newCashTransactionData.confirmationMethod, public_key: self.publicKey, enpruebas: self.test, ip: newCashTransactionData.ip, lenguaje: "swift", splitpayment: splitData.splitpayment, split_app_id: splitData.split_app_id, split_merchant_id: splitData.split_merchant_id, split_type: splitData.split_type, split_rule: splitData.split_rule, split_primary_receiver: splitData.split_primary_receiver, split_primary_receiver_fee: splitData.split_primary_receiver_fee, split_receivers: splitData.split_receivers)
        let newCashTransaction = networkManager.performRequest(httpMethod: "POST", requestBody: cashCreateData)
        
        return newCashTransaction
    }
    
    public func getTransaction(refPayco: String) -> CashTransactionModel? {
        let url = K.baseUrlSecure + "/restpagos/transaction/response.json?ref_payco=" + refPayco + "&public_key=" + self.publicKey
        let networkManager = NetworkManager<CashTransactionModel>(url, delegate: self)
        let foundTransaction = networkManager.performRequest(httpMethod: "GET", requestBody: "")
        
        return foundTransaction
    }
}
