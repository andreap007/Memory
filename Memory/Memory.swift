//
//  Memory.swift
//  Memory
//
//  Created by Andrea on 12/11/2019.
//  Copyright © 2019 Andrea Peric. All rights reserved.
//

import Foundation

class Memory {
    
    var memoryCard = [Card]()

    
    private var indexOfOnlyOneFacedCard: Int?
    
    func chooseMemoryCard(at index: Int) {
       if !memoryCard[index].isMatchedCard {
           if let matchIndex = indexOfOnlyOneFacedCard, matchIndex != index {
                if memoryCard[matchIndex].identifier == memoryCard[index].identifier {
                    memoryCard[matchIndex].isMatchedCard = true
                    memoryCard[index].isMatchedCard = true
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
    
    init (numberOfCards: Int) {
       
        for _ in 1...numberOfCards {
            
            let card = Card()
            memoryCard += [card, card]
        }
        
        //TODO: Shuffle the cards
    
    }
  }



