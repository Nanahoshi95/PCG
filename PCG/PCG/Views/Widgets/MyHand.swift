import SwiftUI

/// 自分の手札
struct MyHand: View {
    
    @Binding var hand: HandModel
    
    @GestureState private var dragOffset = CGSize.zero
    
    @State private var selected: Card? = nil
    
    var body: some View {
        
        HStack(spacing: -50) {
            ForEach(hand.cards) {
                card in
                
                CardImage(cardNo: card.number, cardType: .Hand)
                    .offset(x: selected == card ? dragOffset.width : 0,
                            y: selected == card ? dragOffset.height : 0)
                    .zIndex(selected == card ? 1 : 0)
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
            }
        }
    }
}
