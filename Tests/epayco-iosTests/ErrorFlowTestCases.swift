import Foundation

/// FLUJO COMPLETO DE PRUEBA - Demostración del sistema de manejo de errores
/// Este archivo simula diferentes escenarios de respuesta del API

// ============================================================================
// ESCENARIO 1: ✅ TRANSACCIÓN EXITOSA (HTTP 200)
// ============================================================================

/*
 API RESPONDE:
 HTTP 200 OK
 {
   "status": true,
   "data": {
     "ref_payco": 123456789,
     "estado": "Aceptada",
     "autorizacion": "AUTH123ABC",
     "recibo": "REC-2024-001",
     "valor": "50000",
     "moneda": "COP",
     "respuesta": "Aprobada"
   }
 }
 
 FLUJO EN EL SDK:
 1️⃣  NetworkManager.performRequest() recibe respuesta
 2️⃣  Status code (200) es exitoso ✅
 3️⃣  JSON se decodifica a ChargeTransactionModel
 4️⃣  Retorna .success(transaction)
 
 USUARIO RECIBE:
 switch result {
 case .success(let transaction):
     print("✅ Ref: \(transaction.data.ref_payco)")  // 123456789
     print("Estado: \(transaction.data.estado)")     // Aceptada
 case .failure(let error):
     // No llega aquí
 }
*/

// ============================================================================
// ESCENARIO 2: ❌ ERROR DE VALIDACIÓN (HTTP 400)
// ============================================================================

/*
 API RESPONDE:
 HTTP 400 Bad Request
 {
   "status": false,
   "message": "El email no es válido",
   "errors": [
     {
       "field": "email",
       "message": "El email no es válido"
     }
   ],
   "data": {
     "invalid_field": "email"
   }
 }
 
 FLUJO EN EL SDK:
 1️⃣  NetworkManager.performRequest() recibe respuesta
 2️⃣  Status code (400) es error 🔴
 3️⃣  ErrorMapper.extractErrorMessage() busca "message" → "El email no es válido"
 4️⃣  ErrorMapper.extractErrorData() extrae datos adicionales
 5️⃣  Retorna .failure(ErrorResponse(...))
 
 USUARIO RECIBE:
 switch result {
 case .success(_):
     // No llega aquí
 case .failure(let error):
     print("Error: \(error.message)")          // "El email no es válido"
     print("Status: \(error.status_code)")     // 400
     if let data = error.data {
         print("Detalles: \(data)")             // {"invalid_field": "email"}
     }
 }
*/

// ============================================================================
// ESCENARIO 3: ❌ TARJETA RECHAZADA (HTTP 200 pero status: false)
// ============================================================================

/*
 API RESPONDE:
 HTTP 200 OK  ← Pero status: false
 {
   "status": false,
   "data": {
     "ref_payco": null,
     "estado": "Rechazada",
     "respuesta": "Tarjeta rechazada",
     "autorizacion": null,
     "cod_respuesta": 05
   }
 }
 
 FLUJO EN EL SDK:
 1️⃣  NetworkManager.performRequest() recibe respuesta
 2️⃣  Status code (200) es exitoso ✅
 3️⃣  JSON se decodifica a ChargeTransactionModel
 4️⃣  Resources/Charge.swift VALIDA que status == true
 5️⃣  Como status es false, retorna .failure()
 
 USUARIO RECIBE:
 switch result {
 case .success(_):
     // No llega aquí
 case .failure(let error):
     print("Error: Tarjeta rechazada")
 }
*/

// ============================================================================
// ESCENARIO 4: ❌ NO AUTORIZADO (HTTP 401)
// ============================================================================

/*
 API RESPONDE:
 HTTP 401 Unauthorized
 {
   "message": "No autorizado, revisa tus credenciales",
   "error": "Invalid credentials"
 }
 
 FLUJO EN EL SDK:
 1️⃣  NetworkManager.performRequest() recibe respuesta
 2️⃣  Status code (401) es error 🔴
 3️⃣  ErrorMapper.extractErrorMessage() busca message/error
 4️⃣  ErrorMapper.mapStatusCodeToMessage(401) → "No autorizado, revisa tus credenciales"
 5️⃣  Retorna .failure(ErrorResponse(...))
 
 USUARIO RECIBE:
 switch result {
 case .failure(let error):
     print("Error: \(error.message)")          // "No autorizado, revisa tus credenciales"
     print("Status: \(error.status_code)")     // 401
 }
*/

// ============================================================================
// ESCENARIO 5: ❌ ERROR DE RED (Sin respuesta del servidor)
// ============================================================================

/*
 RED FALLA:
 URLError.timedOut o URLError.notConnectedToInternet
 
 FLUJO EN EL SDK:
 1️⃣  URLSession.dataTask() genera error
 2️⃣  if resultError != nil → Entra aquí
 3️⃣  Captura el error y retorna .failure(ErrorResponse(...))
 
 USUARIO RECIBE:
 switch result {
 case .failure(let error):
     print("Error: Error de conexión")
     print("Status: 0")
 }
*/

