//
//  ContentView.swift
//  TinderClone
//
//  Created by ahmed on 31/05/2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var manager : AppStateManager = AppStateManager()
    var body: some View {
        MainView()
            .environmentObject(manager)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
