//
//  ContentView.swift
//  PropertyWrappers
//
//  Created by Abishan Parameswaran on 2023-03-01.
//

import SwiftUI

struct FruitModel: Identifiable {
    let id = UUID()
    let name: String
    let price: Int
}

class FruitViewModel: ObservableObject {
    @Published var fruits: [FruitModel] = []
    @StateObject var fruitModel = FruitViewModel()
    
    init() {
        getFruits()
    }
    
    func getFruits() {
        let fruitOne = FruitModel(name: "Apple", price: 200)
        let fruitTwo = FruitModel(name: "Orange", price: 150)
        let fruitThree = FruitModel(name: "Mango", price: 100)
        let fruitFour = FruitModel(name: "Grape", price: 300)
        let fruitFive = FruitModel(name: "Strawberry", price: 450)
        
        fruits.append(fruitOne)
        fruits.append(fruitTwo)
        fruits.append(fruitThree)
        fruits.append(fruitFour)
        fruits.append(fruitFive)
    }
    
    func deleteFruits(index: IndexSet){
        fruits.remove(atOffsets: index)
    }
    
    func addFruits(){
        let fruitSix = FruitModel(name: "Watermelon", price: 120)
        fruits.append(fruitSix)
    }
}
struct ContentView: View {
//    @State var fruits: [FruitModel] = []
    
    @ObservedObject var fruitViewModel: FruitViewModel = FruitViewModel()
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(fruitViewModel.fruits) { fruit in
                    NavigationLink {
//                        SecondView(fruitName: "\(fruit.name)", fruitPrice: fruit.price, fruitViewModel: fruitViewModel )
                        SecondView(fruitName: "\(fruit.name)", fruitPrice: fruit.price)
                    } label: {
                        HStack{
                            Text("\(fruit.name)")
                            Spacer()
                            Text("\(fruit.price)")
                        }
                    }

                    
                }
                
                
                //Delete theItems from the list by swiping it to left
                .onDelete{ index in
                    fruitViewModel.deleteFruits(index: index)
                }
            }
            .navigationTitle("Fruits")
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button {
                        //Insert New Fruit
                        fruitViewModel.addFruits()
                        print("New Fruit Add Dev test")
                    } label: {
                        Image(systemName: "square.and.arrow.up")
                    }

                }
            }
            
        }
        .environmentObject(fruitViewModel)

//        .onAppear{
//            fruitViewModel.getFruits()
//        }
    }
//    func getFruits() {
//        let fruitOne = FruitModel(name: "Apple", price: 200)
//        let fruitTwo = FruitModel(name: "Orange", price: 150)
//        let fruitThree = FruitModel(name: "Mango", price: 100)
//        let fruitFour = FruitModel(name: "Grape", price: 300)
//        let fruitFive = FruitModel(name: "Strawberry", price: 450)
//
//        fruits.append(fruitOne)
//        fruits.append(fruitTwo)
//        fruits.append(fruitThree)
//        fruits.append(fruitFour)
//        fruits.append(fruitFive)
//    }
//
//    func deleteFruits(index: IndexSet){
//        fruits.remove(atOffsets: index)
//    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
