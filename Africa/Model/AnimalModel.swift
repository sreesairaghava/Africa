//
//  AnimalModel.swift
//  Africa
//
//  Created by Sree Sai Raghava Dandu on 29/11/20.
//

import SwiftUI

struct Animal: Codable,Identifiable {
    let id:String
    let name: String
    let headline: String
    let description: String
    let link: String
    let image: String
    let gallery:[String]
    let fact:[String]
}
