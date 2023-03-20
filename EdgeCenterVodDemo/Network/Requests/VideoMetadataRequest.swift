//
//  VideoMetadataRequest.swift
//  EdgeCenterVodDemo
//
//  Created by Evgenij Polubin on 10.08.2022.
//

import Foundation

struct VideoMetadataRequest: DataRequest {
    typealias Response = VideoMetadata
    
    let token: String
    let videoId: Int
    
    var url: String { EdgeCenterAPI.videos.rawValue + "/\(videoId)/" + "upload" }
    var method: HTTPMethod { .get }
    
    var headers: [String: String] {
        [ "Authorization" : "Bearer \(token)" ]
    }
}
