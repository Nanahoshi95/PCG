import SwiftUI

/// 相手のベンチ
struct OpponentBench: View {
    
    @ObservedObject var cardVM: CardViewModel
    
    @GestureState private var dragOffset = CGSize.zero
    
    @State private var selected: PokemonUICard? = nil
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0 ..< 5) { index in
                if index < cardVM.opponentBench.cards.count {
                    let card = cardVM.opponentBench.cards[index]
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
    OpponentBench(cardVM: CardViewModel())
}
