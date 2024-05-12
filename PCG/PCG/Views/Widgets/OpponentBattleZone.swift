import SwiftUI

/// 相手のバトル場
struct OpponentBattleZone: View {
    
    @State var battleCard: PokemonUICard? =  PokemonUICard(id: UUID(), number: "037479", evolution: .Basic, category: .V, hitPoint: 180, maxHitPoint: 180, energies: [EnergyUICard(id: UUID(), type: .Glass)], type: .Glass, move1: Move(number: "", index: 1, name: "1", energies: []), retreatCount: 1, damage: 100, canEvolution: false)
    
    var body: some View {
        ZStack {
            if let card = battleCard {
                BattleCard(card: card)
            }
        }
        .rotationEffect(Angle(degrees: 180), anchor: .center)
    }
}

#Preview {
    OpponentBattleZone()
}
