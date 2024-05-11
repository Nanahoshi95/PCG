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
        return cardType == .Bench ? 60 : 90
    }
    
    // 高さ
    var height: CGFloat {
        return cardType == .Bench ? 80: 120
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
