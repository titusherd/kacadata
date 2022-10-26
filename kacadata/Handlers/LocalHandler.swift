//
//  LocalHandle.swift
//  kacadata
//
//  Created by Ridho Saputra on 18/10/22.
//

import Foundation

struct LocalHandler {
    var subfolder: String
    var rootUrl: URL?
    
    init() {
        subfolder = "kacadata"
        do {
            if let fileManagerUrl = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: "group.com.team16.kacadata") {
                rootUrl = fileManagerUrl
            } else {
                rootUrl = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            }
        } catch  {
            print(error)
        }
    }
    
    /// Return the URL of a document
    /// - Parameters:
    ///   - file: name of file
    /// - Returns: URL of file
    func giveURL(file: String) -> URL? {
        guard var url =
                rootUrl?.appendingPathComponent(subfolder, isDirectory: true)
        else {
            return nil
        }
        url = url.appendingPathComponent(file , isDirectory: false)
        return url
    }
    
    /// Copy the document at pickedURL to localURL
    /// - Parameters:
    ///   - pickedURL: URL of picked document
    /// - Returns: Local URL of document
    func copyDocumentsToLocalDirectory(pickedURL: URL) -> URL? {
        guard let url = rootUrl else {
            return nil
        }
        do {
            var destinationDocumentsURL: URL = url
            
            destinationDocumentsURL = destinationDocumentsURL
                .appendingPathComponent(subfolder,isDirectory: true)
                .appendingPathComponent(pickedURL.lastPathComponent)
            var isDir: ObjCBool = false
            if FileManager.default.fileExists(atPath: destinationDocumentsURL.path, isDirectory: &isDir) {
                try FileManager.default.removeItem(at: destinationDocumentsURL)
            }
            guard pickedURL.startAccessingSecurityScopedResource() else {print("problem");return nil}
            defer {
                pickedURL.stopAccessingSecurityScopedResource()
            }
            try FileManager.default.copyItem(at: pickedURL, to: destinationDocumentsURL)
            print(FileManager.default.fileExists(atPath: destinationDocumentsURL.path))
            return destinationDocumentsURL
        } catch  {
            print(error)
        }
        return nil
    }
    
    /// Remove Document at URL
    /// - Parameter localURL: URL of Document to be removed
    func removeUsingUrl(localURL: URL) {
        do {
            try FileManager.default.removeItem(at: localURL)
        }
        catch {
            print(error)
            // Error handling
            print("Error in remove item")
        }
    }
    
    /// Create Directories  to store documents inside it
    func startupActivities() {
        createSubFolderDirectory()
    }
    
    /// Create ./Documents/Learning Objective
    func createSubFolderDirectory() {
        guard let url = rootUrl else {
            return
        }
        let newURL = url
            .appendingPathComponent(subfolder,isDirectory: true)
        
        if (!FileManager.default.fileExists(atPath: newURL.path, isDirectory: nil)) {
            do {
                try FileManager.default.createDirectory(at: newURL, withIntermediateDirectories: true, attributes: nil)
            }
            catch {
                // Error handling
                print("Error in creating doc")
            }
        }
    }
}
