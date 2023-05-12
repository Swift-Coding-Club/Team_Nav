//
//  Bundle+Ext.swift
//  Nav
//
//  Created by 박재경 on 2022/11/03.
//
import Foundation

extension Bundle {
    func decode<T: Decodable>(file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Could not find \(file) in project")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Could not find \(file) in project")
        }
        
        let decoder = JSONDecoder()
        guard let loadData = try? decoder.decode(T.self, from:data) else {
            fatalError("Could not find \(file) in project")
        }
        
        return loadData
    }
}
