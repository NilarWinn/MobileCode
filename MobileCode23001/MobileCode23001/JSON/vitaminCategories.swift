//
//  vitaminCategories.swift
//  MobileCode23001
//
//  Created by Nilar Win on 12/11/2024.
//

import Foundation

let jsonString = """
{
    "data": [
        {"id": 1, "name": "Sleep"},
        {"id": 2, "name": "Immunity"},
        {"id": 3, "name": "Stress"},
        {"id": 4, "name": "Joint Support"},
        {"id": 5, "name": "Digestion"},
        {"id": 6, "name": "Mood"},
        {"id": 7, "name": "Energy"},
        {"id": 8, "name": "Hair, Nail, Skin"},
        {"id": 9, "name": "Weight Loss"},
        {"id": 10, "name": "Fitness"}
    ]
}
"""

if let jsonData = jsonString.data(using: .utf8) {
    UserDefaults.standard.set(jsonData, forKey: "vitaminCategories")
}
