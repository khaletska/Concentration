//
//  Themes.swift
//  Concentration
//
//  Created by Yeliena Khaletska on 04.06.2024.
//

import Foundation
import UIKit

struct Theme {

    let backgroundColor: UIColor
    let cardBackColor: UIColor
    var emojis: Array<String>

    static func getRandom() -> Theme {
        Self.all.randomElement()!
    }

    private static let all: Array<Theme> = [
        .init(backgroundColor: .darkGray, cardBackColor: .systemYellow, emojis: ["🧑‍🎓" , "🧑‍🏫", "🧑‍⚖️", "🧑‍🌾", "🧑‍🍳", "🧑‍🔧", "🧑‍🔬", "🧑‍💻", "🧑‍🚀", "🧑‍🚒", "🧑‍✈️", "👮", "🕵️", "💂", "🥷", "👷"]),
        .init(backgroundColor: .systemBrown, cardBackColor: .brown, emojis: ["🍞", "🥐", "🥖", "🥨", "🥯", "🥞", "🧇", "🍩", "🍪"]), // pastry
        .init(backgroundColor: .systemBlue, cardBackColor: .systemTeal, emojis: ["🐳", "🦭", "🐬", "🐟", "🐠", "🐡", "🦈", "🐙", "🪼"]), // ocean
        .init(backgroundColor: .systemIndigo, cardBackColor: .systemPink, emojis: ["🦸", "🦹", "🧙", "🧚", "🧛", "🧜", "🧞", "🧝‍♀️", "🧟"]), // creatures
        .init(backgroundColor: .systemGray, cardBackColor: .systemRed, emojis: ["🍔", "🍟", "🍕", "🌭", "🌮", "🌯", "🍿", "🍣", "🍜"]), // street food
        .init(backgroundColor: .darkGray, cardBackColor: .gray, emojis: ["❤️", "🩷", "🧡", "💛", "💚", "💙", "🩵", "💜", "🤎"]), // colors
        .init(backgroundColor: .systemGray, cardBackColor: .systemGreen, emojis: ["🐥", "🕊️", "🦆", "🦅", "🦉", "🦜", "🦚", "🦩", "🐓"]), // birds
        .init(backgroundColor: .systemGray, cardBackColor: .systemGreen, emojis: ["🍅", "🍆", "🥔", "🥕", "🌽", "🫑", "🥒", "🥦", "🍄‍🟫"]), // veggies
        .init(backgroundColor: .systemGray, cardBackColor: .systemGreen, emojis: ["🍇", "🍉", "🥝", "🍌", "🍓", "🍍", "🥥", "🍒", "🍑"]), // fruites
        .init(backgroundColor: .systemGray, cardBackColor: .systemGreen, emojis: ["🦁", "🐵", "🦊", "🐯", "🐱", "🐶", "🐮", "🐷", "🐭"]), // animals
    ]

}
