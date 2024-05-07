import SwiftUI

/// 自分のバトル場
struct MyBattleZone: View {
    var body: some View {
        VStack {
            CardImage(cardNo: "037479", size: .Normal)
        }
    }
}

#Preview {
    MyBattleZone()
}
