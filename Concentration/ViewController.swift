//
//  ViewController.swift
//  Concentration
//
//  Created by Yeliena Khaletska on 02.06.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var newGameButton: UIButton!
    @IBOutlet private weak var flipCountLabel: UILabel!
    @IBOutlet private weak var scoreLabel: UILabel!
    @IBOutlet private var cardButtons: [UIButton]!

    private var game: Concentration!
    private var theme: Theme!
    private var emoji = [Int : String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
    }

    @IBAction private func newGameButtonPressed(_ sender: UIButton) {
        startNewGame()
    }

    @IBAction private func touchCard(_ sender: UIButton) {
        if let cardIndex = self.cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardIndex)
            updateUI()
        }
    }

    private func startNewGame() {
        self.game = Concentration(numberOfPairsOfCards: (self.cardButtons.count + 1) / 2)
        self.theme = .getRandom()
        applyTheme()
        updateUI()
    }

    private func applyTheme() {
        self.flipCountLabel.textColor = self.theme.cardBackColor
        self.scoreLabel.textColor = self.theme.cardBackColor
        self.newGameButton.configuration?.baseForegroundColor = self.theme.cardBackColor
        self.newGameButton.configuration?.baseBackgroundColor = self.theme.cardBackColor
        self.view.backgroundColor = self.theme.backgroundColor
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
                button.backgroundColor = card.isMatched ? UIColor.clear : self.theme.cardBackColor
            }
        }
        self.flipCountLabel.text = "Flips: \(self.game.flipCount)"
        self.scoreLabel.text = "Score: \(self.game.score)"
    }

    private func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, self.theme.emojis.count > 0 {
            let randIndex = Int.random(in: 0..<self.theme.emojis.count)
            emoji[card.identifier] = self.theme.emojis.remove(at: randIndex)
        }

        return emoji[card.identifier] ?? "?"
    }

}
