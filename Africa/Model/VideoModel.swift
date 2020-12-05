//
//  VideoModel.swift
//  Africa
//
//  Created by Sree Sai Raghava Dandu on 30/11/20.
//

import Foundation

// Data Structure for the videos

struct Video:Codable,Identifiable {
    let id: String
    let name: String
    let headline: String
//    Computed property
    var thumbnail:String{
        "video-\(id)"
    }
}
