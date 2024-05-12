import SwiftUI

/// 自分のバトル場
struct MyBattleZone: View {
    
    @State var battleCard: PokemonUICard? =  PokemonUICard(id: UUID(), number: "037479", evolution: .Basic, category: .V, hitPoint: 180, maxHitPoint: 180, energies: [EnergyUICard(id: UUID(), type: .Glass)], type: .Glass, move1: Move(number: "", index: 1, name: "1", energies: []), retreatCount: 1, damage: 100, canEvolution: false)
    
    @Binding var selectedCard: Card?
    
    @Namespace private var namespace
    
    var body: some View {
        ZStack {
            if let card = battleCard {
                let c = Card(id: card.id, number: card.number, category: .Pokemon)
                if selectedCard != c {
                    BattleCard(card: card)
                    .onTapGesture {
                        selectedCard = c
                    }
                    .matchedGeometryEffect(id: card.id, in: namespace)
                    .animation(.easeOutExpo, value: selectedCard)
                }
            }
        }
    }
}

#Preview {
    MyBattleZone(selectedCard: .constant(Card(id: UUID(), number: "037479", category: .Pokemon)))
}
