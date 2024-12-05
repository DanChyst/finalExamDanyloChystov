//
//  ProductView.swift
//  finalExamDanyloChystov
//
//  Created by Dan on 2024-12-05.
//

import SwiftUI

struct ProductView: View {
    let product: Product
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 10){
                Text(product.title).font(.title)
                Text("Product description: \(product.description)").font(.body)
                Text("Category: \(product.category)")
                Text("Product Price: \(product.price, specifier: "%.2f")")
                Text("Discount: \(product.discountPercentage)%")
                Text("Product Discounted Price: \(product.discountedPrice)")
                Text("Rating: \(product.rating, specifier: "%.1f")")
                Text("Available items: \(product.stock)")
            }//end of vstack
            .padding()
        }// end of scroll view
        .navigationTitle("Product Details")
    }//end of body
}

//#Preview {
//    ProductView()
//}
