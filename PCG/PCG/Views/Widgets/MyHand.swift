import SwiftUI

/// 自分の手札
struct MyHand: View {
    
    @ObservedObject var cardVM: CardViewModel
    
    @GestureState private var dragOffset = CGSize.zero
    
    @State private var selected: Card? = nil
    
    var body: some View {
        
        HStack(spacing: -50) {
            ForEach(cardVM.myHand.cards) {
                card in
                
                CardImage(cardNo: card.number, cardType: .Hand)
                    .offset(x: selected == card ? dragOffset.width : 0,
                            y: selected == card ? dragOffset.height : 0)
                    .zIndex(selected == card ? 1 : 0)
                    .gesture(DragGesture( coordinateSpace: .global)
                        .onChanged { value in
                            onDragChanged(value: value, card: card)
                        }
                        .updating($dragOffset) { (value, state, transition) in
                            state = value.translation
                        }.onEnded(onDragEnded))
            }
        }
    }
}

private extension MyHand {
    func onDragChanged(value: DragGesture.Value, card: Card) {
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
    MyHand(cardVM: CardViewModel())
}
