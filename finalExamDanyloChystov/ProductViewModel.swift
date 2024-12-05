//
//  ProductViewModel.swift
//  finalExamDanyloChystov
//
//  Created by Dan on 2024-12-05.
//
// Student ID: 991560947
// Student name: Danylo Chystov
import Foundation

class ProductViewModel: ObservableObject{
    @Published var products: [Product] = []
    @Published var filteredProducts: [Product] = []
    @Published var selectedCategory: String = ""
    @Published var errorMsg: String?
    
    private let baseUrl = "https://dummyjson.com/"
    private let parameters = "products"
    
    func fetchProducts(){
        let productUrl = baseUrl + parameters
        
        guard let url = URL(string: productUrl) else {
            print("error with URL")
            
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                DispatchQueue.main.async {
                    self.errorMsg = error.localizedDescription
                }
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    self.errorMsg = "No data received"
                }
                return
            }
            
            print(String(data: data, encoding: .utf8) ?? "Invalid JSON")
            do {
                let response = try JSONDecoder().decode(ProductResponce.self, from: data)
                DispatchQueue.main.async {
                    self.products = response.products
                    self.filteredProducts = self.products
                }
            } catch {
                DispatchQueue.main.async {
                    self.errorMsg = error.localizedDescription
                }
            }
        }.resume()
        
    }
    
    func filteredProducts(by category: String){
        if category.isEmpty{
            filteredProducts = products
        }else{
            filteredProducts = products.filter{$0.category.lowercased().contains(category.lowercased())}
        }
    }
}
