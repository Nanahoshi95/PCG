import SwiftUI

/// 自分のバトル場
struct MyBattleZone: View {
    
    @ObservedObject var cardVM: CardViewModel
    
    @Binding var selectedCard: Card?
    
    @Namespace private var namespace
    
    var body: some View {
        ZStack {
            if let card = cardVM.myBattleZone.card {
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
    MyBattleZone(cardVM: CardViewModel(), selectedCard: .constant(Card(id: UUID(), number: "037479", category: .Pokemon)))
}
