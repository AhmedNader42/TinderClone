//
//  ProfileSwipePromo.swift
//  TinderClone
//
//  Created by ahmed on 08/06/2021.
//

import SwiftUI

struct ProfileSwipePromo: View {
    var action : () -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            TabView() {
                VStack(spacing: 9) {
                    Spacer()
                    Text("Get Tinder Gold")
                        .font(.system(size: 26, weight: .semibold))
                    Text("See who Likes you & More!")
                }
                .padding(.bottom, 64)
                
                VStack(spacing: 9) {
                    Spacer()
                    Text("Easier with more customization.")
                        .font(.system(size: 26, weight: .semibold))
                    Text("Get more exposure")
                }
                .padding(.bottom, 64)
                
                VStack(spacing: 9) {
                    Spacer()
                    Text("Boost your profile")
                        .font(.system(size: 26, weight: .semibold))
                    Text("Get to meet more people!")
                }
                .padding(.bottom, 64)
            }
            .tabViewStyle(PageTabViewStyle())
            
            Button(action: {action()}, label: {
                Text("My TINDER plus")
                    .foregroundColor(.red)
                    .font(.system(size: 18, weight: .semibold))
                    .padding(.vertical, 20)
                    .padding(.horizontal, 50)
                    .background(Color.white)
                    .cornerRadius(30)
                    .shadow(color: Color.gray.opacity(0.2), radius: 10)
            })
            .padding(.bottom, 30)
            
        }
    }
}

struct ProfileSwipePromo_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray.opacity(0.2)
                .edgesIgnoringSafeArea(.all)
            ProfileSwipePromo{
                print("Test")
            }
        }
        .frame(height: 400)
    }
}
