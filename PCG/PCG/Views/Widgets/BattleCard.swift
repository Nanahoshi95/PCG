//
//  BattleCard.swift
//  PCG
//
//  Created by yamaji on 2024/05/12.
//

import SwiftUI

struct BattleCard: View {
    
    let card: PokemonUICard
    
    var body: some View {
        ZStack {
            CardImage(cardNo: card.number, cardType: .BattleZone)
            
            BattleZoneEnergies(energies: card.energies)
                .offset(x: 0, y: 55)
            
            if let damage = card.damage {
                DamageCount(damage: damage)
            }
            
            CardStatus(card: card)
                .frame(width: Sizes.cardWidth, height: Sizes.cardHeight, alignment: .topTrailing)
                .offset(y: 1)
        }
    }
}

#Preview {
    BattleCard(card: PokemonUICard(id: UUID(), number: "037479", evolution: .Basic, category: .V, hitPoint: 180, maxHitPoint: 180, energies: [EnergyUICard(id: UUID(), type: .Glass)], type: .Glass, move1: Move(number: "", index: 1, name: "1", energies: []), retreatCount: 1, damage: 100, canEvolution: false))
}
