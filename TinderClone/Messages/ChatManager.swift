//
//  ChatManager.swift
//  TinderClone
//
//  Created by ahmed on 25/06/2021.
//

import Foundation
import Combine
import UIKit

class ChatManager: ObservableObject {
    
    @Published var messages: [Message] = []
    @Published var keyboardIsShowing: Bool = false
    
    var cancellable: AnyCancellable? = nil
    
    private var person: Person
    
    init(person: Person) {
        self.person = person
        loadMessages()
        setupPublishers()
    }
    
    public func sendMessage(_ message: Message) {
        messages.append(message)
    }
    
    private func loadMessages() {
        self.messages = [Message.exampleSent, Message.exampleReceived]
    }
    
    private func setupPublishers() {
        cancellable = Publishers.Merge(keyboardWillShow, keyboardWillHide)
            .subscribe(on: DispatchQueue.main)
            .assign(to: \.keyboardIsShowing, on: self)
    }
    private let keyboardWillShow = NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)
        .map({_ in true})
    
    private let keyboardWillHide = NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
        .map({_ in false})
    
    deinit {
        cancellable?.cancel()
    }
}
