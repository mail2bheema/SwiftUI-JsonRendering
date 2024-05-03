//
//  CusotmCell.swift
//  SwiftUI-JsonReading
//
//  Created by Admin on 24/04/24.
//

import SwiftUI

struct CusotmCell: View {
    let product: Product
    
    var body: some View {
        HStack(){
            Image("xcode").resizable().frame(width: 100, height: 100, alignment: .leading).aspectRatio(contentMode: .fit)
            VStack(alignment: .leading) {
                Text(product.title)
                    .font(.headline).foregroundColor(.red)
                Text(product.description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        } .padding(.vertical, 8)
    }
}
