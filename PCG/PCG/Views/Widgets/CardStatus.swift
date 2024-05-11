//
//  CardStatus.swift
//  PCG
//
//  Created by yamaji on 2024/05/08.
//

import SwiftUI

struct CardStatus: View {
    
    var card: PokemonUICard
    
    var body: some View {
        ZStack {
            HStack {
                
                Spacer()
                
                Text("\(card.hitPoint)")
                    .font(.system(size: 10, weight: .black, design: .default))
                
                Image("GlassEnergy")
                    .resizable()
                    .frame(width: 10, height: 10)
                    .offset(x: -5)
            }
            .frame(width: 50, height: 15)
            .background(Color.white)
            .cornerRadius(20)
        }
    }
}

#Preview {
    CardStatus(card: PokemonUICard(id: UUID(), number: "037479", evolution: .Basic, category: .V, hitPoint: 180, maxHitPoint: 180, energies: [EnergyUICard(id: UUID(), type: .Glass)], type: .Glass, move1: Move(number: "", index: 1, name: "1", energies: []), retreatCount: 1, damage: 100, canEvolution: false))
}
