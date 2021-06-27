//
//  Subscription.swift
//  TinderClone
//
//  Created by ahmed on 27/06/2021.
//

import Foundation
struct Subscription: Identifiable {
    let id = UUID()
    var month: Int
    var monthlyCost: Double
    var totalCost: Double
    var savePercent: Int?
    var tagLine: TagLine = .none
    
    enum TagLine: String {
        case mostPopular = "MOST POPULAR"
        case bestValue = "BEST VALUE"
        case none
    }
}

extension Subscription {
    static let example = Subscription(month: 6,
                                      monthlyCost: 15.00,
                                      totalCost: 89.99,
                                      savePercent: 50,
                                      tagLine: .bestValue)
    
    static let example2 = Subscription(month: 3,
                                      monthlyCost: 20.00,
                                      totalCost: 59.99,
                                      savePercent: 3,
                                      tagLine: .mostPopular)
    
    static let example3 = Subscription(month: 1,
                                      monthlyCost: 29.9,
                                      totalCost: 29.99)
}
