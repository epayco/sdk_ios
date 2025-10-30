import Foundation

public struct Bank: NetworkManagerDelegate {
    public var publicKey: String
    public var privateKey: String
    public var test: Bool
    public var iv: String
    public var aes128: AES?

    public init(publicKey: String, privateKey: String, test: Bool, iv: String){
        self.publicKey = publicKey
        self.privateKey = privateKey
        self.test = test
        self.iv = iv
        self.aes128 = AES(key: privateKey, iv: iv)
    }
    
   public func create(newBankTransactionData: NewBankTransactionModel) -> BankTransactionModel? {


    // Encriptar extra5 para extras_epayco
    let encryptedExtra5: String = {
        if let customExtras = newBankTransactionData.extras_epayco?.extra5 {
            return aes128?.encrypt(string: customExtras)?.base64EncodedString() ?? ""
        } else {
            return aes128?.encrypt(string: "P48")?.base64EncodedString() ?? ""
        }
    }()
    let extrasEpayco = ExtrasModel(
        extra1: nil,
        extra2: nil,
        extra3: nil,
        extra4: nil,
        extra5: encryptedExtra5,
        extra6: nil,
        extra7: nil,
        extra8: nil,
        extra9: nil,
        extra10: nil
    )

    let url = K.baseUrlSecure + "/restpagos/pagos/debitos.json"
    let networkManager = NetworkManager<BankTransactionModel>(url, delegate: self)
    let bankCreateData = NewBankTransactionCallModel(
        banco: aes128?.encrypt(string: newBankTransactionData.bank)?.base64EncodedString(),
        factura: aes128?.encrypt(string: newBankTransactionData.invoice)?.base64EncodedString(),
        descripcion: aes128?.encrypt(string: newBankTransactionData.description)?.base64EncodedString(),
        valor: aes128?.encrypt(string: newBankTransactionData.value)?.base64EncodedString(),
        iva: aes128?.encrypt(string: newBankTransactionData.tax)?.base64EncodedString(),
        baseiva: aes128?.encrypt(string: newBankTransactionData.taxBase)?.base64EncodedString(),
        moneda: aes128?.encrypt(string: newBankTransactionData.currency)?.base64EncodedString(),
        tipo_persona: aes128?.encrypt(string: newBankTransactionData.personType)?.base64EncodedString(),
        tipo_doc:  aes128?.encrypt(string: newBankTransactionData.docType)?.base64EncodedString(),
        documento: aes128?.encrypt(string: newBankTransactionData.docNumber)?.base64EncodedString(),
        nombres: aes128?.encrypt(string: newBankTransactionData.name)?.base64EncodedString(),
        apellidos: aes128?.encrypt(string: newBankTransactionData.lastName)?.base64EncodedString(),
        email: aes128?.encrypt(string: newBankTransactionData.email)?.base64EncodedString(),
        pais: aes128?.encrypt(string: newBankTransactionData.country)?.base64EncodedString(),
        celular: aes128?.encrypt(string: newBankTransactionData.cellPhone)?.base64EncodedString(),
        url_respuesta: aes128?.encrypt(string: newBankTransactionData.responseUrl)?.base64EncodedString(),
        url_confirmacion: aes128?.encrypt(string: newBankTransactionData.confirmationUrl)?.base64EncodedString(),
        metodoconfirmacion: aes128?.encrypt(string: newBankTransactionData.confirmationMethod)?.base64EncodedString(),
        extra1: aes128?.encrypt(string: newBankTransactionData.extra1)?.base64EncodedString(),
        extra2: aes128?.encrypt(string: newBankTransactionData.extra2)?.base64EncodedString(),
        extra3: aes128?.encrypt(string: newBankTransactionData.extra3)?.base64EncodedString(),
        extra4: aes128?.encrypt(string: newBankTransactionData.extra4)?.base64EncodedString(),
        extra5: aes128?.encrypt(string: newBankTransactionData.extra5)?.base64EncodedString(),
        extra6: aes128?.encrypt(string: newBankTransactionData.extra6)?.base64EncodedString(),
        extra7: aes128?.encrypt(string: newBankTransactionData.extra7)?.base64EncodedString(),
        public_key: self.publicKey,
        enpruebas: aes128?.encrypt(string: String(self.test))?.base64EncodedString(),
        ip: aes128?.encrypt(string: newBankTransactionData.ip)?.base64EncodedString(),
        lenguaje: "swift",
        i: Data(self.iv.utf8).base64EncodedString(),
        extras_epayco: extrasEpayco)


    // Imprimir el JSON antes de enviar la solicitud para depuración
    if let jsonData = try? JSONEncoder().encode(bankCreateData),
       let jsonString = String(data: jsonData, encoding: .utf8) {
        print("\n📤 JSON enviado a la API REST:\n", jsonString)
    } else {
        print("\n⚠️ Error al serializar bankCreateData a JSON")
    }

    let newTransaction = networkManager.performRequest(httpMethod: "POST", requestBody: bankCreateData)

    return newTransaction
}
    
