//
//  HomeView.swift
//  TinderClone
//
//  Created by ahmed on 28/06/2021.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var userMng: UserManager
    @EnvironmentObject var appMng: AppStateManager
    
    var body: some View {
        VStack {
            CardStack(people: userMng.cardPeople)
            Spacer()
            
            HStack {
                CircleButtonView(type: .back) {
                    appMng.showPurchaseScreen()
                }
                Spacer()
                
                CircleButtonView(type: .no) {
                    if let person = userMng.cardPeople.last {
                        userMng.swipe(person, direction: .nope)
                    }
                }
                Spacer()
                CircleButtonView(type: .star) {
                    if let person = userMng.cardPeople.last {
                        if userMng.currentUser.goldSubscriber {
                            userMng.superLike(person)
                        } else {
                            appMng.showPurchaseScreen()
                        }
                    }
                }
                
                Spacer()
                
                CircleButtonView(type: .heart) {
                    if let person = userMng.cardPeople.last {
                        userMng.swipe(person, direction: .like)
                    }
                }
                
                Spacer()
                CircleButtonView(type: .lightning) {
                    appMng.showPurchaseScreen()
                }
                Spacer()
            }
            .frame(height: 50)
            .padding(.horizontal)
            .padding(.vertical, 25)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(UserManager())
            .environmentObject(AppStateManager())
    }
}
