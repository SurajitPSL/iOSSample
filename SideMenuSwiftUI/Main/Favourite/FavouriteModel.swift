//
//  FavouriteModel.swift
//  SideMenuSwiftUI
//
//  Created by Surajit Dhara on 27/11/23.
//

import Foundation
import SwiftUI

//struct Album: Codable, Hashable{
//    var id: Int
//    var albumId: Int
//    var url, title, thumbnailUrl : String
//
//   private enum Codingkeys: String , CodingKey  {
//    case url
//    case title
//    case thumbnailUrl
//    case albumId
//    case id
//    }
//
//}
//
//struct Albums:Codable{
//    var listOfAlbum: [Album]?
//}
import Foundation

// MARK: - JSON
struct ProductDetails: Codable {
    let products: [Product]
    let total, skip, limit: Int
    
}

//extension KeyedDecodingContainer {
//    func decodeWrapper<T>(key: K, defaultValue: T) throws -> T
//        where T : Decodable {
//        return try decodeIfPresent(T.self, forKey: key) ?? defaultValue
//    }
//}
// MARK: - Product
struct Product: Codable, Hashable, Equatable{
//    static func == (lhs: Product, rhs: Product) -> Bool {
//        <#code#>
//    }
//    
    var brand: String?
    var availabilityStatus,category, description: String?
    var dimensions: Dimensions?
    var discountPercentage: Double?
    var id: Int?
    var images: [String]?
    var meta: Meta?
    var minimumOrderQuantity: Int?
    var price, rating: Double?
    var returnPolicy: String?
    var reviews: [Review]?
    var shippingInformation, sku: String?
    var stock: Int?
    var tags: [String]?
    var thumbnail: String?
    var title, warrantyInformation: String?
    var weight: Int?

   
   init(from decoder: Decoder) throws {
       
    let container = try decoder.container(keyedBy: CodingKeys.self)
        if let brand = try container.decodeIfPresent(String.self, forKey: .brand) {
            self.brand = brand
        }
       if let availabilityStatus = try container.decodeIfPresent(String.self, forKey: .availabilityStatus) {
           self.availabilityStatus = availabilityStatus
       }
       if let category = try container.decodeIfPresent(String.self, forKey: .category) {
           self.category = category
       }
       if let description = try container.decodeIfPresent(String.self, forKey: .description) {
           self.description = description
       }
       if let dimensions = try container.decodeIfPresent(Dimensions.self, forKey: .dimensions) {
           self.dimensions = dimensions
       }
       if let discountPercentage = try container.decodeIfPresent(Double.self, forKey: .discountPercentage) {
           self.discountPercentage = discountPercentage
       }
       if let id = try container.decodeIfPresent(Int.self, forKey: .id) {
           self.id = id
       }
       if let images = try container.decodeIfPresent([String].self, forKey: .images) {
           self.images = images
       }
       if let meta = try container.decodeIfPresent(Meta.self, forKey: .meta) {
           self.meta = meta
       }
       if let minimumOrderQuantity = try container.decodeIfPresent(Int.self, forKey: .minimumOrderQuantity) {
           self.minimumOrderQuantity = minimumOrderQuantity
       }
       if let price = try container.decodeIfPresent(Double.self, forKey: .price) {
           self.price = price
       }
       if let rating = try container.decodeIfPresent(Double.self, forKey: .rating) {
           self.rating = rating
       }
       if let returnPolicy = try container.decodeIfPresent(String.self, forKey: .returnPolicy) {
           self.returnPolicy = returnPolicy
       }
       if let reviews = try container.decodeIfPresent([Review].self, forKey: .reviews) {
           self.reviews = reviews
       }
       if let shippingInformation = try container.decodeIfPresent(String.self, forKey: .shippingInformation) {
           self.shippingInformation = shippingInformation
       }
       if let sku = try container.decodeIfPresent(String.self, forKey: .sku) {
           self.sku = sku
       }
       if let stock = try container.decodeIfPresent(Int.self, forKey: .stock) {
           self.stock = stock
       }
       if let tags = try container.decodeIfPresent([String].self, forKey: .tags) {
           self.tags = tags
       }
       if let thumbnail = try container.decodeIfPresent(String.self, forKey: .thumbnail) {
           self.thumbnail = thumbnail
       }
       if let title = try container.decodeIfPresent(String.self, forKey: .title) {
           self.title = title
       }
       if let warrantyInformation = try container.decodeIfPresent(String.self, forKey: .warrantyInformation) {
           self.warrantyInformation = warrantyInformation
       }
       if let weight = try container.decodeIfPresent(Int.self, forKey: .weight) {
           self.weight = weight
       }
    }
    
    
}

// MARK: - Dimensions
struct Dimensions: Codable, Hashable {
    var width, height, depth: Double?
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if let width = try container.decodeIfPresent(Double.self, forKey: .width) {
            self.width = width
        }
        if let height = try container.decodeIfPresent(Double.self, forKey: .height) {
            self.height = height
        }
        if let depth = try container.decodeIfPresent(Double.self, forKey: .depth) {
            self.depth = depth
        }
    }
}

// MARK: - Meta
struct Meta: Codable,Hashable {
    let barcode, createdAt: String
    let qrCode: String
    let updatedAt: String
}

// MARK: - Review
struct Review: Codable, Hashable {
    let comment, date: String
    let rating: Int
    let reviewerEmail, reviewerName: String
}
