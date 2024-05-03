//
//  ProductViewModel.swift
//  SwiftUI-JsonReading
//
//  Created by Admin on 21/04/24.
//

import Foundation
import SwiftUI

class ProductViewModel: ObservableObject {
    @Published var productList = [Product]()
    //@Published var isLoading = false
    
    func fetchProctInfo() {
        guard let url = URL(string:"https://dummyjson.com/products") else {
            return
        }
        URLSession.shared.dataTask(with: url) {[weak self] (data, response, error) in
            //self.isLoading = true
            if let error = error {
                print(error.localizedDescription)
            }
            guard let data = data else{
                print("No data found")
                return
            }
            do {
                let response =  try JSONDecoder().decode(ProductResponse.self, from: data)
                self?.productList = response.products
            }catch {

            }
        }.resume()
    }
    
    func readFromLocalFile() {
        guard let url = Bundle.main.url(forResource: "dummy", withExtension: "json") else {
            print("Unable to read a file")
            return
        }
        do{
            let data = try Data(contentsOf: url)
            let response =  try JSONDecoder().decode(ProductResponse.self, from: data)
            self.productList = response.products
        }catch {
            
        }

    }

    
}

