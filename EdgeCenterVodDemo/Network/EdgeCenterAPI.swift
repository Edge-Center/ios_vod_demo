import Foundation

enum EdgeCenterAPI: String {
    case authorization = "https://api.edgecenter.ru/iam/auth/jwt/login"
    case videos = "https://api.edgecenter.ru/streaming/videos"
    case refreshToken = "https://api.edgecenter.ru/iam/auth/jwt/refresh"
}
