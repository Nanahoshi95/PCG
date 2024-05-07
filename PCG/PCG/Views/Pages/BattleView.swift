import SwiftUI

/// 対戦画面
struct BattleView: View {
    
    @State private var myHands: [PokemonUICard] = [
        PokemonUICard(id: UUID(), number: "037479", evolution: .Basic, category: .V, hitPoint: 180, maxHitPoint: 180, energies: [EnergyUICard(id: UUID(), type: .Glass)], type: .Glass, move1: Move(number: "", index: 1, name: "1", energies: []), retreatCount: 1, damage: 100, canEvolution: false),
        PokemonUICard(id: UUID(), number: "037479", evolution: .Basic, category: .V, hitPoint: 180, maxHitPoint: 180, energies: [EnergyUICard(id: UUID(), type: .Glass)], type: .Glass, move1: Move(number: "", index: 1, name: "1", energies: []), retreatCount: 1, canEvolution: false),        PokemonUICard(id: UUID(), number: "037479", evolution: .Basic, category: .V, hitPoint: 180, maxHitPoint: 180, energies: [EnergyUICard(id: UUID(), type: .Glass)], type: .Glass, move1: Move(number: "", index: 1, name: "1", energies: []), retreatCount: 1, canEvolution: false),        PokemonUICard(id: UUID(), number: "037479", evolution: .Basic, category: .V, hitPoint: 180, maxHitPoint: 180, energies: [EnergyUICard(id: UUID(), type: .Glass)], type: .Glass, move1: Move(number: "", index: 1, name: "1", energies: []), retreatCount: 1, canEvolution: false),        PokemonUICard(id: UUID(), number: "037479", evolution: .Basic, category: .V, hitPoint: 180, maxHitPoint: 180, energies: [EnergyUICard(id: UUID(), type: .Glass)], type: .Glass, move1: Move(number: "", index: 1, name: "1", energies: []), retreatCount: 1, canEvolution: false),]
    
    var body: some View {
        ZStack {
            VStack {
                
                OpponentHand(myHands: myHands)
                
                OpponentBench(myHands: myHands)
                
                OpponentBattleZone()
                
                Spacer()
                
                MyBattleZone()
                
                MyBench(myHands: myHands)
                
                MyHand(myHands: myHands)
                
            }
        }
    }
}

#Preview {
    BattleView()
}
