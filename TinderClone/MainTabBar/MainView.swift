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
            return AnyView(Color.red)
        case .star:
            return AnyView(Text("Hello World!"))
        case .message:
            return AnyView(Color.white)
        case .profile:
            return AnyView(ProfileView())
        }
    }
    var body: some View {
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
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(AppStateManager())
    }
}


