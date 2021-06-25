//
//  Person.swift
//  TinderClone
//
//  Created by ahmed on 24/06/2021.
//

import Foundation
struct Person: Hashable {
    var name: String
    var imageURLS: [URL]
}

extension Person {
    static let example = Person(name: "Alex", imageURLS: [URL(string: "https://picsum.photos/400/300")!])
}
