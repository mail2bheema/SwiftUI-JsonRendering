//
//  DetailProduct.swift
//  SwiftUI-JsonReading
//
//  Created by Admin on 24/04/24.
//

import SwiftUI

struct DetailProduct: View {
    @Environment(\.colorScheme) var colorScheme

        var body: some View {
            VStack {
                //Text("Current Color Scheme: \(colorScheme)")
                ChildView()
            }
            .environment(\.colorScheme, .dark)
        }
    
}
struct ChildView: View {
    var body: some View {
        Text("Child View")
    }
}


struct DetailProduct_Previews: PreviewProvider {
    static var previews: some View {
        DetailProduct()
    }
}
