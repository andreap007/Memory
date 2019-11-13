//
//  Card.swift
//  Memory
//
//  Created by Andrea on 12/11/2019.
//  Copyright © 2019 Andrea Peric. All rights reserved.
//

import Foundation

struct Card: Hashable {
    
    var hashValue: Int { return identifier}
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    var isFacedCard = false
    var isMatchedCard = false
    var identifier: Int
    
    static var uniqueIdentifier = 0
    
    static func getIdentifier() -> Int {
        
        uniqueIdentifier += 1
        return uniqueIdentifier
    }
    
    init () {
        self.identifier = Card.getIdentifier()
    }
}
