//
//  HomeViewModel.swift
//  kacadata
//
//  Created by Ridho Saputra on 18/10/22.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published
    var downloading = false // Downloading indicator if doc is stored in icloud
    @Published
    var selectedUrl: URL? // URL of selected Document to view
    @Published
    var documents: [Document] = [] // List of documents
    @Published
    var progressing = false // Indicates document is being added
    @Published
    var showStatus: Bool = false
    @Published
    var status: String = "Trouble in adding the file right now" // Status of adding file
    
    private var localHandler = LocalHandler()
    private var cloudHandler = CloudHandler()
    private let docCoreDataHandler = CoreDataHandler()
    
    @Published
    var token: String = ""
    @Published
    var error: String = ""
    @Published
    var showAlert: Bool = false
    
    private var subscriptions: Set<AnyCancellable> = []
    private var dataManager: ServiceProtocol
    private let debounceInterval: DispatchQueue.SchedulerTimeType.Stride = .seconds(1)
    
    init() {
        self.dataManager = Service.shared
        self.documents = docCoreDataHandler.listOfDocuments()
        self.documents = documents.sorted(by: {($0.name ?? "") < ($1.name ?? "")})
        DispatchQueue.global(qos: .userInitiated).async {[self] in
            if isICloudContainerAvailable() == true {
                cloudHandler.startupActivities()
                localHandler.startupActivities()
            } else {
                localHandler.startupActivities()
            }
        }
    }
    
    func getToken(code: String) {
        dataManager.getAccessToken(code)
            .sink {[weak self] completion in
                guard let self = self else { return }
                switch completion {
                case .failure(let error):
                    self.error = error.errorDescription ?? ""
                    print(self.error)
                case .finished:
                    break
                }
            } receiveValue: {[weak self] value in
                guard let self = self else { return }
                self.token = value.accessToken
                KeychainHelper.standard.save(Data(self.token.utf8))
            }
            .store(in: &subscriptions)
    }
    
    func createAlert( with error: NetworkError ) {
        self.error = error.backendError == nil ? error.initialError.localizedDescription : error.backendError!.message
        self.showAlert = true
    }
    
    
    /// Checks if iCloud account is setup
    /// - Returns: true if setup is done
    func isICloudContainerAvailable() -> Bool {
        if FileManager.default.ubiquityIdentityToken != nil {
            return true
        } else {
            return false
        }
    }
    
    /// Gives the URL of selected Document if present in Local or download the document from iCloud
    /// - Parameter doc: selected Document
    /// - Returns: URL of Document
    func generateUrl(of doc: Document) -> URL? {
        
        if (URL(string: doc.url ?? "")?.fileExists() ?? false) {
            return URL(string: doc.url ?? "")
        }
        if doc.location == "Cloud" {
            let url = cloudHandler.giveURL(file: doc.name ?? "file")
            downloadFromCloud(url: url)
            return url
        } else {
            let url = localHandler.giveURL(file: doc.name ?? "file")
            if url?.fileExists() ?? false {
                return url
            }
            status = "Document does not belong to this device"
            showStatus = true
            return nil
        }
    }
    
    /// Start and monitor download of document from iCloud
    /// - Parameter url: iCloud URL
    func downloadFromCloud(url: URL?) {
        do {
            if let url = url, (url.fileExists() == false && downloading == false) {
                try FileManager.default.startDownloadingUbiquitousItem(at: url)
                downloading = true
                DispatchQueue.global(qos: .background).async {
                    var t = url.fileExists()
                    while t == false {
                        t = url.fileExists()
                        
                    }
                    DispatchQueue.main.async {
                        self.downloading = false
                    }
                }
            }
        } catch  {
            print(error)
        }
    }
    /// Copies the document to local based on user preference
    /// - Parameters:
    ///   - pickedURL: picked document URL
    func addURLS(pickedURL: URL) {
        DispatchQueue.global(qos: .userInteractive).async {[self] in
            DispatchQueue.main.async {
                self.progressing = true
            }
            let res = localHandler.copyDocumentsToLocalDirectory(pickedURL: pickedURL)
            
            if res == nil {
                DispatchQueue.main.async {
                    if self.showStatus != true {
                        self.status = "Unable to add the file right now"
                        self.showStatus = true
                    }
                }
            } else {
                DispatchQueue.main.async {
                    let storage = "Local"
                    if let i = self.documents.firstIndex(where: {$0.name == res?.lastPathComponent}) {
                        self.documents[i].size = res?.byteCount(size: Double(res?.fileSize ?? 0))
                        self.status = "File Replaced Successfully With Latest Version into \(storage) storage"
                    } else {
                        let doc = self.docCoreDataHandler.addDocument(title: res?.lastPathComponent ?? "", location: storage, url: res?.absoluteString ?? "", size: res?.byteCount(size: Double(res?.fileSize ?? 0)) ?? "Zero KB")
                        if let doc = doc {
                            self.documents.append(doc)
                            self.docCoreDataHandler.save()
                            self.status = "File Added Successfully into \(storage) storage"
                        }
                    }
                    self.showStatus = true
                }
            }
            DispatchQueue.main.async {
                self.progressing = false
            }
        }
    }
    
    /// Remove Documents if present in local of device or icloud
    /// - Parameter index: index of documents
    func removeUrls(from index: IndexSet) {
        for i in index {
            
            if let url = self.generateUrl(of: documents[i]) {
                if documents[i].location == "Local" && !url.fileExists() {
                    status = "File does not belong to this device\nOperation Not Permitted"
                    showStatus = true
                    return
                }
                print(url)
                if downloading == true {
                    status = "File Download is in Progress\n Please try after some time"
                    showStatus = true
                    return
                }
                DispatchQueue.global(qos: .utility).async { [self] in
                    if isICloudContainerAvailable() == false {
                        localHandler.removeUsingUrl(localURL: url)
                    } else {
                        cloudHandler.removeUsingUrl(iCloudUrl: url)
                    }
                }
                DispatchQueue.main.async { [self] in
                    docCoreDataHandler.deleteDocument(doc: documents[i])
                    documents.remove(at: i)
                    docCoreDataHandler.save()
                }
            }
        }
    }
}
