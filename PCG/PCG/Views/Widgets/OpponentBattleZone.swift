import SwiftUI

/// 相手のバトル場
struct OpponentBattleZone: View {
    
    @ObservedObject var cardVM: CardViewModel
    
    var body: some View {
        ZStack {
            if let card = cardVM.opponentBattleZone.card {
                BattleCard(card: card)
            }
        }
        .rotationEffect(Angle(degrees: 180), anchor: .center)
    }
}

#Preview {
    OpponentBattleZone(cardVM: CardViewModel())
}
