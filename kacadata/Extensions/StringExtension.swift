//
//  StringExtension.swift
//  kacadata
//
//  Created by Ridho Saputra on 27/10/22.
//

import Foundation

extension String {
    
    func fileName() -> String {
        return URL(fileURLWithPath: self).deletingPathExtension().lastPathComponent
    }
    
    func fileExtension() -> String {
        return URL(fileURLWithPath: self).pathExtension
    }
}

