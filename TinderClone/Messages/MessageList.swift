//
//  MessageList.swift
//  TinderClone
//
//  Created by ahmed on 25/06/2021.
//

import SwiftUI

struct MessageListView: View {
    @ObservedObject var vm: MessageListViewModel = MessageListViewModel()
    @State private var searchText: String = ""
    @State private var isEditing: Bool = false
    
    var body: some View {
        ScrollView {
            VStack{
                HStack {
                    TextField("Search here", text: $searchText)
                        .padding(7)
                        .padding(.horizontal, 25)
                        .background(Color.textFieldBackground)
                        .cornerRadius(8)
                        .overlay(
                            HStack{
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(Color.textPrimary)
                                    .font(.system(size: 20, weight: .bold))
                                    .padding(.leading, 4)
                                Spacer()
                            })
                        .padding(.horizontal, 10)
                        .onTapGesture {
                            self.isEditing = true
                        }
                        .animation(.easeIn(duration: 0.25))
                    
                    if isEditing {
                        Button(action: {
                            self.isEditing = false
                            self.searchText = ""
                            self.endEditing(true)
                        }, label: {
                            Text("Cancel")
                        })
                        .padding(.trailing, 10)
                        .transition(.move(edge: .trailing))
                        .animation(.easeIn(duration: 0.25))
                    }
                }
                
                Spacer()
                    .frame(height: 14)
                
                ZStack {
                    VStack {
                        ForEach(vm.messagePreviews.filter({ DisplayPreview($0) }), id:\.self) { preview in
                            NavigationLink(
                                destination: ChatView(person: preview.person),
                                label: {
                                    MessageRowView(preview: preview)
                                })
                                .buttonStyle(PlainButtonStyle())
                                .animation(.easeIn(duration: 0.25))
                                .transition(.slide)
                        }
                    }
                    if isEditing && searchText.isEmpty {
                        Color.white.opacity(0.5)
                    }
                }
                Spacer()
            }
        }.modifier(HideNavigationView())
    }
    
    func DisplayPreview(_ preview: MessagePreview) -> Bool {
        if searchText == "" {
            return true
        }
        
        if preview.person.name.lowercased().contains(searchText.lowercased()) {
            return true
        }
        
        if preview.lastMessage.lowercased().contains( searchText.lowercased()) {
            return true
        }
        
        if preview.person.bio.lowercased().contains(searchText.lowercased()) {
            return true
        }
        
        return false
    }
}

struct MessageListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MessageListView()
        }
    }
}
