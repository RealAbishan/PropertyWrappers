//
//  SecondView.swift
//  PropertyWrappers
//
//  Created by Abishan Parameswaran on 2023-03-01.
//

import SwiftUI

struct SecondView: View {
    
    var fruitName: String = ""
    var fruitPrice: Int = 0
   // @StateObject var  fruitViewModel: FruitViewModel

    var body: some View {
        
        NavigationLink {
            ThirdView()
        } label: {
            
            
            Text("\(fruitName)")
                .font(.largeTitle)
            
            Text("\(fruitPrice)")
                .font(.title)
        }
        .navigationTitle("\(fruitName)")

        
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
        
       // SecondView(fruitViewModel : FruitViewModel())
    }
}
