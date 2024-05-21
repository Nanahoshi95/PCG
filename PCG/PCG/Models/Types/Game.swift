//
//  Game.swift
//  PCG
//
//  Created by yamaji on 2024/05/20.
//

import Foundation

struct Game: Codable, Identifiable {
    
    let id: String
    
    var player1Id: String
    var player2Id: String
    
    var activePlayerId: String
    
    var player1Hand: HandModel
    var player2Hand: HandModel
    
    var player1Bench: BenchModel
    var player2Bench: BenchModel
    
    var player1BattleZone: BattleZoneModel
    var player2BattleZone: BattleZoneModel
    
    var player1TrainersZone: TrainersZoneModel
    var player2TrainersZone: TrainersZoneModel
    
    var player1Deck: DeckModel
    var player2Deck: DeckModel
}
