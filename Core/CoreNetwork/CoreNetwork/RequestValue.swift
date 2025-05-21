//
//  RequestValue.swift
//  CoreNetwork
//
//  Created by JohyeonYoon on 4/22/25.
//

import Foundation

public protocol RequestValue {
    func toQueryParam() -> [String: Any]
}

public protocol Paginatable {
    var page: Int { get }
    var perPage: Int { get }
}
