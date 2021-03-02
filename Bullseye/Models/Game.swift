//
//  game.swift
//  Bullseye
//
//  Created by Marty Heavey on 3/1/21.
//

import Foundation

struct Game {
    var target: Int = Int.random(in: 1...100)
    var totalScore: Int = 0
    var roundNumber: Int = 1
    
    func points(sliderValue: Int, target: Int) -> Int {
        return 100 - abs(sliderValue - target)
    }
}
