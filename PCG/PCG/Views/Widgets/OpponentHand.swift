import SwiftUI

/// 相手の手札
struct OpponentHand: View {
    
    @ObservedObject var cardVM: CardViewModel
    
    var body: some View {
        VStack {
            LazyVGrid(columns: Array(repeating: GridItem(.fixed(10)), count: cardVM.opponentHand.cards.count)) {
                ForEach(cardVM.opponentHand.cards) {
                    card in
                    CardImage(cardNo: "Back", cardType: .Hand)
                }
            }
        }
        .rotationEffect(Angle(degrees: 180), anchor: .center)
    }
}

#Preview {
    OpponentHand(cardVM: CardViewModel())
}
