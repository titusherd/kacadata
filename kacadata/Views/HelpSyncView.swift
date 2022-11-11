//
//  HelpSyncView.swift
//  kacadata
//
//  Created by Ridho Saputra on 26/10/22.
//

import SwiftUI

struct HelpSyncView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Hello World")
            }
        }
        .navigationBarItems(leading: BackButton(foregroundColor: .primary, title: "Connect"))
    }
}

struct HelpSyncView_Previews: PreviewProvider {
    static var previews: some View {
        HelpSyncView()
    }
}
