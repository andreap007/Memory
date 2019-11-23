//
//  Memory.swift
//  Memory
//
//  Created by Andrea on 12/11/2019.
//  Copyright © 2019 Andrea Peric. All rights reserved.
//

import Foundation
import GameplayKit

class Memory {
    
    var memoryCard = [Card]()
    
    var score = 0
    var flips = 0
    
    var flags = ["🇨🇦","🇯🇵","🇪🇸","🇸🇪","🇳🇪","🇬🇵","🇧🇷","🇬🇹","🇸🇿","🇺🇸","🇱🇰",
                 "🇸🇴","🇺🇬","🏴󠁧󠁢󠁳󠁣󠁴󠁿","🇲🇰","🇯🇲","🇭🇷","🇨🇾","🇬🇩","🇹🇰","🇫🇷","🇬🇳","🇴🇲","🇨🇿"]
    
    private var indexOfOnlyOneFacedCard: Int?
    
    func chooseMemoryCard(at index: Int) {
        if !memoryCard[index].isMatchedCard {
            flips += 1
            if let matchIndex = indexOfOnlyOneFacedCard, matchIndex != index {
                if memoryCard[matchIndex].identifier == memoryCard[index].identifier {
                    memoryCard[matchIndex].isMatchedCard = true
                    memoryCard[index].isMatchedCard = true
                    score += 1
                }
                memoryCard[index].isFacedCard = true
                indexOfOnlyOneFacedCard = nil
            } else {
                for flipDownCard in memoryCard.indices {
                    memoryCard[flipDownCard].isFacedCard = false
                }
                memoryCard[index].isFacedCard = true
                indexOfOnlyOneFacedCard = index
            }
            
        }
        
    }
    
    func resetCards() {
        
        score = 0
        flips = 0
       
        for index in memoryCard.indices {
            memoryCard[index].isMatchedCard = false
            memoryCard[index].isFacedCard = false
        }
       memoryCard.shuffle()
    }
    
    init (numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            
            var card = Card()
            memoryCard += [card, card]
            memoryCard.shuffle()
            
        }
        
    }
}

extension Array {
    public mutating func shuffle() {
        var temp = [Element]()
        while !isEmpty {
            let i = Int(arc4random_uniform(UInt32(count)))
            let obj = remove(at: i)
            temp.append(obj)
        }
        self = temp
    }
    
}

