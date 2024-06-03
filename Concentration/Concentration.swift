//
//  Concentration.swift
//  Concentration
//
//  Created by Yeliena Khaletska on 03.06.2024.
//

import Foundation

class Concentration
{
    var cards = [Card]()
    private var indexOfOneFaceUpCard: Int?

    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneFaceUpCard, matchIndex != index {
                // check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneFaceUpCard = nil
            } else {
                // either no cards or two cards face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }

                cards[index].isFaceUp = true
                indexOfOneFaceUpCard = index
            }
        }
    }

    init(numberOfPairsOfCards: Int) {
        for _ in 0 ..< numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }

        // TODO: shuffle the cards
    }
}
