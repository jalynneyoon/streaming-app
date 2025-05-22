//
//  Program.swift
//  HomeFeature
//
//  Created by JohyeonYoon on 5/20/25.
//

import Foundation
import CoreUI

public struct Program: Identifiable, Equatable {
    public var id: String
    var title: String
    var badge: BadgeType?
    var imageString: String?
}
