//
//  BackButton.swift
//  kacadata
//
//  Created by Ridho Saputra on 02/11/22.
//

import SwiftUI

struct BackButton: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var foregroundColor: Color
    var title: String
    
    var body: some View {
        Button(action: { presentationMode.wrappedValue.dismiss()}) {
            HStack {
                
                Image(systemName: "arrow.left")
                    .foregroundColor(foregroundColor)
                    .aspectRatio(contentMode: .fit)
                Text(title)
                    .foregroundColor(foregroundColor)
            }
        }
    }
}
