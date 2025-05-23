//
//  Data+Extension.swift
//  Shared
//
//  Created by JohyeonYoon on 5/23/25.
//

import Foundation

public extension Data {
    
    func logData() {
        do {
            let json = try JSONSerialization.jsonObject(with: self, options: [])
            let data = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
            guard let jsonString = String(data: data, encoding: .utf8) else {
                log("Inavlid data")
                return
            }
            log(jsonString)
        } catch {
            log("Error: \(error.localizedDescription)")
        }
    }
}
