import Foundation

/// EJEMPLO DE USO - Cómo usar el nuevo sistema de manejo de errores
/// Este archivo muestra cómo trabajar con Result en lugar de optionals

public struct ChargeExampleUsage {
    
    /// Ejemplo 1: Crear transacción con manejo de errores mejorado
    static func createChargeExample() {
        let epayco = Epayco(
            publicKey: "tu_public_key",
            privateKey: "tu_private_key",
            lang: "ES",
            test: true
        )
        
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
            print("✅ TRANSACCIÓN EXITOSA")
            print("═══════════════════════════════════════════════════")
            let transactionData = transaction.data
            print("🏷️  Referencia: \(transactionData.ref_payco ?? 0)")
            print("💰 Monto: \(transactionData.valor ?? \"\")")
            print("📝 Autorización: \(transactionData.autorizacion ?? \"\")")
            print("📋 Recibo: \(transactionData.recibo ?? \"\")")
            print("📅 Fecha: \(transactionData.fecha ?? \"\")")
            print("✔️  Estado: \(transactionData.estado ?? \"\")")
            print("═══════════════════════════════════════════════════")
            
        case .failure(let error):
            print("❌ ERROR EN LA TRANSACCIÓN")
            print("═══════════════════════════════════════════════════")
            print("📌 Código HTTP: \(error.status_code)")
            print("💬 Mensaje: \(error.message)")
            
            // Manejo diferenciado de errores
            handleChargeError(error)
            print("═══════════════════════════════════════════════════")
        }
    }
    
    /// Ejemplo 2: Crear transacción con split de pagos
    static func createChargeWithSplitExample() {
        let epayco = Epayco(
            publicKey: "tu_public_key",
            privateKey: "tu_private_key",
            lang: "ES",
            test: true
        )
        
        let chargeData = NewChargeTransactionModel(
            token_card: "070d69316b",
            customer_id: "5f8a4x",
            doc_type: "CC",
            doc_number: "12345678",
            name: "Juan",
            last_name: "Pérez",
            email: "juan@example.com",
            bill: "FACTURA001",
            description: "Compra con split",
            value: "100000",
            tax: "0",
            tax_base: "100000",
            currency: "COP",
            dues: "1",
            address: "Calle 123",
            phone: "3001234567",
            cell_phone: "3001234567",
            url_response: "https://tuapp.com/response",
            url_confirmation: "https://tuapp.com/confirm",
            ip: "192.168.1.1"
        )
        
        let splitData = SplitDataModel(
            ip: "192.168.1.1",
            splitpayment: "1",
            split_app_id: "app123",
            split_merchant_id: "merchant123",
            split_type: "percentage",
            split_rule: "01",
            split_primary_receiver: "receiver123",
            split_primary_receiver_fee: "10000",
            split_receivers: []
        )
        
        let result = epayco.charge.create(newChargeTransactionData: chargeData, splitData: splitData)
        
        switch result {
        case .success(let transaction):
            print("✅ SPLIT DE PAGO CREADO EXITOSAMENTE")
            let transactionData = transaction.data
            print("🏷️  Ref: \(transactionData.ref_payco ?? 0)")
            
        case .failure(let error):
            print("❌ Error en split: \(error.message)")
        }
    }
    
    /// Ejemplo 3: Obtener transacción creada
    static func getTransactionExample() {
        let epayco = Epayco(
            publicKey: "tu_public_key",
            privateKey: "tu_private_key",
            lang: "ES",
            test: true
        )
        
        let result = epayco.charge.getTransaction(refPayco: "123456789")
        
        switch result {
        case .success(let transaction):
            print("✅ TRANSACCIÓN ENCONTRADA")
            if let transactionData = transaction.data {
                print("Estado: \(transactionData.estado ?? "")")
            } else {
                print("⚠️  No hay datos de transacción disponibles")
            }
            
        case .failure(let error):
            print("❌ Error: \(error.message)")
            print("Código: \(error.status_code)")
        }
    }
    
    /// Manejo diferenciado de errores según tipo
    private static func handleChargeError(_ error: ErrorResponse) {
        switch error.status_code {
        case 400:
            print("⚠️  Error 400: Solicitud inválida")
            print("   → Revisa los datos enviados")
            if let data = error.data {
                print("   → Detalles: \(data)")
            }
            
        case 401:
            print("🔒 Error 401: No autorizado")
            print("   → Revisa tus credenciales (publicKey, privateKey)")
            
        case 404:
            print("🔍 Error 404: Recurso no encontrado")
            print("   → La ruta no existe")
            
        case 500...599:
            print("🖥️  Error del servidor (\(error.status_code))")
            print("   → Intenta más tarde")
            print("   → Si persiste, contacta a soporte")
            
        default:
            print("❓ Error desconocido: \(error.status_code)")
        }
        
        // Acceso a datos adicionales del error si existen
        if let errorData = error.data {
            print("📊 Información adicional del error:")
            if let dict = errorData as? [String: Any] {
                for (key, value) in dict {
                    print("   • \(key): \(value)")
                }
            }
        }
    }
}

// ============================================================================
// COMPARACIÓN: ANTES vs DESPUÉS
// ============================================================================

/*
 ANTES (Problema):
 ═══════════════════════════════════════════════════════════════════════════
 
 let result = epayco.charge.create(newChargeTransactionData: chargeData)
 
 if let transaction = result {
     print("✅ Éxito")
 } else {
     print("❌ Error (sin saber qué salió mal)")  // ◄─── NO SÉ QUÉ PASÓ
 }
 
 Problemas:
 • No tienes información sobre qué salió mal
 • No distingues entre error de red, error de pago, error de validación
 • No puedes acceder a mensajes específicos del API
 • No sabes si es un error reintentable
 
 ═══════════════════════════════════════════════════════════════════════════
 
 DESPUÉS (Solución):
 ═══════════════════════════════════════════════════════════════════════════
 
 let result = epayco.charge.create(newChargeTransactionData: chargeData)
 
 switch result {
 case .success(let transaction):
     // Transacción exitosa
     print("✅ Éxito: \(transaction.data?.ref_payco ?? 0)")
     
 case .failure(let error):
     // Tienes acceso a:
     // • error.message → Mensaje descriptivo
     // • error.status_code → Código HTTP
     // • error.data → Datos adicionales del error
     print("❌ Error [\(error.status_code)]: \(error.message)")
 }
 
 Ventajas:
 • ✅ Mensaje descriptivo para cada error
 • ✅ Distingue entre tipos de error (400, 401, 500, etc.)
 • ✅ Acceso a detalles del error desde el API
 • ✅ Mejor manejo en UI/UX
 • ✅ Logs más informativos
 
 ═══════════════════════════════════════════════════════════════════════════
*/
