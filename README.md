# ePayco SDK IOS

epayco-ios dispone de este SDK con el fin que se pueda manejar la información sensible de las transacciones sin necesidad de almacenar esta data en su servidor. Estos métodos pueden ser usados para generar data en su aplicación. 

## Instalación 

Se emplea Swift Package Manager
In Xcode, select File > Swift Packages > Add Package Dependency.

## Uso

### Creación de token

```
 let epayco = Epayco(publicKey: "XXXXXXXXXX", privateKey: "XXXXXXXX", lang: "ES", test: false)
 let newTokenCard = CardTokenModel(number: "4222222222222225", exp_year: "2030", exp_month: "06", cvc: "021")
 let newTokenData = NewTokenModel(card: newTokenCard)
 let newToken = epayco.token.create(newTokenData: newTokenData)
 let isTokenValid = newToken != nil 
```

### Eliminar token

```
 let epayco = Epayco(publicKey: "XXXXXXXXXX", privateKey: "XXXXXXXX", lang: "ES", test: false)
 let removeTokenResult = epayco.token.remove(customerId: "kXyobRkeyBkJPTd57", franchise: "visa", mask: "422222******2225")
 let isTokenRemoved = removeTokenResult != nil
```

### Crear cliente

```
 let epayco = Epayco(publicKey: "XXXXXXXXXX", privateKey: "XXXXXXXX", lang: "ES", test: false)
 let newCustomerData = NewCustomerModel(token_card:"079d69316b", name: "hello", last_name: "world", email: "prueba@correo.co", isDefault: false, city: "Miami", address: "Av...", phone: "555555", cell_phone: "55555")
 let newCustomer = epayco.customer.create(newCustomerData: newCustomerData)
 let isCustomerValid = newCustomer != nil
```

### Retrieve

```
 let epayco = Epayco(publicKey: "XXXXXXXXXX", privateKey: "XXXXXXXX", lang: "ES", test: false)
 let foundCustomer = epayco.customer.get(customerId: "kXyobRkeyBkJPTd57")
 let isCustomerValid = foundCustomer != nil
```

### List

```
let epayco = Epayco(publicKey: "XXXXXXXXXX", privateKey: "XXXXXXXX", lang: "ES", test: false)
let foundCustomers = epayco.customer.getList()
let isCustomersListValid = foundCustomers != nil
```

### Update

```
let epayco = Epayco(publicKey: "XXXXXXXXXX", privateKey: "XXXXXXXX", lang: "ES", test: false)
let updatedCustomer = epayco.customer.update(customerId: "kXyobRkeyBkJPTd57", newName: "Hugo")
let isCustomerUpdateValid = updatedCustomer != nil
```

## Planes

### Create

```
let epayco = Epayco(publicKey: "XXXXXXXXXX", privateKey: "XXXXXXXX", lang: "ES", test: false)
 let newPlanData = NewPlanModel(id_plan: "hello", name: "Hello", description: "Hello", amount: 5000.50, currency: "COP", interval: "week", interval_count: 3, trial_days: 0)
 let newPlan = epayco.plan.create(newPlanData: newPlanData)
 let isPlanValid = newPlan != nil
```

### Retrieve

```
let epayco = Epayco(publicKey: "XXXXXXXXXX", privateKey: "XXXXXXXX", lang: "ES", test: false)
let foundPlan = epayco.plan.get(planId: "hello-world")
let isPlanValid = foundPlan != nil
```

### List


```
let epayco = Epayco(publicKey: "XXXXXXXXXX", privateKey: "XXXXXXXX", lang: "ES", test: false)
let foundPlans = epayco.plan.getList()
let isPlansListValid = foundPlans != nil
```

### Delete

```
let epayco = Epayco(publicKey: "XXXXXXXXXX", privateKey: "XXXXXXXX", lang: "ES", test: false)
let foundPlans = epayco.plan.getList()
let isPlansListValid = foundPlans != nillet planRemoval = epayco.plan.remove(planId: "hello-world")
let isPlansRemoved = planRemoval != nil
```

## Suscripciones

### Create

