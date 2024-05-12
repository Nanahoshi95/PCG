//
//  BenchCard.swift
//  PCG
//
//  Created by yamaji on 2024/05/12.
//

import SwiftUI

struct BenchCard: View {
    
    let card: PokemonUICard
    
    var body: some View {
        ZStack {
            CardImage(cardNo: card.number, cardType: .Bench)
            
            if let damage = card.damage {
                DamageCount(damage: damage)
                    .offset(x: 0, y: 0)
            }
            
            BenchCardEnergies(energies: card.energies)
                .offset(x: 10, y: 35)
            
            
            CardStatus(card: card)
                .frame(width: Sizes.benchCardWidth, height: Sizes.benchCardHeight, alignment: .topTrailing)
                .offset(x: -4, y: 4)
        }
    }
}

#Preview {
    BenchCard(card: PokemonUICard(id: UUID(), number: "037479", evolution: .Basic, category: .V, hitPoint: 180, maxHitPoint: 180, energies: [EnergyUICard(id: UUID(), type: .Glass)], type: .Glass, move1: Move(number: "", index: 1, name: "1", energies: []), retreatCount: 1, damage: 100, canEvolution: false))
}
