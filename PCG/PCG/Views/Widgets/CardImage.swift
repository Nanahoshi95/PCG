import SwiftUI

struct CardImage: View {
    
    /// サイズ
    enum CardType {
        case Hand, Bench, BattleZone
    }
    
    /// 画像番号
    var cardNo: String
    
    /// カード種別
    var cardType: CardType
    
    // 幅
    var width: CGFloat {
        cardType == .Bench ? Sizes.benchCardWidth : Sizes.cardWidth
    }
    
    // 高さ
    var height: CGFloat {
        cardType == .Bench ? Sizes.benchCardHeight: Sizes.cardHeight
    }
    
    
    var body: some View {
        Image(cardNo)
            .resizable()
            .frame(width: width, height: height)
    }
}

#Preview {
    CardImage(cardNo: "037479", cardType: .BattleZone)
}
