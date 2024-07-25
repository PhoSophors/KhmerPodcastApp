import Foundation

struct UserResponse: Codable {
    let message: String
    let status: Int
    let data: UserData
}

struct UserData: Codable {
    let user: User
}

struct User: Codable {
    let _id: String
    let username: String
    let email: String
    let bio: String
    let role: String
    let profileImage: String?
    // let socail media
    let facebook: String
    let instagram: String
    let tiktok: String
    let twitter: String
    let website: String
    let youtube: String
    let createdAt: String
    let emailVerified: Bool
}
