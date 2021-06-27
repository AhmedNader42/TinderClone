//
//  PurchasePopup.swift
//  TinderClone
//
//  Created by ahmed on 27/06/2021.
//

import SwiftUI

struct PurchasePopup: View {
    @Binding var isVisible: Bool
    @State var selectedIndex: Int = 1
    
    let subscriptions: [Subscription] = [
        Subscription.example,
        Subscription.example2,
        Subscription.example3
    ]
    var screen = UIScreen.main.bounds
    
    func processPayment() {
//        let product = subscriptions[selectedIndex]
    }
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                Spacer().frame(height: 40)
                VStack {
                    Text("Get Tinder Gold")
                        .foregroundColor(.yellow)
                        .font(.system(size: 24, weight: .bold))
                    PurchaseSwipePromo()
                        .frame(height: geo.size.height / 3)
                        .padding(.top, -35)
                    
                    HStack {
                        ForEach(subscriptions.indices) { index in
                            let sub = subscriptions[index]
                            PurchaseOptionsView(sub: sub, isSelected: index == selectedIndex)
                                .onTapGesture {
                                    selectedIndex = index
                                }
                        }
                    }
                    
                    Spacer()
                    
                    Button(action: { processPayment() }, label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 45)
                                .foregroundColor(.yellow)
                            Text("Continue")
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight: .heavy))
                        }
                    })
                    .frame(height: 55)
                    .padding(.horizontal, 24)
                    .padding(.top, 12)
                    
                    Button(action: { isVisible = false }, label: {
                        Text("No Thanks")
                            .foregroundColor(.textPrimary)
                            .font(.system(size: 20, weight: .heavy))
                    })
                    .padding(.horizontal, 18)
                    
                }
                .frame(width: geo.size.width)
                .padding(.vertical, 20)
                .background(
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .foregroundColor(.white)
                )
                
                Spacer()
                
                VStack(spacing: 4) {
                    Text("Recurring billing, cancel anytime.")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .semibold))
                    Text("Your purchase will perform transactions on your bank account with the required amount and fees.")
                        .foregroundColor(Color.white.opacity(0.5))
                        .font(.system(size: 14, weight: .semibold))
                        .multilineTextAlignment(.center)
                }
                .padding(.bottom, 20)
                .padding(.horizontal, 4)
                
                Spacer()
            }
            .background(Color.black.edgesIgnoringSafeArea(.all))
        }
        .frame(height: screen.height)
    }
}

struct PurchasePopup_Previews: PreviewProvider {
    static var previews: some View {
        PurchasePopup(isVisible: .constant(true))
    }
}
