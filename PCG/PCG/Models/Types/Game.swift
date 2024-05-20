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
    
    
}
