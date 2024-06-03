//
//  Concentration.swift
//  Concentration
//
//  Created by Yeliena Khaletska on 03.06.2024.
//

import Foundation

final class Concentration
{
    var cards = [Card]()
    private var indexOfOneFaceUpCard: Int?

    init(numberOfPairsOfCards: Int) {
        for _ in 0 ..< numberOfPairsOfCards {
            let card = Card()
            self.cards += [card, card]
        }

        // TODO: shuffle the cards
    }

    func chooseCard(at index: Int) {
        if !self.cards[index].isMatched {
            if let matchIndex = indexOfOneFaceUpCard, matchIndex != index {
                // check if cards match
                if self.cards[matchIndex].identifier == cards[index].identifier {
                    self.cards[matchIndex].isMatched = true
                    self.cards[index].isMatched = true
                }
                self.cards[index].isFaceUp = true
                indexOfOneFaceUpCard = nil
            } 
            else {
                // either no cards or two cards face up
                for flipDownIndex in self.cards.indices {
                    self.cards[flipDownIndex].isFaceUp = false
                }

                self.cards[index].isFaceUp = true
                indexOfOneFaceUpCard = index
            }
        }
    }
}
