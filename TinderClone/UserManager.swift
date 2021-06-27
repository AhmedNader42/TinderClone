//
//  UserManager.swift
//  TinderClone
//
//  Created by ahmed on 25/06/2021.
//

import Foundation
class UserManager: ObservableObject {
    @Published var currentUser: User = User()
    @Published var matches: [Person] = []
    @Published var topPicks: [Person] = []
    init() {
        loadUser()
    }
    
    func loadUser() {
        self.currentUser = User.example
        loadMatches()
        loadTopPicks()
    }
    
    func loadMatches() {
        self.matches = [Person.example, Person.example2, Person.example3]
    }
    
    func loadTopPicks() {
        self.topPicks = [Person.example3, Person.example, Person.example2]
    }
}
