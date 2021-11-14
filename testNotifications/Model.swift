//
//  Model.swift
//  testNotifications
//
//  Created by Apple on 13/11/21.
//

import Foundation


import Foundation

// MARK: - Welcome
struct Products: Codable {
    let name: Name
}

// MARK: - Name
struct Name: Codable {
    let shoes: Shoes
}

// MARK: - Shoes
struct Shoes: Codable {
    let size: Size
}

// MARK: - Size
struct Size: Codable {
    let type, type1: String
}
