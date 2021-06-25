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
    var bio: String
}

extension Person {
    static let example = Person(name: "Alex", imageURLS: [URL(string: "https://picsum.photos/400/300")!], bio: "Dog Lover")
    static let example2 = Person(name: "Merry", imageURLS: [URL(string: "https://picsum.photos/400/302")!], bio: "Cat Lover")
    static let example3 = Person(name: "Kane", imageURLS: [URL(string: "https://picsum.photos/400/301")!], bio: "Butter Lover")
}
