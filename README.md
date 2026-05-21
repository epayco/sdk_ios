
# Epayco SDK IOS

Epayco-ios dispone de este SDK con el fin que se pueda manejar la información sensible de las transacciones sin necesidad de almacenar esta data en su servidor. Estos métodos pueden ser usados para generar data en su aplicación. 

## Instalación

Se emplea Swift Package Manager.  
En Xcode, selecciona `File > Swift Packages > Add Package Dependency`.

## ✨ Novedades - Sistema de Manejo de Errores Mejorado

El SDK ahora incluye un sistema robusto de manejo de errores similar al utilizado en PHP:

### Cambios Principales:
- ✅ **Error Mapping**: Mapeo automático de códigos HTTP a mensajes descriptivos
- ✅ **Información Detallada**: Acceso a mensajes de error del API y datos adicionales
- ✅ **Result Type**: Uso de `Result<Model, ErrorResponse>` en lugar de optionals
- ✅ **Mejor Debugging**: Logs mejorados con información completa

### Archivos Nuevos:
- `Models/ErrorResponseModel.swift` - Modelo unificado de errores
- `Utils/ErrorMapper.swift` - Mapeo de status codes y extracción de mensajes
- `Resources/ChargeExampleUsage.swift` - Ejemplos de uso actualizado

## Uso - Versión Mejorada

### Creación de transacción de pago (con manejo de errores)
```swift
let epayco = Epayco(publicKey: "XXXXXXXXXX", privateKey: "XXXXXXXX", lang: "ES", test: false)
let chargeData = NewChargeTransactionModel(
    token_card: "070d69316b",
    customer_id: "5f8a4x",
    doc_type: "CC",
    doc_number: "12345678",
    name: "Juan",
    last_name: "Pérez",
    email: "juan@example.com",
    bill: "FACTURA001",
    description: "Compra de producto",
    value: "50000",
    tax: "0",
    tax_base: "50000",
    currency: "COP",
    dues: "1",
    address: "Calle 123",
    phone: "3001234567",
    cell_phone: "3001234567",
    url_response: "https://tuapp.com/response",
    url_confirmation: "https://tuapp.com/confirm",
    ip: "192.168.1.1"
)

// ✅ NUEVA FORMA: Usar Result
let result = epayco.charge.create(newChargeTransactionData: chargeData)

switch result {
case .success(let transaction):
    print("✅ Transacción exitosa")
    print("Ref: \(transaction.data.ref_payco ?? 0)")
    print("Estado: \(transaction.data.estado ?? "")")
    print("Autorización: \(transaction.data.autorizacion ?? "")")
    
case .failure(let error):
    print("❌ Error: \(error.message)")
    print("Código HTTP: \(error.status_code)")
    if let data = error.data {
        print("Detalles: \(data)")
    }
}
```

### Crear token
```swift
let epayco = Epayco(publicKey: "XXXXXXXXXX", privateKey: "XXXXXXXX", lang: "ES", test: false)
let newTokenCard = CardTokenModel(number: "4222222222222225", exp_year: "2030", exp_month: "06", cvc: "021")
let newTokenData = NewTokenModel(card: newTokenCard)

let result = epayco.token.create(newTokenData: newTokenData)

switch result {
case .success(let token):
    print("✅ Token creado: \(token.id)")
case .failure(let error):
    print("❌ Error: \(error.message)")
}
```

### Eliminar token
```swift
let epayco = Epayco(publicKey: "XXXXXXXXXX", privateKey: "XXXXXXXX", lang: "ES", test: false)
let result = epayco.token.remove(customerId: "kXyobRkeyBkJPTd57", franchise: "visa", mask: "422222******2225")

switch result {
case .success(let removed):
    print("✅ Token eliminado")
case .failure(let error):
    print("❌ Error: \(error.message)")
}
```

