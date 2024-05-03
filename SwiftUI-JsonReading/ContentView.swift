//
//  ContentView.swift
//  SwiftUI-JsonReading
//
//  Created by Admin on 21/04/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var productViewModel = ProductViewModel()
    var body: some View {

        NavigationView{
            VStack {
                List(productViewModel.productList){product in
                    VStack {
                        NavigationLink("", destination: DetailProduct())
                        CusotmCell(product: product)
                    }.listStyle(PlainListStyle())
                }
            }.navigationTitle("Products").onAppear() {
                productViewModel.readFromLocalFile()
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
