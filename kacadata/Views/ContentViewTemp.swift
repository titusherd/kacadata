//
//  ContentView.swift
//  kacadata
//
//  Created by Ridho Saputra on 11/10/22.
//

import SwiftUI
import Charts
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    let data: [OverviewModel] = [
        OverviewModel(label: "Roti Kukus", value: 5),
        OverviewModel(label: "Ayam Goreng", value: 1),
        OverviewModel(label: "Es Teh", value: 7)
    ]
    
    var body: some View {
        Chart(data) {
            let value = $0.value
            BarMark (
                x: .value("Value", $0.value),
                y: .value("Time", $0.label)
            )
            .foregroundStyle(Color.orange)
            .annotation(position: .overlay, alignment: .trailing, spacing: 4) {
                Text("\(value)")
                    .font(.footnote)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
            }
        }
        .frame(height: 320)
        .padding()
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
