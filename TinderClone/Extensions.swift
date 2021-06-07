//
//  Extensions.swift
//  TinderClone
//
//  Created by ahmed on 06/06/2021.
//

import SwiftUI

extension View {
    @ViewBuilder
    func `if`<Transform: View>(_ condition: Bool, transform: (Self) -> Transform) -> some View {
        if condition{
            transform(self)
        } else {
            self
        }
    }
}
