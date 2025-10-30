import XCTest
@testable import epayco_ios

final class epayco_iosTests: XCTestCase {
    func testTokenCreate() {
        let epayco = Epayco(publicKey: "e9b27acbda580c12015f592f18bcfd83", privateKey: "485bc4081152799c4f122831574a321f", lang: "ES", test: false)
        let newTokenCard = CardTokenModel(number: "4222222222222225", exp_year: "2030", exp_month: "06", cvc: "021")
        let newTokenData = NewTokenModel(card: newTokenCard)
        let newToken = epayco.token.create(newTokenData: newTokenData)
        let isTokenValid = newToken != nil
        
        XCTAssertTrue(isTokenValid)
    }
    
    func testTokenRemove() {
        let epayco = Epayco(publicKey: "e9b27acbda580c12015f592f18bcfd83", privateKey: "485bc4081152799c4f122831574a321f", lang: "ES", test: false)
        let removeTokenResult = epayco.token.remove(customerId: "kXyobRkeyBkJPTd57", franchise: "visa", mask: "422222******2225")
        let isTokenRemoved = removeTokenResult != nil
        
        XCTAssertTrue(isTokenRemoved)
    }
    
    func testCustomerCreate() {
        let epayco = Epayco(publicKey: "e9b27acbda580c12015f592f18bcfd83", privateKey: "485bc4081152799c4f122831574a321f", lang: "ES", test: false)
        let newCustomerData = NewCustomerModel(token_card:"079d69316b80741cc515af3", name: "hello", last_name: "world", email: "roberto.meran@payco.co", isDefault: false, city: "Miami", address: "Av...", phone: "5555555555", cell_phone: "555555555")
        let newCustomer = epayco.customer.create(newCustomerData: newCustomerData)
        let isCustomerValid = newCustomer != nil
        
        XCTAssertTrue(isCustomerValid)
    }
    
    func testCustomerGet() {
        let epayco = Epayco(publicKey: "e9b27acbda580c12015f592f18bcfd83", privateKey: "485bc4081152799c4f122831574a321f", lang: "ES", test: false)
        let foundCustomer = epayco.customer.get(customerId: "kXyobRkeyBkJPTd57")
        let isCustomerValid = foundCustomer != nil
        
        XCTAssertTrue(isCustomerValid)
    }
    
    func testCustomerGetList() {
        let epayco = Epayco(publicKey: "e9b27acbda580c12015f592f18bcfd83", privateKey: "485bc4081152799c4f122831574a321f", lang: "ES", test: false)
        let foundCustomers = epayco.customer.getList()
        let isCustomersListValid = foundCustomers != nil

        XCTAssertTrue(isCustomersListValid)
    }
    
    func testCustomerUpdate() {
        let epayco = Epayco(publicKey: "e9b27acbda580c12015f592f18bcfd83", privateKey: "485bc4081152799c4f122831574a321f", lang: "ES", test: false)
        let updatedCustomer = epayco.customer.update(customerId: "kXyobRkeyBkJPTd57", newName: "Hugo")
        let isCustomerUpdateValid = updatedCustomer != nil

        XCTAssertTrue(isCustomerUpdateValid)
    }

    func testPlanCreate() {
        let epayco = Epayco(publicKey: "e9b27acbda580c12015f592f18bcfd83", privateKey: "485bc4081152799c4f122831574a321f", lang: "ES", test: false)
        let newPlanData = NewPlanModel(id_plan: "hello-world", name: "Hello World", description: "Hello", amount: 5000.50, currency: "COP", interval: "week", interval_count: 3, trial_days: 0)
        let newPlan = epayco.plan.create(newPlanData: newPlanData)
        let isPlanValid = newPlan != nil

        XCTAssertTrue(isPlanValid)
    }
    
    func testPlanGet() {
        let epayco = Epayco(publicKey: "e9b27acbda580c12015f592f18bcfd83", privateKey: "485bc4081152799c4f122831574a321f", lang: "ES", test: false)
        let foundPlan = epayco.plan.get(planId: "hello-world")
        let isPlanValid = foundPlan != nil

        XCTAssertTrue(isPlanValid)
    }
    
