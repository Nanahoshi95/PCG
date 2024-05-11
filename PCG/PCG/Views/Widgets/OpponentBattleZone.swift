import SwiftUI

/// 相手のバトル場
struct OpponentBattleZone: View {
    
    var battleCard: PokemonUICard?
    
    var body: some View {
        ZStack {
            if let card = battleCard {
                CardImage(cardNo: card.number, cardType: .BattleZone)
                
                BattleZoneEnergies(energies: card.energies)
                .offset(x: 0, y: 45)
                
                if let damage = card.damage {
                    DamageCount(damage: damage)
                }
                
                CardStatus(card: card)
                .frame(width: 90, height: 120, alignment: .topTrailing)
                .offset(y: 1)
            }
        }
        .rotationEffect(Angle(degrees: 180), anchor: .center)
    }
}

#Preview {
    OpponentBattleZone(battleCard: PokemonUICard(id: UUID(), number: "037479", evolution: .Basic, category: .V, hitPoint: 180, maxHitPoint: 180, energies: [EnergyUICard(id: UUID(), type: .Glass)], type: .Glass, move1: Move(number: "", index: 1, name: "1", energies: []), retreatCount: 1, damage: 100, canEvolution: false))
}
