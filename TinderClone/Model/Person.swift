//
//  Person.swift
//  TinderClone
//
//  Created by ahmed on 24/06/2021.
//

import SwiftUI

struct Person: Hashable, Identifiable {
    var id: String = UUID().uuidString
    var name: String
    var imageURLS: [URL]
    var age: Int
    var bio: String

    var distance: Int
    var bioLong: String

    // Card manipulation
    var x: CGFloat = 0.0
    var y: CGFloat = 0.0
    var degree: Double = 0.0
}

extension Person {
    static let example = Person(name: "Alex", imageURLS: [
        URL(string: "https://picsum.photos/400/300")!,
        URL(string: "https://picsum.photos/400/301")!,
        URL(string: "https://picsum.photos/400/302")!,
        URL(string: "https://picsum.photos/400/303")!,

    ], age: 20, bio: "Dog Lover", distance: 10, bioLong: "I really am a big lover of Dogs and they make up my world. They are wonder wonder creatures and you have to be really into them if you swipe this profile.")
    
    
    static let example2 = Person(name: "Merry", imageURLS: [
        URL(string: "https://picsum.photos/400/300")!,
        URL(string: "https://picsum.photos/400/301")!,
        URL(string: "https://picsum.photos/400/302")!,
        URL(string: "https://picsum.photos/400/303")!,

    ], age: 30, bio: "Cat Lover", distance: 25, bioLong: "I really am a big lover of Cats and they make up my world. They are wonder wonder creatures and you have to be really into them if you swipe this profile.")
    
    
    static let example3 = Person(name: "Kane", imageURLS: [
        URL(string: "https://picsum.photos/400/300")!,
        URL(string: "https://picsum.photos/400/301")!,
        URL(string: "https://picsum.photos/400/302")!,
        URL(string: "https://picsum.photos/400/303")!,

    ], age: 40, bio: "Butter Lover", distance: 200, bioLong: "I really am a big lover of Butter and it makes up my world")
}
