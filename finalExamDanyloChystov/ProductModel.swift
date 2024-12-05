//
//  ProductModel.swift
//  finalExamDanyloChystov
//
//  Created by Dan on 2024-12-05.
//

import Foundation

struct Product: Identifiable, Codable{
    let id: Int
    let title: String
    let description: String
    let category: String
    let price: Double
    let discountPercentage: Double
    let rating: Double
    let stock: Int
    var discountedPrice : Double{
        return price * (1 - discountPercentage/100)
    }
}
