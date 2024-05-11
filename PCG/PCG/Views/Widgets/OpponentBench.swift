import SwiftUI

/// 相手のベンチ
struct OpponentBench: View {
    
    @Binding var myHands: [PokemonUICard]
    
    @GestureState private var dragOffset = CGSize.zero
    
    @State private var selected: PokemonUICard? = nil
    
    var body: some View {
        HStack(spacing: 0) {
                ForEach(myHands) { card in
                    ZStack {
                        CardImage(cardNo: card.number, cardType: .Bench)
                            .gesture(DragGesture( coordinateSpace: .global)
                                .onChanged { value in
                                    
                                    
                                    // 選択したカードを保持
                                    if selected == nil {
                                        selected = card
                                    }
                                    
                                    
                                }
                                .updating($dragOffset, body: { (value, state, transition) in
                                    
                                    state = value.translation
                                    
                                }).onEnded { event in
                                    // カードの選択解除
                                    selected = nil
                                })
                        
                        if let damage = card.damage {
                            DamageCount(damage: damage)
                            .offset(x: 0, y: 0)
                        }
                        
                        BenchCardEnergies(energies: card.energies)
                            .offset(x: 0, y: 35)
                        
                        
                        CardStatus(card: card)
                        .frame(width: 60, height: 80, alignment: .topTrailing)
                        .offset(y: 1)
                    }
                    .offset(x: selected == card ? -dragOffset.width : 0,
                            y: selected == card ? -dragOffset.height : 0)
                    .zIndex(selected == card ? 1 : 0)
                }
            }
        .zIndex(selected == nil ? 0 : 99)
        .rotationEffect(Angle(degrees: 180), anchor: .center)
    }
}
