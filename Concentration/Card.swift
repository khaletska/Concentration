//
//  Card.swift
//  Concentration
//
//  Created by Yeliena Khaletska on 03.06.2024.
//

import Foundation

struct Card
{
    var isFaceUp = false
    var isMatched = false
    // identifier is an index of emoji in the theme
    let identifier: Int

    static var identifierFactory = 0
    static func getUniqeIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }

    init() {
        self.identifier = Card.getUniqeIdentifier()
    }
}
