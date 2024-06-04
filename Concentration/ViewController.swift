//
//  ViewController.swift
//  Concentration
//
//  Created by Yeliena Khaletska on 02.06.2024.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet private weak var flipCountLabel: UILabel!
    @IBOutlet private var cardButtons: [UIButton]!

    private lazy var game: Concentration = makeNewGame()
    private var flipCount = 0 {
        didSet {
            self.flipCountLabel.text = "Flips: \(self.flipCount)"
        }
    }

    private static var emojiChoices = ["🧑‍🎓" , "🧑‍🏫", "🧑‍⚖️", "🧑‍🌾", "🧑‍🍳", "🧑‍🔧", "🧑‍🔬", "🧑‍💻", "🧑‍🚀", "🧑‍🚒", "🧑‍✈️", "👮", "🕵️", "💂", "🥷", "👷"] // professions

    private var emoji = [Int : String]()

    @IBAction private func newGameButtonPressed(_ sender: UIButton) {
        self.game = makeNewGame()
        updateUI()
    }

    @IBAction private func touchCard(_ sender: UIButton) {
        self.flipCount += 1
        if let cardIndex = self.cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardIndex)
            updateUI()
        }
    }

    private func makeNewGame() -> Concentration {
        flipCount = 0
        return Concentration(numberOfPairsOfCards: (self.cardButtons.count + 1) / 2)
    }

    private func updateUI() {
        for index in self.cardButtons.indices {
            let button = self.cardButtons[index]
            let card = game.cards[index]

            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = UIColor.white
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? UIColor.clear : UIColor.systemOrange
            }
        }
    }

    private func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, Self.emojiChoices.count > 0 {
            let randIndex = Int.random(in: 0..<Self.emojiChoices.count)
            emoji[card.identifier] = Self.emojiChoices.remove(at: randIndex)
        }

        return emoji[card.identifier] ?? "?"
    }
}