// ============================================================================
// ESCENARIO 6: ❌ ERROR 500 DEL SERVIDOR
// ============================================================================

/*
 API RESPONDE:
 HTTP 500 Internal Server Error
 {
   "message": "Error interno del servidor"
 }
 
 FLUJO EN EL SDK:
 1️⃣  NetworkManager.performRequest() recibe respuesta
 2️⃣  Status code (500) es error 🔴
 3️⃣  ErrorMapper extrae message o usa mapStatusCodeToMessage(500)
 4️⃣  Retorna .failure(ErrorResponse(...))
 
 USUARIO RECIBE:
 switch result {
 case .failure(let error):
     print("Error: \(error.message)")          // "Error interno del servidor"
     print("Status: \(error.status_code)")     // 500
     if error.status_code >= 500 {
         print("🖥️ Intenta más tarde")
     }
 }
*/

// ============================================================================
// MATRIZ DE DECISIÓN - CÓMO SE MAPEAN LOS ERRORES
// ============================================================================

/*
 ÁRBOL DE DECISIÓN EN NetworkManager.performRequest():
 
 ┌─────────────────────────────────────┐
 │  Se realiza request HTTP            │
 └────────────┬────────────────────────┘
              │
              ├─── 🔴 ¿Errores de red?
              │    ├─ URLError.timedOut
              │    ├─ URLError.notConnectedToInternet
              │    └─ Otros URLError
              │    └─→ .failure(ErrorResponse(message: "Error de conexión"))
              │
              ├─── ✅ Status 200-206?
              │    ├─ Parsear JSON
              │    ├─ ✅ Éxito
              │    └─→ .success(responseModel)
              │    ❌ Fallo en parsing
              │    └─→ .failure(ErrorResponse(message: "Error al parsear"))
              │
              ├─── 🔴 Status 400-599?
              │    ├─ Extraer mensaje del JSON
              │    ├─ Extraer datos adicionales
              │    ├─ Si no hay mensaje, mapear por status code
              │    └─→ .failure(ErrorResponse(...))
              │
              └─── ❓ Otro status?
                   └─→ .failure(ErrorResponse(message: "Respuesta inesperada"))
*/

// ============================================================================
// MAPEO DE STATUS CODES POR ErrorMapper
// ============================================================================

/*
 400 → "Solicitud incorrecta, por favor verifica los datos enviados"
 401 → "No autorizado, revisa tus credenciales"
 403 → "Acceso prohibido, no tienes permisos para esta acción"
 404 → "La ruta en la que estás realizando la petición no existe"
 405 → "Método no permitido en esta ruta"
 408 → "Tiempo de espera agotado"
 429 → "Demasiadas solicitudes, por favor intenta más tarde"
 500 → "Error interno del servidor"
 503 → "Servicio no disponible, intenta más tarde"
*/

// ============================================================================
// BÚSQUEDA DE MENSAJE EN JSON (Orden de prioridad)
// ============================================================================

/*
 ErrorMapper intenta extraer mensaje en este orden:
 
 1. json["message"] → Si existe y no está vacío
    Ejemplo: {"message": "Tarjeta expirada"}
    
 2. json["errors"][0]["message"] → Array de objetos
    Ejemplo: {"errors": [{"message": "Email inválido"}]}
    
 3. json["errors"][0] → Array de strings
    Ejemplo: {"errors": ["Campo requerido vacío"]}
    
 4. json["error"] → Campo de error
    Ejemplo: {"error": "Unauthorized"}
    
 5. json["description"] → Descripción
    Ejemplo: {"description": "Resource not found"}
    
 6. Fallback: ErrorMapper.mapStatusCodeToMessage(statusCode)
    → Usa el mapeo por status code
*/

// ============================================================================
// ESTRUCTURA DE ERRORRESPONSE RETORNADA
// ============================================================================

/*
 ErrorResponse {
     status: Bool              // Siempre false en errores
     message: String           // Mensaje descriptivo
     data: Dictionary?          // Datos adicionales del error
     status_code: Int          // Código HTTP
 }
 
 Ejemplo de ErrorResponse:
 ErrorResponse(
     status: false,
     message: "El email no es válido",
     data: ["invalid_field": "email", "rule": "email"],
     status_code: 400
 )
*/

print("✅ Documentación de flujo de errores cargada")
print("")
print("RESUMEN:")
print("═══════════════════════════════════════════════════════════════")
print("✅ Nuevo sistema implementado:")
print("   • ErrorResponseModel.swift → Modelo de error unificado")
print("   • ErrorMapper.swift → Mapeo de status codes y extracción de mensajes")
print("   • NetworkManager.swift → Retorna Result<Model, ErrorResponse>")
print("   • Resources/Charge.swift → Usa nuevo sistema de errores")
print("   • ChargeExampleUsage.swift → Ejemplos de uso")
print("")
print("🎯 Cumple criterios:")
print("   ✅ Error descriptivo si el proceso falla")
print("   ✅ Errores de pago/suscripción respondidos correctamente")
print("   ✅ Errores internos con código HTTP correspondiente")
print("═══════════════════════════════════════════════════════════════")
