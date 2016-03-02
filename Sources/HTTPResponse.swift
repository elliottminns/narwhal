import Foundation

public struct HTTPResponse {
    
    let status: Int
    let headers: [String: String]
    let body: String?

}
