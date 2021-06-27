//
//  PurchaseSwipePromo.swift
//  TinderClone
//
//  Created by ahmed on 27/06/2021.
//

import SwiftUI

struct PurchaseSwipePromo: View {
    var body: some View {
        TabView {
            VStack(spacing: 10) {
                Image(systemName: "thermometer.sun.fill")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 75)
                
                Text("25 people already like you.")
                    .font(.system(size: 18, weight: .semibold))
                
                Text("Match with them instantly.")
            }
            
            VStack(spacing: 10) {
                Image(systemName: "paperplane.circle.fill")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 75)
                
                Text("Instantly know who likes you.")
                    .font(.system(size: 18, weight: .semibold))
                
                Text("Get to knowing people better.")
            }

            VStack(spacing: 10) {
                Image(systemName: "calendar.badge.plus")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 75)
                
                Text("Rank highly for other people to see you.")
                    .font(.system(size: 18, weight: .semibold))
                
                Text("Unique look to your profile.")
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}

struct PurchaseSwipePromo_Previews: PreviewProvider {
    static var previews: some View {
        PurchaseSwipePromo()
            .frame(height: UIScreen.main.bounds.height / 3)
    }
}
