//
//  MatchesView.swift
//  TinderClone
//
//  Created by ahmed on 26/06/2021.
//

import SwiftUI

struct MatchesView: View {
    enum LikedTab {
        case likes
        case topPicks
    }
    
    @State private var selectedTab: LikedTab = .likes
    @EnvironmentObject var userMng: UserManager
    @EnvironmentObject var appMng: AppStateManager
    
    private var buttonText: String {
        if selectedTab == .likes {
            return "See who liked you"
        } else {
            return "Unlock more top picks"
        }
    }
    
    private func buttonAction() {
        appMng.showPurchaseScreen()
    }
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                HStack {
                    Spacer()

                    Button(action: { selectedTab = .likes }, label: {
                        Text("\(userMng.matches.count) Likes")
                            .font(.system(size: 22, weight: .semibold))
                            .if(selectedTab == .topPicks) {
                                $0.foregroundColor(Color.textPrimary)
                            }
                    })
                    .buttonStyle(PlainButtonStyle())
                    Spacer()
                    Button(action: { selectedTab = .topPicks }, label: {
                        Text("\(userMng.topPicks.count) Top Picks")
                            .font(.system(size: 22, weight: .semibold))
                            .if(selectedTab == .likes) {
                                $0.foregroundColor(Color.textPrimary)
                            }
                    })
                    .buttonStyle(PlainButtonStyle())
                    Spacer()
                }
                
                Divider()
                    .padding(.vertical, 14)
                
                if selectedTab == .likes {
                    LikesView()
                } else {
                    TopPicksView()
                }
                
                Spacer()
            }
            
            Button(action: { buttonAction() }, label: {
                Text(buttonText)
                    .padding(.vertical, 14)
                    .padding(.horizontal, 36)
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(.white)
                    .background(Color.yellow)
                    .cornerRadius(30)
            })
            .buttonStyle(PlainButtonStyle())
            .padding(.bottom, 40)
        }
    }
}

struct MatchesView_Previews: PreviewProvider {
    static var previews: some View {
        MatchesView()
            .environmentObject(UserManager())
            .environmentObject(AppStateManager())
    }
}
