//
//  MessageThread.swift
//  TinderClone
//
//  Created by ahmed on 24/06/2021.
//

import Foundation
struct MessagePreview {
    var person : Person
    var lastMessage: String
}

extension MessagePreview{
    static let example = MessagePreview(person: Person.example, lastMessage: "Hello there")
}