### Crear cliente
```swift
let epayco = Epayco(publicKey: "XXXXXXXXXX", privateKey: "XXXXXXXX", lang: "ES", test: false)
let newCustomerData = NewCustomerModel(token_card:"079d69316b", name: "hello", last_name: "world", email: "prueba@correo.co", isDefault: false, city: "Miami", address: "Av...", phone: "555555", cell_phone: "55555")

let result = epayco.customer.create(newCustomerData: newCustomerData)

switch result {
case .success(let customer):
    print("✅ Cliente creado")
case .failure(let error):
    print("❌ Error: \(error.message)")
}
```

### Retrieve cliente
```swift
let epayco = Epayco(publicKey: "XXXXXXXXXX", privateKey: "XXXXXXXX", lang: "ES", test: false)
let result = epayco.customer.get(customerId: "kXyobRkeyBkJPTd57")

switch result {
case .success(let customer):
    print("✅ Cliente encontrado")
case .failure(let error):
    print("❌ Error: \(error.message)")
}
```

### Listar clientes
```swift
let epayco = Epayco(publicKey: "XXXXXXXXXX", privateKey: "XXXXXXXX", lang: "ES", test: false)
let result = epayco.customer.getList()

switch result {
case .success(let customers):
    print("✅ Clientes encontrados")
case .failure(let error):
    print("❌ Error: \(error.message)")
}
```

### Actualizar cliente
```swift
let epayco = Epayco(publicKey: "XXXXXXXXXX", privateKey: "XXXXXXXX", lang: "ES", test: false)
let result = epayco.customer.update(customerId: "kXyobRkeyBkJPTd57", newName: "Hugo")

switch result {
case .success(let customer):
    print("✅ Cliente actualizado")
case .failure(let error):
    print("❌ Error: \(error.message)")
}
```

## Planes

### Crear plan
```swift
let epayco = Epayco(publicKey: "XXXXXXXXXX", privateKey: "XXXXXXXX", lang: "ES", test: false)
let newPlanData = NewPlanModel(id_plan: "hello", name: "Hello", description: "Hello", amount: 5000.50, currency: "COP", interval: "week", interval_count: 3, trial_days: 0)

let result = epayco.plan.create(newPlanData: newPlanData)

switch result {
case .success(let plan):
    print("✅ Plan creado")
case .failure(let error):
    print("❌ Error: \(error.message)")
}
```

### Obtener plan
```swift
let epayco = Epayco(publicKey: "XXXXXXXXXX", privateKey: "XXXXXXXX", lang: "ES", test: false)
let result = epayco.plan.get(planId: "hello-world")

switch result {
case .success(let plan):
    print("✅ Plan encontrado")
case .failure(let error):
    print("❌ Error: \(error.message)")
}
```

### Listar planes
```swift
let epayco = Epayco(publicKey: "XXXXXXXXXX", privateKey: "XXXXXXXX", lang: "ES", test: false)
let result = epayco.plan.getList()

switch result {
case .success(let plans):
    print("✅ Planes encontrados")
case .failure(let error):
    print("❌ Error: \(error.message)")
}
```

### Eliminar plan
```swift
let epayco = Epayco(publicKey: "XXXXXXXXXX", privateKey: "XXXXXXXX", lang: "ES", test: false)
let result = epayco.plan.remove(planId: "hello-world")

switch result {
case .success(_):
    print("✅ Plan eliminado")
case .failure(let error):
    print("❌ Error: \(error.message)")
}
```

## Suscripciones

### Crear suscripción
```swift
let epayco = Epayco(publicKey: "XXXXXXXXXX", privateKey: "XXXXXXXX", lang: "ES", test: false)
let newSubscriptionData = NewSubscriptionModel(id_plan: "hello", customer: "kXyobRkeyBkJPTd57", token_card: "078e181c073f", doc_type: "CC", doc_number: "55555", url_confirmation: "", method_confirmation: "")

let result = epayco.subscription.create(newSubscriptionData: newSubscriptionData)

switch result {
case .success(let subscription):
    print("✅ Suscripción creada")
case .failure(let error):
    print("❌ Error: \(error.message)")
}
```

