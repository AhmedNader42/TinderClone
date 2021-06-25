//
//  MessageThread.swift
//  TinderClone
//
//  Created by ahmed on 24/06/2021.
//

import Foundation
struct MessagePreview: Hashable {
    var person : Person
    var lastMessage: String
}

extension MessagePreview{
    static let example = MessagePreview(person: Person.example, lastMessage: "Hello there, How has it been so far? We really all miss you and want to get a chance to see you again. Let us meet soon.")
    
    static let examples: [MessagePreview] = [
        MessagePreview(person: Person.example, lastMessage: "Hello there, How has it been so far? We really all miss you and want to get a chance to see you again. Let us meet soon."),
        MessagePreview(person: Person.example2, lastMessage: "Hi, We were reaching out to you so that we can get to know you better"),
        MessagePreview(person: Person.example3, lastMessage: "Good evening, Are we still on for our date tonight? It's really close right now.")]
}
