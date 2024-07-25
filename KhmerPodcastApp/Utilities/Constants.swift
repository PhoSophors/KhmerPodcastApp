import Foundation

struct Constants {
    struct API {
        static let baseURL = "http://localhost:4000"
        static let loginEndpoint = "/auths/login"
        static let registerEndpoint = "/auths/register"
        static let regsterOTP = "/auths/user/verify-otp"
        
        static func userInfoEndpoint(for id: String) -> String {
            return "/users/user-data/\(id)"
        }
    }
}
