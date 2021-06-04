//
//  MainView.swift
//  TinderClone
//
//  Created by ahmed on 31/05/2021.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ZStack {
            Color(.systemGray6)
                .opacity(0.35)
                .edgesIgnoringSafeArea(.vertical)
            VStack {
                HStack {
                    TabBarButtonView(type: .fire){
                        print("1")
                    }
                    TabBarButtonView(type: .star){
                        print("2")
                    }
                    TabBarButtonView(type: .message){
                        print("3")
                    }
                    TabBarButtonView(type: .profile){
                        print("4")
                    }
                    
                    
                }
                .frame(height: 100)
                Spacer()
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}


