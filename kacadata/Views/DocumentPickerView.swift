//
//  DocumentPickerView.swift
//  kacadata
//
//  Created by Ridho Saputra on 18/10/22.
//

import Foundation
import SwiftUI
import UIKit

struct DocumentPickerView: UIViewControllerRepresentable {
    @ObservedObject
    var homeViewModel: HomeViewModel
    @Binding
    var added: Bool
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<DocumentPickerView>) -> UIDocumentPickerViewController {
        let controller = UIDocumentPickerViewController(forOpeningContentTypes: [.text,.pdf])
        controller.allowsMultipleSelection = false
        controller.shouldShowFileExtensions = true
        controller.delegate = context.coordinator
        return controller
    }
    
    func updateUIViewController(_ uiViewController: DocumentPickerView.UIViewControllerType, context: UIViewControllerRepresentableContext<DocumentPickerView>) {
    }
    
    func makeCoordinator() -> DocumentPickerCoordinator {
        DocumentPickerCoordinator(viewModel: homeViewModel, added: $added)
    }
}

class DocumentPickerCoordinator: NSObject, UIDocumentPickerDelegate {
    @ObservedObject var homeViewModel: HomeViewModel
    @Binding var added: Bool

    init(viewModel: HomeViewModel, added: Binding<Bool>) {
        homeViewModel = viewModel
        self._added = added
    }
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        guard let url = urls.first else {
            return
        }
        homeViewModel.addURLS(pickedURL: url)
        added = true
    }
    
}
