//
//  Logger.swift
//  Shared
//
//  Created by JohyeonYoon on 5/23/25.
//

import Foundation

public func log(_ items: Any..., seperator: String = " ", terminator: String = "\n") {
    #if DEBUG
    print(items, separator: seperator, terminator: terminator)
    #endif
}
