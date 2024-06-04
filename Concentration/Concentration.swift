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
    var flipCount = 0
    private var indexOfOneFaceUpCard: Int?

    init(numberOfPairsOfCards: Int) {
        for _ in 0 ..< numberOfPairsOfCards {
            let card = Card()
            self.cards += [card, card]
        }

        self.cards.shuffle()
    }

    func chooseCard(at index: Int) {
        self.flipCount += 1
        if !self.cards[index].isMatched {
            // find an index of previously chosen card
            // and make sure that it is not the same as current chosen card
            if let matchIndex = indexOfOneFaceUpCard, matchIndex != index {
                // check if cards match
                if self.cards[matchIndex].identifier == self.cards[index].identifier {
                    setCardToMatched(at: matchIndex)
                    setCardToMatched(at: index)
                }
                indexOfOneFaceUpCard = nil
            } 
            else {
                // either no cards or two cards face up
                turnAllFaceDown()
                indexOfOneFaceUpCard = index
            }

            self.cards[index].isFaceUp = true
        }
    }

    private func setCardToMatched(at index: Int) {
        self.cards[index].isMatched = true
    }

    private func turnAllFaceDown() {
        self.cards.indices.forEach { self.cards[$0].isFaceUp = false }
    }
}
