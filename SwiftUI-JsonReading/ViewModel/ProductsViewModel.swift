//
//  ProductsViewModel.swift
//  SwiftUI-JsonReading
//
//  Created by Admin on 24/04/24.
//

import Foundation
import SwiftUI

class ProductsViewModel: ObservableObject {
    @Published var productList = [Product]()
    
    
    func fetDataFromServer(with url:URL,compleation:@escaping(Result<Data,Error>)->Void) {
        
        URLSession.shared.dataTask(with: url) {[weak self](data, response, error) in
            if let error = error {
                print("\(error.localizedDescription)")
                compleation(.failure(error))
            }
            guard let data = data else {
                compleation(.failure("No data found" as! Error))
                return
            }
            do {
                let response = try JSONDecoder().decode(ProductResponse.self, from: data)
                self?.productList = response.products
            }catch {
                
            }
        }
    
        
    }
    
    
}
