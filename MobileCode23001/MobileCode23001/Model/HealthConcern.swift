//
//  HealthConcern.swift
//  MobileCode23001
//
//  Created by Nilar Win on 12/11/2024.
//

import Foundation
import UIKit

struct HealthConcern: Codable {
    var id: Int
    var name: String
    var priority: Int
}

struct Allergy: Codable {
    var id: Int
    var name: String
}

struct UserHealthData: Codable {
    var healthConcerns: [HealthConcern]
    var diets: [String]
    var isDailyExposure: Bool = false
    var isSmoke: Bool = false
    var alcohol: String = "0-1"
    var allergies: [Allergy]

    enum CodingKeys: String, CodingKey {
        case healthConcerns = "health_concerns"
        case diets
        case isDailyExposure = "is_daily_exposure"
        case isSmoke = "is_somke"
        case alcohol
        case allergies
    }
}
