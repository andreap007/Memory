//
//  ViewController.swift
//  Memory
//
//  Created by Andrea on 11/11/2019.
//  Copyright © 2019 Andrea Peric. All rights reserved.
//

import UIKit

class MemoryViewController: UIViewController {
    
  
    var backgroundImage = UIImageView()
 
    var flipCount = 0 { didSet {flipCountLabel.text = "Flips: \(flipCount)"}}
    
    lazy var memoryGame = Memory(numberOfCards: (cardButtons.count + 1) / 2)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setBackground()

  

    }
    
    
    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet weak var flipCountLabel: UILabel!
    

    @IBAction func touchCard(_ sender: UIButton) {
       
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            memoryGame.chooseMemoryCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("Card is not in the cardButtons!")
        }
        
    }
    
    func updateViewFromModel() {
        if cardButtons != nil {
            for index in cardButtons.indices {
                let button = cardButtons[index]
                let card = memoryGame.memoryCard[index]
                
                if card.isFacedCard {
                    button.setTitle(uniqueFlag(for: card), for: UIControl.State.normal)
                    button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                } else {
                    button.setTitle("", for: UIControl.State.normal)
                    button.backgroundColor = card.isMatchedCard ? #colorLiteral(red: 0.9019607843, green: 0.4941176471, blue: 0.1333333333, alpha: 0) : #colorLiteral(red: 0.06318392605, green: 0.2239084244, blue: 0.0671293959, alpha: 0.7730896832)
                }
            }
        }
    }
    
    func setBackground() {
        
        view.addSubview(backgroundImage)
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImage.image = UIImage(named: "background")
        view.sendSubviewToBack(backgroundImage)
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        
    }
    

    
    private var uniqueFlag = [Card: String]()

    func uniqueFlag(for card: Card) -> String {
        
      if uniqueFlag[card] == nil, flags.count > 0 {
            let randomIndex = flags.index(flags.startIndex, offsetBy: flags.count.arc4random)
            uniqueFlag[card] = String(flags.remove(at: randomIndex))
         
        }
        return uniqueFlag[card] ?? "?"
    }


}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
    
}

var flags = ["🇨🇦","🇯🇵","🇪🇸","🇸🇪","🇳🇪","🇬🇵","🇧🇷","🇬🇹","🇸🇿","🇺🇸","🇱🇰",
             "🇸🇴","🇺🇬","🏴󠁧󠁢󠁳󠁣󠁴󠁿","🇲🇰","🇯🇲","🇭🇷","🇨🇾","🇬🇩","🇹🇰","🇫🇷","🇬🇳","🇴🇲","🇨🇿"]

extension Array {

public mutating func shuffle() {
    var temporary = [Element]()
    while !isEmpty {
        let i = Int(arc4random_uniform((UInt32(count))))
        let object = remove(at: i)
        temporary.append(object)
    }
    self = temporary
 
}
    
}






