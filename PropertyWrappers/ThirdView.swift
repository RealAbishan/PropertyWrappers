//
//  ThirdView.swift
//  PropertyWrappers
//
//  Created by Abishan Parameswaran on 2023-03-01.
//

import SwiftUI

struct ThirdView: View {
    
    @EnvironmentObject var  fruitViewModel: FruitViewModel
    var body: some View {
        
        NavigationStack{
            List{
                ForEach(fruitViewModel.fruits){ fruit in
                    Text("\(fruit.name)")
                    
                }
            }
            .navigationTitle("Fruits' Names")
        }
    }
}

struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
        //ThirdView(fruitViewModel: FruitViewModel())
        ThirdView()
    }
}