### Obtener suscripción
```swift
let epayco = Epayco(publicKey: "XXXXXXXXXX", privateKey: "XXXXXXXX", lang: "ES", test: false)
let foundSubscription = epayco.subscription.get(subscriptionId: "079c3101f4d672b3a161132")
let isSubscriptionValid = foundSubscription != nil
```

### Listar suscripciones
```swift
let epayco = Epayco(publicKey: "XXXXXXXXXX", privateKey: "XXXXXXXX", lang: "ES", test: false)
let foundSubscriptions = epayco.subscription.getList()
let isSubscriptionsListValid = foundSubscriptions != nil
```

### Cancelar suscripción
```swift
let epayco = Epayco(publicKey: "XXXXXXXXXX", privateKey: "XXXXXXXX", lang: "ES", test: false)
let cancelledSubscription = epayco.subscription.cancel(subscriptionId: "079c3101f4d672b3a1611323")
let isSubscriptionCancelled = cancelledSubscription != nil
```

### Pagar suscripción
```swift
let epayco = Epayco(publicKey: "XXXXXXXXXX", privateKey: "XXXXXXXX", lang: "ES", test: false)
let chargeData = SubscriptionChargeModel(id_plan: "hello-world", customer: "kXyobRkeyBkJPTd57", token_card: "079d69316b80741cc515af3", doc_type: "CC", doc_number: "55555", ip: "10.0.0.1", address: "Av...", phone: "55555555555", cell_phone: "5555555555")
let subscriptionCharge = epayco.subscription.charge(subscriptionChargeData: chargeData)
let isSubscriptionCharged = subscriptionCharge != nil
```
## CASH

### Create

```swift
let epayco = Epayco(publicKey: "XXXXXXXXXX", privateKey: "XXXXXXXX", lang: "ES", test: false)
let newCashTransactionData = NewCashTransactionModel(invoice: "hello", description: "hello", value: "20040", tax: "0", taxBase: "0", currency: "COP", personType: "1", docType: "CC", docNumber: "55555", name: "hello", lastName: "world", email: "roberto.meran@payco.co", cellPhone: "555555555555", endDate: "2022-05-02", ip: "10.0.0.1", responseUrl: "", confirmationUrl: "", confirmationMethod: "POST")
let newCashTransaction = epayco.cash.create(paymentMethod: "efecty", newCashTransactionData: newCashTransactionData)
let isTransactionValid = newCashTransaction != nil
```

### SPLIT

```swift
let epayco = Epayco(publicKey: "XXXXXXXXXX", privateKey: "XXXXXXXX", lang: "ES", test: false)
let newCashTransactionData = NewCashTransactionModel(invoice: "hello", description: "hello", value: "24000", tax: "0", taxBase: "0", currency: "COP", personType: "1", docType: "CC", docNumber: "55555", name: "hello", lastName: "world", email: "roberto.meran@payco.co", cellPhone: "555555555555", endDate: "2022-05-02", ip: "10.0.0.1", responseUrl: "", confirmationUrl: "", confirmationMethod: "POST")
let splitReceiver1 = SplitReceiverModel(id: "30085", fee: "10", fee_type: "01", total: "12000")
let splitReceiver2 = SplitReceiverModel(id: "30085", fee: "10", fee_type: "01", total: "12000")
let splitData = SplitDataModel(splitpayment: "true", split_app_id: "30085", split_merchant_id: "30085", split_type: "02", split_rule: "multiple", split_primary_receiver: "30085", split_primary_receiver_fee: "10", split_receivers: [splitReceiver1, splitReceiver2])
let newCashTransaction = epayco.cash.create(paymentMethod: "sured", newCashTransactionData: newCashTransactionData, splitData: splitData)
let isTransactionValid = newCashTransaction != nil
```

### Retrieve

