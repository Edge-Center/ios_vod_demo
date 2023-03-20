//
//  RefreshTokenRequest.swift
//  EdgeCenterVodDemo
//
//  Created by Evgenij Polubin on 09.08.2022.
//

import Foundation

struct RefreshTokenRequest: DataRequest {
    typealias Response = Tokens
    
    let token: String
    
    var url: String { EdgeCenterAPI.refreshToken.rawValue }
    var method: HTTPMethod { .post }
    
    var body: Data? {
       try? JSONEncoder().encode([
        "refresh": token
       ])
    }
}
