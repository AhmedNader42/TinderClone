//
//  UserManager.swift
//  TinderClone
//
//  Created by ahmed on 25/06/2021.
//

import Foundation
class UserManager: ObservableObject {
    @Published var currentUser = User()
    @Published var matches: [Person] = []
    @Published var topPicks: [Person] = []
    @Published var cardPeople: [Person] = []
    
    init() {
        loadUser()
    }
    
    func loadUser() {
        currentUser = User.example
        loadMatches()
        loadTopPicks()
        loadCardPeople()
    }
    
    func loadMatches() {
        matches = [Person.example, Person.example2, Person.example3]
    }
    
    func loadTopPicks() {
        topPicks = [Person.example3, Person.example, Person.example2]
    }
    
    func loadCardPeople() {
        cardPeople = [Person.example3, Person.example, Person.example2]
    }
    
    func swipe(_ person: Person, direction: SwipeDirection) {
        cardPeople.removeLast()
    }
    
    func superLike(_ person: Person) {
        cardPeople.removeLast()
    }
}

enum SwipeDirection {
    case like
    case nope
}
