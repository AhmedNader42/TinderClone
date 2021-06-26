//
//  Person.swift
//  TinderClone
//
//  Created by ahmed on 24/06/2021.
//

import Foundation
struct Person: Hashable, Identifiable {
    var id: String = UUID().uuidString
    var name: String
    var imageURLS: [URL]
    var age: Int
    var bio: String
}

extension Person {
    static let example = Person(name: "Alex", imageURLS: [URL(string: "https://picsum.photos/400/300")!], age: 20, bio: "Dog Lover")
    static let example2 = Person(name: "Merry", imageURLS: [URL(string: "https://picsum.photos/400/302")!], age: 30, bio: "Cat Lover")
    static let example3 = Person(name: "Kane", imageURLS: [URL(string: "https://picsum.photos/400/301")!], age: 40, bio: "Butter Lover")
}
