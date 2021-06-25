//
//  MessageListViewModel.swift
//  TinderClone
//
//  Created by ahmed on 25/06/2021.
//

import Foundation

class MessageListViewModel: ObservableObject {
    @Published var messagePreviews: [MessagePreview] = []
    
    init() {
        loadPreviews()
    }
    
    func loadPreviews() {
        self.messagePreviews = MessagePreview.examples
        // Networking to load message previews from server.
    }
}
