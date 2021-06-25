//
//  Message.swift
//  TinderClone
//
//  Created by ahmed on 24/06/2021.
//

import Foundation
struct Message: Hashable {
    var content : String
    var person : Person? = nil
    
    var fromCurrentUser: Bool {
        return person == nil
    }
}


extension Message{
    static let exampleSent = Message(content: "Hello Sent")
    static let exampleReceived = Message(content: "Hello Received", person: Person.example)
}