    func testPlanGetList() {
        let epayco = Epayco(publicKey: "e9b27acbda580c12015f592f18bcfd83", privateKey: "485bc4081152799c4f122831574a321f", lang: "ES", test: false)
        let foundPlans = epayco.plan.getList()
        let isPlansListValid = foundPlans != nil

        XCTAssertTrue(isPlansListValid)
    }
    
    func testPlanRemove() {
        let epayco = Epayco(publicKey: "e9b27acbda580c12015f592f18bcfd83", privateKey: "485bc4081152799c4f122831574a321f", lang: "ES", test: false)
        let planRemoval = epayco.plan.remove(planId: "hello-world")
        let isPlansRemoved = planRemoval != nil

        XCTAssertTrue(isPlansRemoved)
    }
    
    func testSubscriptionCreate() {
        let epayco = Epayco(publicKey: "e9b27acbda580c12015f592f18bcfd83", privateKey: "485bc4081152799c4f122831574a321f", lang: "ES", test: false)
        let newSubscriptionData = NewSubscriptionModel(id_plan: "hello-world", customer: "kXyobRkeyBkJPTd57", token_card: "078e181c08ce23e3561e73f", doc_type: "CC", doc_number: "55555", url_confirmation: "", method_confirmation: "")
        let newSubscription = epayco.subscription.create(newSubscriptionData: newSubscriptionData)
        let isSubscriptionValid = newSubscription != nil

        XCTAssertTrue(isSubscriptionValid)
    }
    
    func testSubscriptionGet() {
        let epayco = Epayco(publicKey: "e9b27acbda580c12015f592f18bcfd83", privateKey: "485bc4081152799c4f122831574a321f", lang: "ES", test: false)
        let foundSubscription = epayco.subscription.get(subscriptionId: "079c3101f4d672b3a161132")
        let isSubscriptionValid = foundSubscription != nil

        XCTAssertTrue(isSubscriptionValid)
    }
    
    func testSubscriptionGetList() {
        let epayco = Epayco(publicKey: "e9b27acbda580c12015f592f18bcfd83", privateKey: "485bc4081152799c4f122831574a321f", lang: "ES", test: false)
        let foundSubscriptions = epayco.subscription.getList()
        let isSubscriptionsListValid = foundSubscriptions != nil

        XCTAssertTrue(isSubscriptionsListValid)
    }
    
    func testSubscriptionCancel() {
        let epayco = Epayco(publicKey: "e9b27acbda580c12015f592f18bcfd83", privateKey: "485bc4081152799c4f122831574a321f", lang: "ES", test: false)
        let cancelledSubscription = epayco.subscription.cancel(subscriptionId: "079c3101f4d672b3a1611323")
        let isSubscriptionCancelled = cancelledSubscription != nil

        XCTAssertTrue(isSubscriptionCancelled)
    }
    
    func testSubscriptionCharge() {
        let epayco = Epayco(publicKey: "e9b27acbda580c12015f592f18bcfd83", privateKey: "485bc4081152799c4f122831574a321f", lang: "ES", test: false)
        let chargeData = SubscriptionChargeModel(id_plan: "hello-world", customer: "kXyobRkeyBkJPTd57", token_card: "079d69316b80741cc515af3", doc_type: "CC", doc_number: "55555", ip: "10.0.0.1", address: "Av...", phone: "55555555555", cell_phone: "5555555555")
        let subscriptionCharge = epayco.subscription.charge(subscriptionChargeData: chargeData)
        let isSubscriptionCharged = subscriptionCharge != nil

        XCTAssertTrue(isSubscriptionCharged)
    }
    
    func testCashCreate() {
        let epayco = Epayco(publicKey: "e9b27acbda580c12015f592f18bcfd83", privateKey: "485bc4081152799c4f122831574a321f", lang: "ES", test: false)
        let newCashTransactionData = NewCashTransactionModel(invoice: "hello", description: "hello", value: "20040", tax: "0", taxBase: "0", currency: "COP", personType: "1", docType: "CC", docNumber: "55555", name: "hello", lastName: "world", email: "roberto.meran@payco.co", cellPhone: "555555555555", endDate: "2022-05-02", ip: "10.0.0.1", responseUrl: "", confirmationUrl: "", confirmationMethod: "POST")
        let newCashTransaction = epayco.cash.create(paymentMethod: "efecty", newCashTransactionData: newCashTransactionData)
        let isTransactionValid = newCashTransaction != nil

        XCTAssertTrue(isTransactionValid)
    }
    
