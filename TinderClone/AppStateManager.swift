//
//  AppStateManager.swift
//  TinderClone
//
//  Created by ahmed on 05/06/2021.
//

import Foundation

class AppStateManager: ObservableObject {
    @Published var selectedTab: TabBarButtonType = .fire
}
