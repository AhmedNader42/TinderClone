//
//  User.swift
//  TinderClone
//
//  Created by ahmed on 25/06/2021.
//

import Foundation
struct User {
    var name: String
    var goldSubscriber: Bool = false
}

extension User {
    static let example = User(name: "Ahmed", goldSubscriber: true)
}
