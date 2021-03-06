//
//  TopPicksView.swift
//  TinderClone
//
//  Created by ahmed on 25/06/2021.
//

import SwiftUI

struct TopPicksView: View {
    @EnvironmentObject var userMng: UserManager
    @EnvironmentObject var appState: AppStateManager
    
    private var user: User {
        return userMng.currentUser
    }
    
    var body: some View { 
        ScrollView(.vertical, showsIndicators: false) {
            if !user.goldSubscriber {
                Text("Upgrade to Tinder Gold for more top picks.")
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .foregroundColor(.textTitle)
                    .font(.system(size: 16, weight: .medium))
                    .padding(.horizontal, 40)
                    .padding(.vertical, 24)
            }
            
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())],
                      alignment: .center,
                      spacing: nil,
                      pinnedViews: [],
                      content: {
                        ForEach(userMng.topPicks) { person in
                            PersonSquare(person: person, blur: false)
                                .frame(height: 240)
                                .onTapGesture(perform: {
                                    personTapped(person)
                                })
                        }
                      })
                .padding(.horizontal, 6)
             
        }
        
    }
    
    func personTapped (_ person: Person) {
        if user.goldSubscriber {
            appState.showPersonProfile(person)
        } else {
            appState.showPurchaseScreen()
        }
    }
    
}

struct TopPicksView_Previews: PreviewProvider {
    static var previews: some View {
        TopPicksView()
            .environmentObject(UserManager())
            .environmentObject(AppStateManager())
    }
}
