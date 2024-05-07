import SwiftUI

/// 相手のバトル場
struct OpponentBattleZone: View {
    var body: some View {
        VStack {
            CardImage(cardNo: "037479", size: .Normal)
        }
        .rotationEffect(Angle(degrees: 180), anchor: .center)
    }
}

#Preview {
    OpponentBattleZone()
}
