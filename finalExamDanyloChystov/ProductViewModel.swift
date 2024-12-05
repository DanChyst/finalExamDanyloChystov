//
//  ProductViewModel.swift
//  finalExamDanyloChystov
//
//  Created by Dan on 2024-12-05.
//

import Foundation

class ProductViewModel: ObservableObject{
    @Published var products : [Product]
    @Published var filteredProducts : [Product]
    @Published var selsectedCategory : String
    @Published var errorMsg : String?
    
    private let baseUrl = "https://dummyjson.com/"
    private let parameters = "products"
    
    func fetchProducts(){
        let productUrl = baseUrl + parameters
        
        guard let url = URL(string: productUrl) else {
            print("error with URL")
            
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            
            if let error = error{
                DispatchQueue.main.async{
                    self.errorMsg = error.localizedDescription
                }
                return
            }
            
            guard let data = data, error == nil else {
                print("Network Error:", error ?? " ??? error")
                return
            }

            do {
                
                if let jsonString = String(data: data, encoding: .utf8) {
                    print("JSON response:", jsonString)
                }
                
                let productResponce = try JSONDecoder().decode(Product.self, from: data)
                DispatchQueue.main.async {
                    
                }
            } catch {
                print("decoding Error:", error)
            }
        }.resume()
        
    }
}
