//
//  MainView.swift
//  TinderClone
//
//  Created by ahmed on 31/05/2021.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var appState: AppStateManager

    func switchAppState() -> some View {
        switch appState.selectedTab {
        case .fire:
            return AnyView(HomeView())
        case .star:
            return AnyView(MatchesView())
        case .message:
            return AnyView(MessageListView())
        case .profile:
            return AnyView(ProfileView())
        }
    }

    var body: some View {
        NavigationView {
            ZStack {
                Color(.systemGray6)
                    .opacity(0.35)
                    .edgesIgnoringSafeArea(.vertical)
                VStack {
                    HStack {
                        Spacer()
                        TabBarButtonView(type: .fire)
                        Spacer()
                        TabBarButtonView(type: .star)
                        Spacer()
                        TabBarButtonView(type: .message)
                        Spacer()
                        TabBarButtonView(type: .profile)
                        Spacer()
                    }
                    .frame(height: 100)
                    .padding(.top, 30)
                    switchAppState()
                    Spacer()

                }.edgesIgnoringSafeArea(.vertical)

                if appState.showPurchasePopup {
                    PurchasePopup(isVisible: $appState.showPurchasePopup)
                        .animation(.spring(response: 0.3, dampingFraction: 0.75, blendDuration: 0.5))
                        .transition(.offset(y: 1000))
                }

            }.modifier(HideNavigationView())
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(AppStateManager())
            .environmentObject(UserManager())
    }
}
