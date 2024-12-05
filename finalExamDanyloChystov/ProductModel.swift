//
//  ProductModel.swift
//  finalExamDanyloChystov
//
//  Created by Dan on 2024-12-05.
//
// Student ID: 991560947
// Student name: Danylo Chystov
import Foundation

struct ProductResponce: Codable{
    let products: [Product]
}

struct Product: Identifiable, Codable {
    let id: Int
    let title: String
    let description: String
    let category: String
    let price: Double
    let discountPercentage: Double
    let rating: Double
    let stock: Int
    
    var discountedPrice: Double {
        return price - (price * discountPercentage / 100)
    }
}
