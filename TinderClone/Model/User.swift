//
//  User.swift
//  TinderClone
//
//  Created by ahmed on 25/06/2021.
//

import Foundation
struct User {
    var name: String = ""
    var goldSubscriber: Bool = false
    var imageURLS: [URL] = []
    var age: Int = 0
    var bio: String = ""
    var profileTip: String = ""
}

extension User {
    static let example = User(name: "Ahmed", goldSubscriber: false, imageURLS: [URL(string: "https://picsum.photos/400/300")!], age: 25, bio: "Add me for the best rides of your life.", profileTip: "Tip: Add the best photos in your gallery.")
}
