import Foundation

struct LoginResponse: Codable {
    let message: String
    let authToken: String
    let id: String
    
    // Handle error data when there's a validation error
    struct ErrorData: Codable {
        let message: String
    }

    var errorData: ErrorData? {
        return nil
    }
}
