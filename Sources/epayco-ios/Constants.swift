import Foundation

public struct K {
   // URLs base - soportan variables de entorno
    public static var urlBase: String {
        ProcessInfo.processInfo.environment["BASE_URL_SDK"] ?? "https://api.secure.payco.co"
    }
    
    public static var baseUrlSecure: String {
        ProcessInfo.processInfo.environment["SECURE_URL_SDK"] ?? "https://secure.payco.co"
    }
    
    public static var entorno: String {
        ProcessInfo.processInfo.environment["ENTORNO_SDK"] ?? "/restpagos"
    }
    
    public static var baseUrlApify: String {
        ProcessInfo.processInfo.environment["BASE_URL_APIFY"] ?? "https://apify.epayco.co"
    }
