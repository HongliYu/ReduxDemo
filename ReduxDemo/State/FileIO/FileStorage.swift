//
//  FileStorage.swift
//  ReduxDemo
//
//  Created by Hongli Yu on 2020/2/16.
//  Copyright © 2020 Hongli Yu. All rights reserved.
//

import Foundation

@propertyWrapper
struct FileStorage<T: Codable> {
    
    var value: T?
    
    let directory: FileManager.SearchPathDirectory
    let fileName: String
    
    let queue = DispatchQueue(label: UUID().uuidString)
    
    init(directory: FileManager.SearchPathDirectory, fileName: String) {
        value = try? FileHelper.loadJSON(from: directory, fileName: fileName)
        self.directory = directory
        self.fileName = fileName
    }
    
    var wrappedValue: T? {
        set {
            value = newValue
            let directory = self.directory
            let fileName = self.fileName
            queue.async {
                if let value = newValue {
                    try? FileHelper.writeJSON(value, to: directory, fileName: fileName)
                } else {
                    try? FileHelper.delete(from: directory, fileName: fileName)
                }
            }
        }
        get { value }
    }
    
}
