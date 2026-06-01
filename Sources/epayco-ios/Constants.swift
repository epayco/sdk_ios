import Foundation

public struct K {
    // URLs base - soportan variables de entorno
    public static var urlBase: String {
        ProcessInfo.processInfo.environment["BASE_URL_SDK"] ?? "https://eks-subscription-api-lumen-service.epayco.io"
    }
    
    public static var baseUrlSecure: String {
        ProcessInfo.processInfo.environment["SECURE_URL_SDK"] ?? "https://eks-rest-pagos-service.epayco.io"
    }
    
    public static var entorno: String {
        ProcessInfo.processInfo.environment["ENTORNO_SDK"] ?? "/restpagos"
    }
    
    public static var baseUrlApify: String {
        ProcessInfo.processInfo.environment["BASE_URL_APIFY"] ?? "https://eks-apify-service.epayco.io"
    }
}