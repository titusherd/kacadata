//
//  ExampleView.swift
//  kacadata
//
//  Created by Ridho Saputra on 19/10/22.
//

import SwiftUI

struct ExampleView: View {
    
    @StateObject
    var homeVM: HomeViewModel
    @State
    private var isAdded = false
    @State
    private var isOpened = false
    
    func printFont() {
        for family in UIFont.familyNames.sorted() {
          let names = UIFont.fontNames(forFamilyName: family)
          print("Family: \(family) Font names: \(names)")
        }
    }
    
    var body: some View {
        Text("Check Our Learning Objective")
            .font(.largerTitleApp)
            .fontWeight(.heavy)
            .foregroundColor(.black)
            .padding(.bottom, 18)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .strokeBorder(.blue, lineWidth: 1)
            )
            .sheet(isPresented: $isOpened) {
                DocumentPickerView(homeViewModel: homeVM, added: $isAdded)
            }
            .onTapGesture {
                printFont()
                isOpened.toggle()
            }
    }
}

struct ExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleView(homeVM: HomeViewModel())
    }
}
