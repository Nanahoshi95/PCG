import SwiftUI

/// 相手のベンチ
struct OpponentBench: View {
    
    @Binding var cards: [PokemonUICard]
    
    @GestureState private var dragOffset = CGSize.zero
    
    @State private var selected: PokemonUICard? = nil
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0 ..< 5) { index in
                    if index < cards.count {
                        let card = cards[index]
                        BenchCard(card: card)
                            .gesture(DragGesture( coordinateSpace: .global)
                                .onChanged { value in
                                    onDragChanged(value: value, card: card)
                                }
                                .updating($dragOffset) { value, state, transition in
                                    state = value.translation
                                }.onEnded(onDragEnded))
                            .offset(x: selected == card ? -dragOffset.width : 0,
                                    y: selected == card ? -dragOffset.height : 0)
                            .zIndex(selected == card ? 1 : 0)
                    }
                        
                }
            }
        .zIndex(selected == nil ? 0 : 99)
        .rotationEffect(Angle(degrees: 180), anchor: .center)
    }
}

private extension OpponentBench {
    func onDragChanged(value: DragGesture.Value, card: PokemonUICard) {
        // 選択したカードを保持
        if selected == nil {
            selected = card
        }
    }
    
    func onDragEnded(_ value: DragGesture.Value) {
        // カードの選択解除
        selected = nil
    }
}

#Preview {
    OpponentBench(cards: .constant([PokemonUICard(id: UUID(), number: "037479", evolution: .Basic, category: .V, hitPoint: 180, maxHitPoint: 180, energies: [EnergyUICard(id: UUID(), type: .Glass)], type: .Glass, move1: Move(number: "", index: 1, name: "1", energies: []), retreatCount: 1, damage: 100, canEvolution: false),
                              PokemonUICard(id: UUID(), number: "037479", evolution: .Basic, category: .V, hitPoint: 180, maxHitPoint: 180, energies: [EnergyUICard(id: UUID(), type: .Glass)], type: .Glass, move1: Move(number: "", index: 1, name: "1", energies: []), retreatCount: 1, canEvolution: false),        PokemonUICard(id: UUID(), number: "037479", evolution: .Basic, category: .V, hitPoint: 180, maxHitPoint: 180, energies: [EnergyUICard(id: UUID(), type: .Glass)], type: .Glass, move1: Move(number: "", index: 1, name: "1", energies: []), retreatCount: 1, canEvolution: false),        PokemonUICard(id: UUID(), number: "037479", evolution: .Basic, category: .V, hitPoint: 180, maxHitPoint: 180, energies: [EnergyUICard(id: UUID(), type: .Glass)], type: .Glass, move1: Move(number: "", index: 1, name: "1", energies: []), retreatCount: 1, canEvolution: false),        PokemonUICard(id: UUID(), number: "037479", evolution: .Basic, category: .V, hitPoint: 180, maxHitPoint: 180, energies: [EnergyUICard(id: UUID(), type: .Glass)], type: .Glass, move1: Move(number: "", index: 1, name: "1", energies: []), retreatCount: 1, canEvolution: false),]))
}
