//
//  ContentView.swift
//  TinderClone
//
//  Created by ahmed on 31/05/2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var appStateMng : AppStateManager = AppStateManager()
    @ObservedObject var userMng : UserManager = UserManager()
    var body: some View {
        MainView()
            .environmentObject(appStateMng)
            .environmentObject(userMng)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
