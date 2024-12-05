//
//  ProductView.swift
//  finalExamDanyloChystov
//
//  Created by Dan on 2024-12-05.
// Student ID: 991560947
// Student name: Danylo Chystov

import SwiftUI

struct ProductView: View {
    let product: Product
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 15){
                Text(product.title).font(.title).bold()
                VStack(alignment: .leading , spacing: 15){
                    Text("Product description: \(product.description)").font(.body)
                    Text("Category: \(product.category)")
                    Text("Product Price: \(product.price, specifier: "%.2f")$")
                    Text("Discount: \(product.discountPercentage, specifier: "%.1f")%")
                    Text("Product Discounted Price: \(product.discountedPrice, specifier: "%.2f")$")
                    Text("Rating: \(product.rating, specifier: "%.1f")")
                    Text("Available items: \(product.stock)")
                }.padding(15)
                
            }//end of vstack
            .padding(5)
        }// end of scroll view
        .navigationTitle("Product Details")
    }//end of body
}

//#Preview {
//    ProductView()
//}
