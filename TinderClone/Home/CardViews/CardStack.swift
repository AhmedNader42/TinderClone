//
//  CardStack.swift
//  TinderClone
//
//  Created by ahmed on 28/06/2021.
//

import SwiftUI

struct CardStack: View {
    var people : [Person]
    @State private var fullscreenMode: Bool = false
    
    let screen = UIScreen.main.bounds
    var body: some View {
        ZStack {
            ForEach(people) { person in
                CardView(person: person, fullscreenMode: $fullscreenMode)
            }
        }
        .frame(width: screen.width, height: fullscreenMode ? screen.height : 550)
    }
}

struct CardStack_Previews: PreviewProvider {
    static var previews: some View {
        CardStack(people: [Person.example, Person.example2, Person.example3])
    }
}
