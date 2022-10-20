//
//  CloudHandler.swift
//  kacadata
//
//  Created by Ridho Saputra on 18/10/22.
//

import Foundation

struct CloudHandler {
    var subfolder: String
    
    init() {
        subfolder = "kacadata"
    }
    
    /// Return the URL of a document
    /// - Parameters:
    ///   - file: name of file
    /// - Returns: URL of file
    func giveURL(file: String) -> URL? {
        guard var iCloudDocumentsURL = FileManager.default.url(forUbiquityContainerIdentifier: "iCloud.com.team16.kacadata")?
            .appendingPathComponent("Documents", isDirectory: true)
            .appendingPathComponent(subfolder, isDirectory: true)
        else {
            return nil
        }
        iCloudDocumentsURL = iCloudDocumentsURL.appendingPathComponent(file , isDirectory: false)
        return iCloudDocumentsURL
    }
    
    /// Copy the document at pickedURL to iCloudURL
    /// - Parameters:
    ///   - pickedURL: URL of picked document
    /// - Returns: Local URL of document
    func copyDocumentsToiCloudDirectory(localDocumentsURL: URL) -> URL? {
        
        guard var iCloudDocumentsURL = FileManager.default.url(forUbiquityContainerIdentifier: "iCloud.com.team16.kacadata")?
            .appendingPathComponent("Documents", isDirectory: true)
            .appendingPathComponent(subfolder, isDirectory: true)
        else {
            return nil
            
        }
        iCloudDocumentsURL = iCloudDocumentsURL.appendingPathComponent(localDocumentsURL.lastPathComponent , isDirectory: false)
        var isDir: ObjCBool = false
        
        if FileManager.default.fileExists(atPath: iCloudDocumentsURL.path, isDirectory: &isDir) {
            do {
                try FileManager.default.removeItem(at: iCloudDocumentsURL)
            }
            catch {
                print(error)
                // Error handling
                print("Error in remove item")
            }
        }
        
        do {
            print(localDocumentsURL.absoluteString)
            guard localDocumentsURL.startAccessingSecurityScopedResource() else {return nil}
            defer {
                localDocumentsURL.stopAccessingSecurityScopedResource()
            }
            
            try FileManager.default.copyItem(at: localDocumentsURL, to: iCloudDocumentsURL)
            return iCloudDocumentsURL
        }
        catch {
            // Error handling
            print(error)
            print("Error in copy item")
        }
        return nil
    }
    
    /// Remove Document at URL
    /// - Parameter localURL: URL of Document to be removed
    func removeUsingUrl(iCloudUrl: URL) {
        do {
            try FileManager.default.removeItem(at: iCloudUrl)
        }
        catch {
            print(error)
            // Error handling
            print("Error in remove item")
        }
    }
    
    /// Create Directories for project to store documents inside it
    /// - Parameter project: name of project
    func startupActivities() {
        createDocumentsDirectory()
        createSubFolderDirectory()
    }
    
    /// Creates ./Documents
    func createDocumentsDirectory() {
        if let iCloudDocumentsURL = FileManager.default.url(forUbiquityContainerIdentifier: "iCloud.com.team16.kacadata")?.appendingPathComponent("Documents", isDirectory: true) {
            if (!FileManager.default.fileExists(atPath: iCloudDocumentsURL.path, isDirectory: nil)) {
                do {
                    try FileManager.default.createDirectory(at: iCloudDocumentsURL, withIntermediateDirectories: true, attributes: nil)
                }
                catch {
                    //Error handling
                    print("Error in creating doc")
                }
            }
        }
    }
    /// Create ./Documents/Learning Objective
    func createSubFolderDirectory() {
        if let iCloudDocumentsURL = FileManager.default.url(forUbiquityContainerIdentifier: "iCloud.com.team16.kacadata")?
            .appendingPathComponent("Documents",isDirectory: true)
            .appendingPathComponent(subfolder,isDirectory: true) {
            if (!FileManager.default.fileExists(atPath: iCloudDocumentsURL.path, isDirectory: nil)) {
                do {
                    try FileManager.default.createDirectory(at: iCloudDocumentsURL, withIntermediateDirectories: true, attributes: nil)
                }
                catch {
                    // Error handling
                    print("Error in creating doc")
                }
            }
        }
    }
}
