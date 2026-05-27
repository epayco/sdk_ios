mport SwiftUI

 

import epayco_ios

 

 

 

struct ContentView: View {

 

    @State var createTokenViewModel: CreateTokenViewModel = CreateTokenViewModel()

 

    

 

    var body: some View {

 

        VStack {

 

            Image(systemName: "globe")

 

                .imageScale(.large)

 

                .foregroundStyle(.tint)

 

            Text("Probando servicios ePayco")

 

        }

 

        .padding()

 

        .onAppear {

 

            createTokenViewModel.auth()

 

        }

 

    }

 

}

 

 

 

@Observable

 

class CreateTokenViewModel {

    

    

    let publicKey = "87d310617168bae0d185355f0ab2990f"

    let privateKey = "46ffdfa47559339823ec25b26a361962"

    

    

    

    let tokenClass: Token

    

    let authClass: Auth

    

    let epayco: Epayco

    

    let customer: Customer

    

    let bankTransaction: Bank

    

    let cashModel: Cash

    

    

    

    var tokenID = ""

    

    var customerId = ""

    

    

    

    init() {

        

        tokenClass = Token(publicKey, privateKey)

        

        authClass = Auth(publicKey, privateKey)

        

        epayco = Epayco(publicKey: publicKey, privateKey: privateKey, lang: "ES", test: true)

        

        customer = Customer(publicKey, privateKey)

        

        bankTransaction = Bank(publicKey: publicKey, privateKey: privateKey, test: true, iv: "0000000000000000")

        

        cashModel = Cash(publicKey, privateKey, true)

        

    }

    

    

    

    // MARK: - AUTENTICACIÓN

    

    func auth() {

        

        print("Iniciando autenticación...")

        

        let authResponse = authClass.authenticate()

        

        print(" authResponse:", authResponse ?? "Sin respuesta")

        

        createToken()

        

    }

    

    

    

    // MARK: - TOKEN

    

