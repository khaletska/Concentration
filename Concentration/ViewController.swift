//
//  ViewController.swift
//  Concentration
//
//  Created by Yeliena Khaletska on 02.06.2024.
//

import UIKit

struct Theme {
    let backgroundColor: UIColor
    let cardBackColor: UIColor
    var emojis: Array<String>
}

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
        self.theme = Self.themes.randomElement() ?? nil
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

extension ViewController {

    private static var themes: Array<Theme> = [
        Theme(backgroundColor: UIColor.darkGray, cardBackColor: UIColor.systemYellow, emojis: ["🧑‍🎓" , "🧑‍🏫", "🧑‍⚖️", "🧑‍🌾", "🧑‍🍳", "🧑‍🔧", "🧑‍🔬", "🧑‍💻", "🧑‍🚀", "🧑‍🚒", "🧑‍✈️", "👮", "🕵️", "💂", "🥷", "👷"]),
        Theme(backgroundColor: UIColor.systemBrown, cardBackColor: UIColor.brown, emojis: ["🍞", "🥐", "🥖", "🥨", "🥯", "🥞", "🧇", "🍩", "🍪"]), // pastry
        Theme(backgroundColor: UIColor.systemBlue, cardBackColor: UIColor.systemTeal, emojis: ["🐳", "🦭", "🐬", "🐟", "🐠", "🐡", "🦈", "🐙", "🪼"]), // ocean
        Theme(backgroundColor: UIColor.systemIndigo, cardBackColor: UIColor.systemPink, emojis: ["🦸", "🦹", "🧙", "🧚", "🧛", "🧜", "🧞", "🧝‍♀️", "🧟"]), // creatures
        Theme(backgroundColor: UIColor.systemGray, cardBackColor: UIColor.systemRed, emojis: ["🍔", "🍟", "🍕", "🌭", "🌮", "🌯", "🍿", "🍣", "🍜"]), // street food
        Theme(backgroundColor: UIColor.darkGray, cardBackColor: UIColor.gray, emojis: ["❤️", "🩷", "🧡", "💛", "💚", "💙", "🩵", "💜", "🤎"]), // colors
        Theme(backgroundColor: UIColor.systemGray, cardBackColor: UIColor.systemGreen, emojis: ["🐥", "🕊️", "🦆", "🦅", "🦉", "🦜", "🦚", "🦩", "🐓"]), // birds
        Theme(backgroundColor: UIColor.systemGray, cardBackColor: UIColor.systemGreen, emojis: ["🍅", "🍆", "🥔", "🥕", "🌽", "🫑", "🥒", "🥦", "🍄‍🟫"]), // veggies
        Theme(backgroundColor: UIColor.systemGray, cardBackColor: UIColor.systemGreen, emojis: ["🍇", "🍉", "🥝", "🍌", "🍓", "🍍", "🥥", "🍒", "🍑"]), // fruites
        Theme(backgroundColor: UIColor.systemGray, cardBackColor: UIColor.systemGreen, emojis: ["🦁", "🐵", "🦊", "🐯", "🐱", "🐶", "🐮", "🐷", "🐭"]), // animals
    ]

}
