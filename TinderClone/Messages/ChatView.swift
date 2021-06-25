//
//  ChatView.swift
//  TinderClone
//
//  Created by ahmed on 25/06/2021.
//

import SwiftUI

struct ChatView: View {
    @ObservedObject var chatMng: ChatManager
    
    @State private var typingMsg: String = ""
    @State private var scrollProxy: ScrollViewProxy? = nil
    
    private var person: Person
    
    init(person: Person){
        self.person = person
        self.chatMng = ChatManager(person: person)
    }
    
    var body: some View {
        
        ZStack(alignment: .top) {
            VStack {
                Spacer().frame(height: 60)
                ScrollView(.vertical, showsIndicators: false, content: {
                    ScrollViewReader { proxy in
                        LazyVStack {
                            ForEach(chatMng.messages.indices, id: \.self) { messageIndex in
                                let msg = chatMng.messages[messageIndex]
                                MessageView(message: msg)
                                    .id(messageIndex)
                            }
                        }
                        .onAppear(perform: {
                            scrollProxy = proxy
                        })
                    }
                })
                
                ZStack(alignment: .trailing) {
                    Color.textFieldBackground
                    TextField("Type a message...", text: $typingMsg)
                        .foregroundColor(Color.textPrimary)
                        .textFieldStyle(PlainTextFieldStyle())
                        .frame(height: 45)
                        .padding(.horizontal)
                    Button(action: { sendMessage() }, label: {
                        Text("Send")
                    })
                    .padding(.horizontal)
                    .foregroundColor(typingMsg.isEmpty ? Color.textPrimary : Color.blue)
                }
                .frame(height: 40)
                .cornerRadius(20)
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray.opacity(0.3), lineWidth: 1))
                .padding(.horizontal)
                .padding(.bottom)
                
            }
            ChatViewHeader(name: self.person.name, imageURL: self.person.imageURLS.first) {
                //
            }
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .onChange(of: chatMng.keyboardIsShowing, perform: { value in
            if value {
                scrollToBottom()
            }
        })
        .onChange(of: chatMng.messages, perform: { _ in
            scrollToBottom()
        })
    }
    
    func sendMessage() {
        chatMng.sendMessage(Message(content: typingMsg))
        typingMsg = ""
    }
    
    func scrollToBottom() {
        withAnimation {
            scrollProxy?.scrollTo(chatMng.messages.count - 1, anchor: .bottom)
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(person: Person.example)
    }
}