    func testCashSplitCreate() {
        let epayco = Epayco(publicKey: "e9b27acbda580c12015f592f18bcfd83", privateKey: "485bc4081152799c4f122831574a321f", lang: "ES", test: false)
        let newCashTransactionData = NewCashTransactionModel(invoice: "hello", description: "hello", value: "24000", tax: "0", taxBase: "0", currency: "COP", personType: "1", docType: "CC", docNumber: "55555", name: "hello", lastName: "world", email: "roberto.meran@payco.co", cellPhone: "555555555555", endDate: "2022-05-02", ip: "10.0.0.1", responseUrl: "", confirmationUrl: "", confirmationMethod: "POST")
        let splitReceiver1 = SplitReceiverModel(id: "30085", fee: "10", fee_type: "01", total: "12000")
        let splitReceiver2 = SplitReceiverModel(id: "30085", fee: "10", fee_type: "01", total: "12000")
        let splitData = SplitDataModel(splitpayment: "true", split_app_id: "30085", split_merchant_id: "30085", split_type: "02", split_rule: "multiple", split_primary_receiver: "30085", split_primary_receiver_fee: "10", split_receivers: [splitReceiver1, splitReceiver2])
        let newCashTransaction = epayco.cash.create(paymentMethod: "sured", newCashTransactionData: newCashTransactionData, splitData: splitData)
        let isTransactionValid = newCashTransaction != nil

        XCTAssertTrue(isTransactionValid)
    }
    
    func testCashGetTransaction() {
        let epayco = Epayco(publicKey: "e9b27acbda580c12015f592f18bcfd83", privateKey: "485bc4081152799c4f122831574a321f", lang: "ES", test: false)
        let foundTransaction = epayco.cash.getTransaction(refPayco: "462046312")
        let isTransactionValid = foundTransaction != nil

        XCTAssertTrue(isTransactionValid)
    }
    
    func testChargeCreate() {
        let epayco = Epayco(publicKey: "e9b27acbda580c12015f592f18bcfd83", privateKey: "485bc4081152799c4f122831574a321f", lang: "ES", test: false)
        let newChargeTransactionData = NewChargeTransactionModel(token_card: "079d69316b80741cc515af3", customer_id: "kXyobRkeyBkJPTd57", doc_type: "CC", doc_number: "55555", name: "Hello", last_name: "World", email: "roberto.meran@payco.co", bill: "hello-world4", description: "Hello World", value: "5040.5", tax: "0", tax_base: "0", currency: "COP", dues: "1", address: "Av...", phone: "55555555555", cell_phone: "55555555555", url_response: "", url_confirmation: "", ip: "10.0.0.1", extras: nil)
        let newTransaction = epayco.charge.create(newChargeTransactionData: newChargeTransactionData)
        let isTransactionValid = newTransaction != nil

        XCTAssertTrue(isTransactionValid)
    }
    
    func testChargeSplitCreate() {
        let epayco = Epayco(publicKey: "e9b27acbda580c12015f592f18bcfd83", privateKey: "485bc4081152799c4f122831574a321f", lang: "ES", test: false)
        let newChargeTransactionData = NewChargeTransactionModel(token_card: "079d69316b80741cc515af3", customer_id: "kXyobRkeyBkJPTd57", doc_type: "CC", doc_number: "55555", name: "Hello", last_name: "World", email: "roberto.meran@payco.co", bill: "hello-world2", description: "Hello World", value: "10000", tax: "0", tax_base: "0", currency: "COP", dues: "1", address: "Av...", phone: "55555555555", cell_phone: "55555555555", url_response: "", url_confirmation: "", ip: "10.0.0.1", extras: nil)
        let splitReceiver1 = SplitReceiverModel(id: "30085", fee: "10", fee_type: "01", total: "5000")
        let splitReceiver2 = SplitReceiverModel(id: "30085", fee: "10", fee_type: "01", total: "5000")
        let splitData = SplitDataModel(splitpayment: "true", split_app_id: "30085", split_merchant_id: "30085", split_type: "02", split_rule: "multiple", split_primary_receiver: "30085", split_primary_receiver_fee: "10", split_receivers: [splitReceiver1, splitReceiver2])
        let newTransaction = epayco.charge.create(newChargeTransactionData: newChargeTransactionData, splitData: splitData)
        let isTransactionValid = newTransaction != nil

        XCTAssertTrue(isTransactionValid)
    }
    