    public func create(newBankTransactionData: NewBankTransactionModel, splitData: SplitDataModel) -> BankTransactionModel? {

        let extrasEpayco = newBankTransactionData.extras_epayco ?? ExtrasModel()

        let url = K.baseUrlSecure + "/restpagos/pagos/debitos.json"
        let networkManager = NetworkManager<BankTransactionModel>(url, delegate: self)
        let bankCreateData = NewBankTransactionSplitCallModel(
            banco: aes128?.encrypt(string: newBankTransactionData.bank)?.base64EncodedString(),
            factura: aes128?.encrypt(string: newBankTransactionData.invoice)?.base64EncodedString(),
            descripcion: aes128?.encrypt(string: newBankTransactionData.description)?.base64EncodedString(),
            valor: aes128?.encrypt(string: newBankTransactionData.value)?.base64EncodedString(),
            iva: aes128?.encrypt(string: newBankTransactionData.tax)?.base64EncodedString(),
            baseiva: aes128?.encrypt(string: newBankTransactionData.taxBase)?.base64EncodedString(),
            moneda: aes128?.encrypt(string: newBankTransactionData.currency)?.base64EncodedString(),
            tipo_persona: aes128?.encrypt(string: newBankTransactionData.personType)?.base64EncodedString(),
            tipo_doc: aes128?.encrypt(string: newBankTransactionData.docType)?.base64EncodedString(),
            documento: aes128?.encrypt(string: newBankTransactionData.docNumber)?.base64EncodedString(),
            nombres: aes128?.encrypt(string: newBankTransactionData.name)?.base64EncodedString(),
            apellidos: aes128?.encrypt(string: newBankTransactionData.lastName)?.base64EncodedString(),
            email: aes128?.encrypt(string: newBankTransactionData.email)?.base64EncodedString(),
            pais: aes128?.encrypt(string: newBankTransactionData.country)?.base64EncodedString(),
            celular: aes128?.encrypt(string: newBankTransactionData.cellPhone)?.base64EncodedString(),
            url_respuesta: aes128?.encrypt(string: newBankTransactionData.responseUrl)?.base64EncodedString(),
            url_confirmacion: aes128?.encrypt(string: newBankTransactionData.confirmationUrl)?.base64EncodedString(),
            metodoconfirmacion: aes128?.encrypt(string: newBankTransactionData.confirmationMethod)?.base64EncodedString(),
            extra1: aes128?.encrypt(string: newBankTransactionData.extra1)?.base64EncodedString(),
            extra2: aes128?.encrypt(string: newBankTransactionData.extra2)?.base64EncodedString(),
            extra3: aes128?.encrypt(string: newBankTransactionData.extra3)?.base64EncodedString(),
            extra4: aes128?.encrypt(string: newBankTransactionData.extra4)?.base64EncodedString(),
            extra5: aes128?.encrypt(string: newBankTransactionData.extra5)?.base64EncodedString(),
            extra6: aes128?.encrypt(string: newBankTransactionData.extra6)?.base64EncodedString(),
            extra7: aes128?.encrypt(string: newBankTransactionData.extra7)?.base64EncodedString(),
            extras_epayco: extrasEpayco,
            public_key: self.publicKey,
            enpruebas: aes128?.encrypt(string: String(self.test))?.base64EncodedString(),
            ip: aes128?.encrypt(string: newBankTransactionData.ip)?.base64EncodedString(),
            lenguaje: "swift",
            i: Data(self.iv.utf8).base64EncodedString(),
            splitpayment: aes128?.encrypt(string: splitData.splitpayment)?.base64EncodedString(),
            split_app_id: aes128?.encrypt(string: splitData.split_app_id)?.base64EncodedString(),
            split_merchant_id: aes128?.encrypt(string: splitData.split_merchant_id)?.base64EncodedString(),
            split_type: aes128?.encrypt(string: splitData.split_type)?.base64EncodedString(),
            split_rule: aes128?.encrypt(string: splitData.split_rule)?.base64EncodedString(),
            split_primary_receiver: aes128?.encrypt(string: splitData.split_primary_receiver)?.base64EncodedString(),
            split_primary_receiver_fee: aes128?.encrypt(string: splitData.split_primary_receiver_fee)?.base64EncodedString(),
            split_receivers: aes128?.encrypt(string: splitData.split_receivers.description)?.base64EncodedString()
        )
        let newTransaction = networkManager.performRequest(httpMethod: "POST", requestBody: bankCreateData)

        return newTransaction
    }
    
    public func getTransaction(transactionId: String) -> BankTransactionGetModel? {
        let url = K.baseUrlSecure + "/restpagos/pse/transactioninfomation.json?transactionID=" + transactionId + "&public_key=" + self.publicKey
        let networkManager = NetworkManager<BankTransactionGetModel>(url, delegate: self)
        let foundTransaction = networkManager.performRequest(httpMethod: "GET", requestBody: "")
        
        return foundTransaction
    }
    
    public func getBanksList() -> BankInfoModel? {
        let url = K.baseUrlSecure + "/restpagos/pse/bancos.json?public_key=" + self.publicKey
        let networkManager = NetworkManager<BankInfoModel>(url, delegate: self)
        let foundBanks = networkManager.performRequest(httpMethod: "GET", requestBody: "")
        
        return foundBanks
    }
}