```swift
let epayco = Epayco(publicKey: "XXXXXXXXXX", privateKey: "XXXXXXXX", lang: "ES", test: false)
let foundTransaction = epayco.cash.getTransaction(refPayco: "462046312")
let isTransactionValid = foundTransaction != nil
```

### Payment

```swift
let epayco = Epayco(publicKey: "XXXXXXXXXX", privateKey: "XXXXXXXX", lang: "ES", test: false)
let newChargeTransactionData = NewChargeTransactionModel(token_card: "079d69316b80741cc515af3", customer_id: "kXyobRkeyBkJPTd57", doc_type: "CC", doc_number: "55555", name: "Hello", last_name: "World", email: "roberto.meran@payco.co", bill: "hello-world4", description: "Hello World", value: "5040.5", tax: "0", tax_base: "0", currency: "COP", dues: "1", address: "Av...", phone: "55555555555", cell_phone: "55555555555", url_response: "", url_confirmation: "", ip: "10.0.0.1", extras: nil)
let newTransaction = epayco.charge.create(newChargeTransactionData: newChargeTransactionData)
let isTransactionValid = newTransaction != nil
```

## Bank

### Create

```swift
let epayco = Epayco(publicKey: "XXXXXXXXXX", privateKey: "XXXXXXXX", lang: "ES", test: false)
let newBankTransactionData = NewBankTransactionModel(bank: "1059", invoice: "hello-world", description: "Hello World", value: "20000", tax: "0", taxBase: "0", currency: "COP", personType: "0", docType: "CC", docNumber: "55555", name: "name", lastName: "last name", email: "roberto.meran@payco.co", country: "CO", cellPhone: "5555555555", responseUrl: "", confirmationUrl: "", confirmationMethod: "GET", ip: "10.0.0.1", extra1: "", extra2: "", extra3: "", extra4: "", extra5: "", extra6: "", extra7: "")
let createdTransaction = epayco.bank.create(newBankTransactionData: newBankTransactionData)
let isTransactionValid = createdTransaction != nil
```

### Retrieve

```swift
let epayco = Epayco(publicKey: "XXXXXXXXXX", privateKey: "XXXXXXXX", lang: "ES", test: false)
let foundTransaction = epayco.bank.getTransaction(transactionId: "4877161869798094")
let isTransactionValid = foundTransaction != nil
```

### SPLIT

```swift
let epayco = Epayco(publicKey: "XXXXXXXXXX", privateKey: "XXXXXXXX", lang: "ES", test: false)
let newBankTransactionData = NewBankTransactionModel(bank: "1059", invoice: "hello-world2", description: "Hello World", value: "20000", tax: "0", taxBase: "0", currency: "COP", personType: "0", docType: "CC", docNumber: "55555", name: "name", lastName: "last name", email: "roberto.meran@payco.co", country: "CO", cellPhone: "5555555555", responseUrl: "", confirmationUrl: "", confirmationMethod: "GET", ip: "10.0.0.1", extra1: "", extra2: "", extra3: "", extra4: "", extra5: "", extra6: "", extra7: "")
let splitReceiver1 = SplitReceiverModel(id: "30085", fee: "10", fee_type: "01", total: "10000")
let splitReceiver2 = SplitReceiverModel(id: "30085", fee: "10", fee_type: "01", total: "10000")
let splitData = SplitDataModel(splitpayment: "true", split_app_id: "30085", split_merchant_id: "30085", split_type: "02", split_rule: "multiple", split_primary_receiver: "30085", split_primary_receiver_fee: "10", split_receivers: [splitReceiver1, splitReceiver2])
let newTransaction = epayco.bank.create(newBankTransactionData: newBankTransactionData, splitData: splitData)
let isTransactionValid = newTransaction != nil
```

### Lista de bancos disponibles

```swift
let epayco = Epayco(publicKey: "XXXXXXXXXX", privateKey: "XXXXXXXX", lang: "ES", test: false)
let foundBanks = epayco.bank.getBanksList()
let isBanksListValid = foundBanks != nil
```