```
let epayco = Epayco(publicKey: "XXXXXXXXXX", privateKey: "XXXXXXXX", lang: "ES", test: false)
let newSubscriptionData = NewSubscriptionModel(id_plan: "hello", customer: "kXyobRkeyBkJPTd57", token_card: "078e181c073f", doc_type: "CC", doc_number: "55555", url_confirmation: "", method_confirmation: "")
let newSubscription = epayco.subscription.create(newSubscriptionData: newSubscriptionData)
let isSubscriptionValid = newSubscription != nil
```

### Retrieve


```
let epayco = Epayco(publicKey: "XXXXXXXXXX", privateKey: "XXXXXXXX", lang: "ES", test: false)
let foundSubscription = epayco.subscription.get(subscriptionId: "079c3101f4d672b3a161132")
let isSubscriptionValid = foundSubscription != nil
```

### List

```
let epayco = Epayco(publicKey: "XXXXXXXXXX", privateKey: "XXXXXXXX", lang: "ES", test: false)
let foundSubscriptions = epayco.subscription.getList()
let isSubscriptionsListValid = foundSubscriptions != nil
```

### Cancel

```
let epayco = Epayco(publicKey: "XXXXXXXXXX", privateKey: "XXXXXXXX", lang: "ES", test: false)
let cancelledSubscription = epayco.subscription.cancel(subscriptionId: "079c3101f4d672b3a1611323")
let isSubscriptionCancelled = cancelledSubscription != nil
```

### Pagar suscripción

```
let epayco = Epayco(publicKey: "XXXXXXXXXX", privateKey: "XXXXXXXX", lang: "ES", test: false)
let chargeData = SubscriptionChargeModel(id_plan: "hello-world", customer: "kXyobRkeyBkJPTd57", token_card: "079d69316b80741cc515af3", doc_type: "CC", doc_number: "55555", ip: "10.0.0.1", address: "Av...", phone: "55555555555", cell_phone: "5555555555")
let subscriptionCharge = epayco.subscription.charge(subscriptionChargeData: chargeData)
let isSubscriptionCharged = subscriptionCharge != nil
```

## CASH

### Create

```
let epayco = Epayco(publicKey: "XXXXXXXXXX", privateKey: "XXXXXXXX", lang: "ES", test: false)
let newCashTransactionData = NewCashTransactionModel(invoice: "hello", description: "hello", value: "20040", tax: "0", taxBase: "0", currency: "COP", personType: "1", docType: "CC", docNumber: "55555", name: "hello", lastName: "world", email: "roberto.meran@payco.co", cellPhone: "555555555555", endDate: "2022-05-02", ip: "10.0.0.1", responseUrl: "", confirmationUrl: "", confirmationMethod: "POST")
let newCashTransaction = epayco.cash.create(paymentMethod: "efecty", newCashTransactionData: newCashTransactionData)
let isTransactionValid = newCashTransaction != nil
```

### SPLIT

```
let epayco = Epayco(publicKey: "XXXXXXXXXX", privateKey: "XXXXXXXX", lang: "ES", test: false)
let newCashTransactionData = NewCashTransactionModel(invoice: "hello", description: "hello", value: "24000", tax: "0", taxBase: "0", currency: "COP", personType: "1", docType: "CC", docNumber: "55555", name: "hello", lastName: "world", email: "roberto.meran@payco.co", cellPhone: "555555555555", endDate: "2022-05-02", ip: "10.0.0.1", responseUrl: "", confirmationUrl: "", confirmationMethod: "POST") 
let splitReceiver1 = SplitReceiverModel(id: "30085", fee: "10", fee_type: "01", total: "12000") let splitReceiver2 = SplitReceiverModel(id: "30085", fee: "10", fee_type: "01", total: "12000") 
let splitData = SplitDataModel(splitpayment: "true", split_app_id: "30085", split_merchant_id: "30085", split_type: "02", split_rule: "multiple", split_primary_receiver: "30085", split_primary_receiver_fee: "10", split_receivers: [splitReceiver1, splitReceiver2]) 
let newCashTransaction = epayco.cash.create(paymentMethod: "sured", newCashTransactionData: newCashTransactionData, splitData: splitData) let isTransactionValid = newCashTransaction != nil
```
### Retrieve

