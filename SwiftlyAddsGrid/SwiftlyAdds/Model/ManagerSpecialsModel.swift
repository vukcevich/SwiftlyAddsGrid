//
//  ManagerSpecialsModel.swift
//  SwiftlyAdds
//
//  Created by MARIJAN VUKCEVICH on 5/27/21.
//

import Foundation

// MARK: - ManagerSpecialsModel
struct ManagerSpecialsModel: Codable {
    let canvasUnit: Int?
    let managerSpecials: [ManagerSpecial]?
    
    enum CodingKeys: String, CodingKey {
     case canvasUnit, managerSpecials
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        canvasUnit = try values.decodeIfPresent(Int.self, forKey: .canvasUnit)
        managerSpecials = try values.decodeIfPresent([ManagerSpecial].self, forKey: .managerSpecials)
    }
}

// MARK: - ManagerSpecial
struct ManagerSpecial: Codable {
    let displayName: String?
    let height: Int?
    let imageURL: String?
    let originalPrice, price: String?
    let width: Int?

    enum CodingKeys: String, CodingKey {
        case displayName = "display_name"
        case height
        case imageURL = "imageUrl"
        case originalPrice = "original_price"
        case price, width
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        displayName = try values.decodeIfPresent(String.self, forKey: .displayName)
        height = try values.decodeIfPresent(Int.self, forKey: .height)
        imageURL = try values.decodeIfPresent(String.self, forKey: .imageURL)
        originalPrice = try values.decodeIfPresent(String.self, forKey: .originalPrice)
        price = try values.decodeIfPresent(String.self, forKey: .price)
        width = try values.decodeIfPresent(Int.self, forKey: .width)
    }
}
