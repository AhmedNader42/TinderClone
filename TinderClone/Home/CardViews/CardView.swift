//
//  CardView.swift
//  TinderClone
//
//  Created by ahmed on 27/06/2021.
//

import SwiftUI

struct CardView: View {
    @State var person: Person
    @Binding var fullscreenMode: Bool
    let screenCutoff = (UIScreen.main.bounds.width / 2) * 0.8
    
    @Namespace var imageNameSpace
    
    var body: some View {
        GeometryReader { geo in
            if fullscreenMode {
                FullscreenView(person: person, fullscreenMode: $fullscreenMode, namespace: imageNameSpace)
                    .animation(.easeOut(duration: 0.2))
            } else {
                CardViewScroller(fullscreenMode: $fullscreenMode, person: person)
                    .animation(.easeOut(duration: 0.2))
                    .frame(width: geo.size.width - 20, height: geo.size.height)
                    .padding(.leading, 10)
                    .matchedGeometryEffect(id: "image\(person.id)", in: imageNameSpace)
                    .offset(x: person.x, y: person.y)
                    .rotationEffect(.degrees(person.degree))
                    .gesture(DragGesture()
                        .onChanged { value in
                            withAnimation(.default) {
                                person.x = value.translation.width
                                person.y = value.translation.height
                                withAnimation {
                                    person.degree = Double((value.translation.width / 25) * -1)
                                }
                            }
                        }
                        .onEnded { value in
                            withAnimation(.interpolatingSpring(mass: 1.0, stiffness: 50, damping: 10, initialVelocity: 0)) {
                                let width = value.translation.width

                                if width >= 0, width <= screenCutoff {
                                    // Snap back to middle
                                    person.x = 0
                                    person.y = 0
                                    person.degree = 0
                                } else if width <= -1, width >= -screenCutoff {
                                    // Snap back to middle
                                    person.x = 0
                                    person.y = 0
                                    person.degree = 0
                                } else if width > screenCutoff {
                                    // Swipe right
                                    person.x = 500
                                    person.degree = 12
                                } else if width < screenCutoff {
                                    // Swipe left
                                    person.x = -500
                                    person.degree = -12
                                }
                            }
                        }
                    )
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(person: Person.example, fullscreenMode: .constant(true))
        CardView(person: Person.example, fullscreenMode: .constant(false))
    }
}
