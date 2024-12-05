//
//  ContentView.swift
//  finalExamDanyloChystov
//
//  Created by Dan on 2024-12-05.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ProductViewModel()
    @State private var searchText : String = ""
    var body: some View {
        NavigationStack{
            VStack{
                TextField("Search products by category", text: $searchText, onCommit: {
                    viewModel.filteredProducts(by: searchText)
                })
                .textFieldStyle(.roundedBorder)
                .padding(25)
                
                if let errorMsg = viewModel.errorMsg{
                    Text("\(errorMsg)")
                        .foregroundColor(.red)
                        .multilineTextAlignment(.center)
                        .padding()
                }
                
                
                if !viewModel.filteredProducts.isEmpty{
                    List(viewModel.filteredProducts){ product in
                        NavigationLink(destination: ProductView(product: product)) {
                            VStack(alignment: .leading) {
                                Text(product.title)
                                    .font(.headline)
                                Text(product.category)
                                    .font(.subheadline)
                                Text("$\(product.price, specifier: "%.2f")")
                                Text("Rating: \(product.rating, specifier: "%.1f")")
                            }
                        }
                    }
                }
                
                
            }.onAppear{
                viewModel.fetchProducts()
            }
        }.navigationTitle("Products")
        
    }
}

#Preview {
    ContentView()
}


//import SwiftUI
//
//struct ContentView: View {
//    
//    @StateObject var viewModel = WeatherViewModel()
//    @State var city: String = ""
//    
//    
//    var body: some View {
//        VStack {
//            
//            Text("Weather Forecast")
//                .font(.largeTitle)
//                .fontWeight(.bold)
//                .padding()
//            
//            TextField("Enter City Name", text: $city)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//                .padding()
//            
//            Button(action: {
//                viewModel.fetchWeather(for: city) // Trigger the API call
//            }) {
//                Text("Get Forecast")
//                    .padding()
//                    .background(Color.blue)
//                    .foregroundColor(.white)
//                    .cornerRadius(10)
//                    .padding(.horizontal)
//            }
//            .padding(.horizontal)
//            
//            if let errorMsg = viewModel.errorMsg {
//                Text(errorMsg)
//                    .foregroundColor(.red)
//                    .multilineTextAlignment(.center)
//                    .padding()
//            }
//            
//            // List of Forecasts
//            VStack{
//                if  (viewModel.cityName != nil) {
//                    Text(viewModel.cityName!)
//                        .font(.title)
//                        .fontWeight(.bold)
//                        .padding()
//                }
//                List(viewModel.forecasts) { forecast in
//                    VStack(alignment: .center) {
//                        Text(getTime(time: forecast.dt)) // Display time
//                            .font(.subheadline)
//                        HStack{
//                            VStack(alignment: .leading) {
//                                Text("Temperature: \(Int(forecast.main.temp))°C")
//                                Text("Feels Like: \(Int(forecast.main.feelsLike))°C")
//                                Text("Pressure: \(forecast.main.pressure) hPa")
//                                Text("Humidity: \(forecast.main.humidity)%")
//                            }
//                            Spacer()
//                            Image(systemName: getIcon(forecast.weather.first?.main ?? "Unknown"))
//                                .font(.largeTitle)
//                                .foregroundColor(.blue)
//                        }//end of hstack
//                    }//end of vstack
//                }.listStyle(.plain)
//                
//            }
//            .padding()
//        }
//    }
//}
//
//#Preview {
//    ContentView()
//}
//
//import SwiftUI
//
//struct ProductListView: View {
//    @StateObject private var viewModel = ProductViewModel()
//    @State private var searchText: String = ""
//    
//    var body: some View {
//        NavigationStack {
//            VStack {
//                TextField("Search by category", text: $searchText, onCommit: {
//                    viewModel.filterProducts(by: searchText)
//                })
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//                .padding()
//                
//                if let errorMessage = viewModel.errorMessage {
//                    Text(errorMessage)
//                        .foregroundColor(.red)
//                }
//                
//                List(viewModel.filteredProducts) { product in
//                    NavigationLink(destination: ProductDetailView(product: product)) {
//                        VStack(alignment: .leading) {
//                            Text(product.title)
//                                .font(.headline)
//                            Text(product.category)
//                                .font(.subheadline)
//                            Text("$\(product.price, specifier: "%.2f")")
//                            Text("Rating: \(product.rating, specifier: "%.1f")")
//                        }
//                    }
//                }
//            }
//            .onAppear {
//                viewModel.fetchProducts()
//            }
//            .navigationTitle("Products")
//        }
//    }
//}
//
//
//
