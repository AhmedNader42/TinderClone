//
//  UserManager.swift
//  TinderClone
//
//  Created by ahmed on 25/06/2021.
//

import Foundation
class UserManager: ObservableObject {
    @Published var currentUser: User = User(name: "")
    @Published var matches: [Person] = []
    init() {
        loadUser()
    }
    
    func loadUser() {
        self.currentUser = User.example
        loadMatches()
    }
    
    func loadMatches() {
        self.matches = [Person.example, Person.example2, Person.example3]
    }
}
