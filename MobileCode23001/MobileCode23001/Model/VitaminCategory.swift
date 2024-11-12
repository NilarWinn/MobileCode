//
//  VitaminCategory.swift
//  MobileCode23001
//
//  Created by Nilar Win on 12/11/2024.
//

import Foundation

struct VitaminCategory: Codable {
    let id: Int
    let name: String
}

struct ResponseData: Codable {
    let data: [VitaminCategory]
}
