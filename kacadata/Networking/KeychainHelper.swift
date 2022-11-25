//
//  KeychainHelper.swift
//  kacadata
//
//  Created by Ridho Saputra on 14/11/22.
//

import Foundation

final class KeychainHelper {
    
    static let standard = KeychainHelper()
    private init() {}
    
    func save(_ data: Data, type: String) {
        let query = [
            kSecValueData: data,
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: type,
            kSecAttrAccount: "moka"
        ] as CFDictionary
        
        let status = SecItemAdd(query, nil)
        
        if status != errSecDuplicateItem {
            let query = [
                kSecClass: kSecClassGenericPassword,
                kSecAttrService: type,
                kSecAttrAccount: "moka"
            ] as CFDictionary
            
            let updatedData = [kSecValueData: data] as CFDictionary
            SecItemUpdate(query, updatedData)
        }
        
//        if status != errSecSuccess {
//            debugPrint("Error : \(status)")
//        }
    }
    
    func read(type: String) -> Data? {
        let query = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: type,
            kSecAttrAccount: "moka",
            kSecReturnData: true
        ] as CFDictionary
        
        var result: AnyObject?
        SecItemCopyMatching(query, &result)
        
        return (result as? Data)
    }
    
    func delete(type: String) {
        let query = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: type,
            kSecAttrAccount: "moka",
        ] as CFDictionary
        
        SecItemDelete(query)
    }
}