    func testChargeGetTransaction() {
        let epayco = Epayco(publicKey: "e9b27acbda580c12015f592f18bcfd83", privateKey: "485bc4081152799c4f122831574a321f", lang: "ES", test: false)
        let foundTransaction = epayco.charge.getTransaction(refPayco: "46268709")
        let isTransactionValid = foundTransaction != nil

        XCTAssertTrue(isTransactionValid)
    }
    
    func testBankCreate() {
        let epayco = Epayco(publicKey: "e9b27acbda580c12015f592f18bcfd83", privateKey: "485bc4081152799c4f122831574a321f", lang: "ES", test: false)
        let newBankTransactionData = NewBankTransactionModel(bank: "1059", invoice: "hello-world", description: "Hello World", value: "20000", tax: "0", taxBase: "0", currency: "COP", personType: "0", docType: "CC", docNumber: "55555", name: "name", lastName: "last name", email: "roberto.meran@payco.co", country: "CO", cellPhone: "5555555555", responseUrl: "", confirmationUrl: "", confirmationMethod: "GET", ip: "10.0.0.1", extra1: "", extra2: "", extra3: "", extra4: "", extra5: "", extra6: "", extra7: "")
        let createdTransaction = epayco.bank.create(newBankTransactionData: newBankTransactionData)
        let isTransactionValid = createdTransaction != nil

        XCTAssertTrue(isTransactionValid)
    }
    
    func testBankGetTransaction() {
        let epayco = Epayco(publicKey: "e9b27acbda580c12015f592f18bcfd83", privateKey: "485bc4081152799c4f122831574a321f", lang: "ES", test: false)
        let foundTransaction = epayco.bank.getTransaction(transactionId: "4877161869798094")
        let isTransactionValid = foundTransaction != nil

        XCTAssertTrue(isTransactionValid)
    }
    
    func testBankSplitCreate() {
        let epayco = Epayco(publicKey: "e9b27acbda580c12015f592f18bcfd83", privateKey: "485bc4081152799c4f122831574a321f", lang: "ES", test: false)
        let newBankTransactionData = NewBankTransactionModel(bank: "1059", invoice: "hello-world2", description: "Hello World", value: "20000", tax: "0", taxBase: "0", currency: "COP", personType: "0", docType: "CC", docNumber: "55555", name: "name", lastName: "last name", email: "roberto.meran@payco.co", country: "CO", cellPhone: "5555555555", responseUrl: "", confirmationUrl: "", confirmationMethod: "GET", ip: "10.0.0.1", extra1: "", extra2: "", extra3: "", extra4: "", extra5: "", extra6: "", extra7: "")
        let splitReceiver1 = SplitReceiverModel(id: "30085", fee: "10", fee_type: "01", total: "10000")
        let splitReceiver2 = SplitReceiverModel(id: "30085", fee: "10", fee_type: "01", total: "10000")
        let splitData = SplitDataModel(splitpayment: "true", split_app_id: "30085", split_merchant_id: "30085", split_type: "02", split_rule: "multiple", split_primary_receiver: "30085", split_primary_receiver_fee: "10", split_receivers: [splitReceiver1, splitReceiver2])
        let newTransaction = epayco.bank.create(newBankTransactionData: newBankTransactionData, splitData: splitData)
        let isTransactionValid = newTransaction != nil

        XCTAssertTrue(isTransactionValid)
    }
    
    func testBankGetBanksList() {
        let epayco = Epayco(publicKey: "e9b27acbda580c12015f592f18bcfd83", privateKey: "485bc4081152799c4f122831574a321f", lang: "ES", test: false)
        let foundBanks = epayco.bank.getBanksList()
        let isBanksListValid = foundBanks != nil

        XCTAssertTrue(isBanksListValid)
    }
}
