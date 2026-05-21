# Epayco SDK iOS - Sistema de Errores Mejorado

## 🎯 Cambios Realizados

### Archivos Nuevos
- `Sources/epayco-ios/Models/ErrorResponseModel.swift` - Modelo de error
- `Sources/epayco-ios/Utils/ErrorMapper.swift` - Mapeo de status codes

### Archivos Modificados
- `Sources/epayco-ios/Utils/NetworkManager.swift` - Retorna `Result<ResponseModel, ErrorResponse>`
- `Sources/epayco-ios/Resources/Charge.swift` - Métodos retornan Result type

### Referencia
- `Sources/epayco-ios/Resources/ChargeExampleUsage.swift` - Ejemplos de uso
- `Tests/epayco-iosTests/ErrorFlowTestCases.swift` - Escenarios de prueba

---

## 📝 Patrón de Uso

```swift
let result = epayco.charge.create(chargeData)

switch result {
case .success(let transaction):
    // Manejar éxito
    print("Ref: \(transaction.data.ref_payco)")
    
case .failure(let error):
    // Manejar error
    print("Error: \(error.message)")
    print("Status: \(error.status_code)")
}
```

---

## 🔧 Integración Rápida

1. Copiar `ErrorResponseModel.swift` a `Models/`
2. Copiar `ErrorMapper.swift` a `Utils/`
3. Reemplazar `NetworkManager.swift` en `Utils/`
4. Reemplazar `Charge.swift` en `Resources/`
5. Compilar con `swift build`

---

## 📖 Documentación Adicional

Ver:
- [README.md](README.md) - Guía de uso completa
- `ChargeExampleUsage.swift` - Ejemplos detallados
- `ErrorFlowTestCases.swift` - Casos de prueba