    func createToken() {

        

        print("\n Creando token...")

        

        let newTokenModel = NewTokenModel(

            

            card: CardTokenModel(

                

                number: "4575623182290326",

                 exp_year: "2027" ,

                

                exp_month: "12",

                

                cvc: "123"

                

            )

            

        )

        

        

        

        let tokenCreated = tokenClass.create(newTokenData: newTokenModel)

        

        switch tokenCreated {

        case .success(let tokenModel):

            print("✅ Token creado exitosamente")

            print("Token ID: \(tokenModel.id ?? "No disponible")")

            print("Token Model completo: \(tokenModel)")

        

            tokenID = tokenModel.id ?? ""

            if !tokenID.isEmpty {

                createClient()

            } else {

                print("❌ Error: No se obtuvo el ID del token")

                return

            }

        case .failure(let error):

            print("❌ Error creando token: \(error.message)")

            print("Error detalles: \(error)")

            return

        }

        

        //

        

        //    // MARK: - CLIENTE

        

        func createClient() {

            

            print("\n🔹 Creando cliente...")

            

            let clientCreateResponse = customer.create(

                

                newCustomerData: NewCustomerModel(

                    

                    token_card: tokenID,

                    

                    name: "Andres",

                    

                    last_name: "QA",

                    

                    email: "jg@gmail.com",

                    

                    isDefault: true,

                    

                    city: "Medellin",

                    

                    address: "Carrera 12 #13-24",

                    

                    phone: "3243578688",

                    

                    cell_phone: "3243578688"

                    

                )

                

            )

            

            print("✅ clientCreateResponse:", clientCreateResponse)

            

            

            

            switch clientCreateResponse {

            case .success(let customerModel):

                guard let customer_id = customerModel.data.customerId else {

                    print("❌ Error: No se obtuvo el ID del cliente")

                    return

                }

                customerId = customer_id

                cashTransfer()

            case .failure(let error):

                print("❌ Error creando cliente: \(error.message)")

                return

            }

            

            //    func chargeTransfer() {

            

            //        print("\n🔹 Iniciando cobro con tarjeta...")

            

            //        let newChargeTransactionModel = NewChargeTransactionModel(

            

            //            token_card: tokenID,

            

            //            customer_id: customerId,

            

            //            doc_type: "CC",

            

            //            doc_number: "15455565",

            

            //            name: "John",

            

            //            last_name: "Doe",

            

            //            email: "example@email.com",

            

            //            bill: "Pruebas-QA TC",

            

            //            description: "Test Payment",

            

            //            value: "116000",

            

            //            tax: "16000",

            

            //            tax_base: "100000",

            

            //            currency: "COP",

            

            //            dues: "1",

            

            //            address: "cr 44 55 66",

            

            //            phone: "2550102",

            

            //            cell_phone: "3010000001",

            

            //            url_response: "https://tudominio.com/respuesta.php",

            

            //            url_confirmation: "https://tudominio.com/confirmacion.php",

            

            //            ip: "179.12.113.12",

            

            //            extras: nil,

            

            //            extras_epayco: nil

            

            //        )

            

            //

            

            //        let chargeTransaction = epayco.charge.create(newChargeTransactionData: newChargeTransactionModel)

            

            //        print("✅ chargeTransaction:", chargeTransaction ?? "Error en cobro con tarjeta")

            

            //    }

            

            

            

            // MARK: - PAGO POR BANCO

            

            //    func createChargeBank() {

            

            //        print("\n🔹 Iniciando pago por banco...")

            

            //        let newChargeTransactionData = NewBankTransactionModel(

            

            //            bank: "1022", // Código válido de banco

            

            //            invoice: "12p",

            

            //            description: "Pago pruebas",

            

            //            value: "10000",

            

            //            tax: "0",

            

            //            taxBase: "0",

            

            //            currency: "COP",

            

            //            personType: "0", // Persona natural

            

            //            docType: "CC",

            

            //            docNumber: "122335566",

            

            //            name: "PRUEBAS",

            

            //            lastName: "PAYCO",

            

            //            email: "no-responder@payco.co",

            

            //            country: "CO",

            

            //            cellPhone: "3010000001",

            

            //            responseUrl: "https://ejemplo.com/respuesta.html",

            

            //            confirmationUrl: "https://ejemplo.com/confirmacion",

            

            //            confirmationMethod: "GET",

            

            //            ip: "186.97.212.162",

            

            //            extra1: "",

            

            //            extra2: "",

            

            //            extra3: "",

            

            //            extra4: "",

            

            //            extra5: "",

            

            //            extra6: "",

            

            //            extra7: ""

            

            //

            

            //        )

            

            //

            

            //        let newTransaction = epayco.bank.create(newBankTransactionData: newChargeTransactionData)

            

            //        print("✅ bankTransaction:", newTransaction ?? "Error creando pago por banco")    }

            

            

            

            // MARK: - PAGO EN EFECTIVO

            

            func cashTransfer() {

                

                print("\n🔹 Iniciando pago en efectivo (efecty)...")

                

                let newCashTransactionModel = NewCashTransactionModel(

                    

                    invoice: "PrueabsQA",

                    

                    description: "pay Test",

                    

                    value: "20000",

                    

                    tax: "0",

                    

                    taxBase: "0",

                    

                    currency: "COP",

                    

                    personType: "0",

                    

                    docType: "CC",

                    

                    docNumber: "123234467",

                    

                    name: "testing",

                    

                    lastName: "PAYCO",

                    

                    email: "test@mailinator.com",

                    

                    cellPhone: "3010000001",

                    

                    country: "CO",

                    

                    city: "Medellin",

                    

                    endDate: "26-10-03",

                    

                    ip: "186.97.212.162",

                    

                    responseUrl: "https://ejemplo.com/respuesta.html",

                    

                    confirmationUrl: "https://ejemplo.com/confirmacion",

                    

                    confirmationMethod: "GET",

                    

                    extras_epayco: ExtrasModel()

                    

                )

                

                

                

                let cashTransaction = epayco.cash.create(paymentMethod: "efecty", newCashTransactionData: newCashTransactionModel)

                

                switch cashTransaction {

                case .success(let transaction):

                    print("✅ Pago en efectivo creado exitosamente")

                    print("Ref: \(transaction.data.ref_payco )")

                case .failure(let error):

                    print("❌ Error creando pago en efectivo: \(error.message)")

                }

                

                

                

            }

        }}

    

    

    #Preview {

        

        ContentView()

        

    }