```
let epayco = Epayco(publicKey: "XXXXXXXXXX", privateKey: "XXXXXXXX", lang: "ES", test: false)
let foundTransaction = epayco.cash.getTransaction(refPayco: "462046312") 
let isTransactionValid = foundTransaction != nil
```

### Payment

```
let epayco = Epayco(publicKey: "XXXXXXXXXX", privateKey: "XXXXXXXX", lang: "ES", test: false)
let newChargeTransactionData = NewChargeTransactionModel(token_card: "079d69316b80741cc515af3", customer_id: "kXyobRkeyBkJPTd57", doc_type: "CC", doc_number: "55555", name: "Hello", last_name: "World", email: "roberto.meran@payco.co", bill: "hello-world4", description: "Hello World", value: "5040.5", tax: "0", tax_base: "0", currency: "COP", dues: "1", address: "Av...", phone: "55555555555", cell_phone: "55555555555", url_response: "", url_confirmation: "", ip: "10.0.0.1", extras: nil)
let newTransaction = epayco.charge.create(newChargeTransactionData: newChargeTransactionData)
let isTransactionValid = newTransaction != nil
```

## Bank

### Create

```
let epayco = Epayco(publicKey: "XXXXXXXXXX", privateKey: "XXXXXXXX", lang: "ES", test: false)
let newBankTransactionData = NewBankTransactionModel(bank: "1059", invoice: "hello-world", description: "Hello World", value: "20000", tax: "0", taxBase: "0", currency: "COP", personType: "0", docType: "CC", docNumber: "55555", name: "name", lastName: "last name", email: "roberto.meran@payco.co", country: "CO", cellPhone: "5555555555", responseUrl: "", confirmationUrl: "", confirmationMethod: "GET", ip: "10.0.0.1", extra1: "", extra2: "", extra3: "", extra4: "", extra5: "", extra6: "", extra7: "")
let createdTransaction = epayco.bank.create(newBankTransactionData: newBankTransactionData)
let isTransactionValid = createdTransaction != nil
```

### Retrieve

```
let epayco = Epayco(publicKey: "XXXXXXXXXX", privateKey: "XXXXXXXX", lang: "ES", test: false)
let foundTransaction = epayco.bank.getTransaction(transactionId: "4877161869798094")
let isTransactionValid = foundTransaction != nil

```

### SPLIT

```
let epayco = Epayco(publicKey: "XXXXXXXXXX", privateKey: "XXXXXXXX", lang: "ES", test: false)
let newBankTransactionData = NewBankTransactionModel(bank: "1059", invoice: "hello-world2", description: "Hello World", value: "20000", tax: "0", taxBase: "0", currency: "COP", personType: "0", docType: "CC", docNumber: "55555", name: "name", lastName: "last name", email: "roberto.meran@payco.co", country: "CO", cellPhone: "5555555555", responseUrl: "", confirmationUrl: "", confirmationMethod: "GET", ip: "10.0.0.1", extra1: "", extra2: "", extra3: "", extra4: "", extra5: "", extra6: "", extra7: "") 
let splitReceiver1 = SplitReceiverModel(id: "30085", fee: "10", fee_type: "01", total: "10000") 
let splitReceiver2 = SplitReceiverModel(id: "30085", fee: "10", fee_type: "01", total: "10000") 
let splitData = SplitDataModel(splitpayment: "true", split_app_id: "30085", split_merchant_id: "30085", split_type: "02", split_rule: "multiple", split_primary_receiver: "30085", split_primary_receiver_fee: "10", split_receivers: [splitReceiver1, splitReceiver2]) 
let newTransaction = epayco.bank.create(newBankTransactionData: newBankTransactionData, splitData: splitData) let isTransactionValid = newTransaction != nil

```

### Lista de bancos disponibles


```
let epayco = Epayco(publicKey: "XXXXXXXXXX", privateKey: "XXXXXXXX", lang: "ES", test: false)
let foundBanks = epayco.bank.getBanksList()
let isBanksListValid = foundBanks != nil
```


